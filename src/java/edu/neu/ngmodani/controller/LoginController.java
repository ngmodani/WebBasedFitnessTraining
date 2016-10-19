/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.controller;

import edu.neu.ngmodani.dao.CustomerDAO;
import edu.neu.ngmodani.pojo.Customer;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author Kiran
 */
public class LoginController extends AbstractController {

    public LoginController() {
    }

    @Override
    public ModelAndView handleRequestInternal(HttpServletRequest hsr, HttpServletResponse hsr1) {

        String action = hsr.getParameter("action");

        ModelAndView mv = new ModelAndView();
        //mv.setViewName("index");
        try {
            if (action.equals("logout")) {
                HttpSession session = hsr.getSession();
                session.removeAttribute("userName");
                session.invalidate();
                mv.setViewName("index");
            }

            if (action.equals("login")) {
                HttpSession session = hsr.getSession();

                /*/if session exists then redirect to user view
                 if (session.getAttribute("userName") != null) {
                 mv.setViewName("userview");
                 }
                 */
                String userName = hsr.getParameter("username");
                String password = hsr.getParameter("password");

                CustomerDAO cDao = new CustomerDAO();
                Customer user = cDao.get(userName, password);
                if (user == null) {
                    mv.setViewName("index");
                    mv.addObject("error", "true");
                } else if (user.getMembership_type().equalsIgnoreCase("Customer")) {
                    mv.setViewName("customerview");
                    mv.addObject("user", user);
                    session.setAttribute("userName", userName);
                } else if (user.getMembership_type().equalsIgnoreCase("Trainer")) {
                    mv.setViewName("trainerview");
                    mv.addObject("user", user);
                    List<Customer> custList;
                    custList = cDao.getCustomerByTrainer(user);
                    mv.addObject("custList", custList);
                    session.setAttribute("userName", userName);
                } else if (user.getMembership_type().equalsIgnoreCase("Admin")) {
                    mv.setViewName("adminview");
                    mv.addObject("user", user);
                    session.setAttribute("userName", userName);
                }

            }

            if (action.equals("home")) {
                HttpSession session = hsr.getSession();
                String userName = (String) session.getAttribute("userName");
                CustomerDAO cDao = new CustomerDAO();
                Customer user = cDao.get(userName);
                mv.addObject("user", user);

                if (user.getMembership_type().equals("Trainer")) {
                    List<Customer> custList;
                    custList = cDao.getCustomerByTrainer(user);
                    mv.addObject("custList", custList);
                    mv.setViewName("trainerview");
                }

                if (user.getMembership_type().equals("Customer")) {
                    mv.setViewName("customerview");
                }
                if (user.getMembership_type().equals("Admin")) {
                    mv.setViewName("adminview");
                }
            }
        } catch (Exception e) {
            HttpSession session = hsr.getSession();
            session.removeAttribute("userName");
            session.invalidate();
            mv.setViewName("invalid");
        }

        return mv;
    }
}
