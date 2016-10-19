/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.controller;

import edu.neu.ngmodani.dao.CustomerDAO;
import edu.neu.ngmodani.pojo.Customer;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author ngmodani
 */
public class SelectTrainerController implements Controller {

    public SelectTrainerController() {
    }

    @Override
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) {

        //   String action = hsr.getParameter("action");
        CustomerDAO cDao = new CustomerDAO();

        ModelAndView mv = new ModelAndView();
        //String action = hsr.getParameter("action");
        // CustomerDAO cDao = new CustomerDAO();
        try {
            Customer customer;
            String user = (String) hsr.getSession().getAttribute("userName");
            customer = cDao.get(user);
            if (customer.getTrainerUserName() != null) {
                mv.addObject("currTrainer", cDao.get(customer.getTrainerUserName()));
            }
            mv.setViewName("findtrainer");
        } catch (Exception e) {
            HttpSession session = hsr.getSession();
            session.removeAttribute("userName");
            session.invalidate();
            mv.setViewName("invalid");
        }
        return mv;
    }

}

/*
 if (action != null) {
 if (action.equals("searchByName")) {
 String key = hsr.getParameter("key");
 List<Customer> trainerList;
 trainerList = cDao.getTrainerByName(key);
 JSONObject obj = new JSONObject();
 obj.put("users", trainerList);
 PrintWriter out = hsr1.getWriter();
 out.println(obj);
 return null;
 }
 if (action.equals("searchBySpecialty")) {
 String key = hsr.getParameter("key");
 List<Customer> trainerList;
 trainerList = cDao.getTrainerByName(key);
 JSONObject obj = new JSONObject();
 obj.put("users", trainerList);
 PrintWriter out = hsr1.getWriter();
 out.println(obj);
 return null;
 }

 if (action.equals("select")) {
 int id = Integer.parseInt(hsr.getParameter("trainer"));
 Customer customer;
 String user = (String) hsr.getSession().getAttribute("userName");
 customer = cDao.get(user);
 Customer trainer = cDao.get(id);
 if (cDao.selectTrainer(customer, trainer)) {
 JSONObject obj = new JSONObject();
 obj.put("message", "Trainer Selected Successfully!");
 PrintWriter out = hsr1.getWriter();
 out.println(obj);
 //return null;
 } else {
 JSONObject obj = new JSONObject();
 obj.put("message", "Please Try Again!");
 PrintWriter out = hsr1.getWriter();
 out.println(obj);
 return null;
 }
 }
 }
 //return null;
 */
