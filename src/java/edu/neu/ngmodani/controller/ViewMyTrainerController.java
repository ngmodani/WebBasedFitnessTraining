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
 * @author ngmodani
 */
public class ViewMyTrainerController extends AbstractController {

    public ViewMyTrainerController() {
    }

    @Override
    public ModelAndView handleRequestInternal(HttpServletRequest hsr, HttpServletResponse hsr1) {

        ModelAndView mv = new ModelAndView();
        try {
            HttpSession session = hsr.getSession();
            String userName = (String) session.getAttribute("userName");
            CustomerDAO cDao = new CustomerDAO();
            Customer user = cDao.get(userName);
            Customer trainer = cDao.get(user.getTrainerUserName());

            if (trainer != null) {
                mv.addObject("trainer", trainer);
            }
            mv.setViewName("viewmytrainer");
        } catch (Exception e) {
            HttpSession session = hsr.getSession();
            session.removeAttribute("userName");
            session.invalidate();
            mv.setViewName("invalid");
        }
        return mv;
    }
}
