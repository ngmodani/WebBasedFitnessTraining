/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.controller;

import edu.neu.ngmodani.dao.CustomerDAO;
import edu.neu.ngmodani.pojo.Customer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author ngmodani
 */
public class RateTrainerController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) {
        CustomerDAO cDao = new CustomerDAO();
        ModelAndView mv = new ModelAndView();
        try {
            Customer c = cDao.get((String) hsr.getSession().getAttribute("userName"));
            String action = hsr.getParameter("action");
            if (action.equals("rate")) {
                if (c.getTrainerUserName() == null) {
                    mv.addObject("error", "true");
                }
                mv.setViewName("ratetrainer");
            }
            if (action.equals("save")) {
                Customer trainer = cDao.get(c.getTrainerUserName());
                int r1 = Integer.parseInt(hsr.getParameter("rating1"));
                int r2 = Integer.parseInt(hsr.getParameter("rating2"));
                int r3 = Integer.parseInt(hsr.getParameter("rating3"));
                int r4 = Integer.parseInt(hsr.getParameter("rating4"));
                int r5 = Integer.parseInt(hsr.getParameter("rating5"));
                int finalRating = (r1 + r2 + r3 + r4 + r5) / 5;
                trainer.setRatings(finalRating);
                cDao.update(trainer);
                mv.setViewName("success");
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
