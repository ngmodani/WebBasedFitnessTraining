/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.controller;

import edu.neu.ngmodani.dao.CustomerDAO;
import edu.neu.ngmodani.dao.RoutineDAO;
import edu.neu.ngmodani.pojo.Customer;
import edu.neu.ngmodani.pojo.Routine;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author ngmodani
 */
public class ViewRoutineController extends AbstractController {

    CustomerDAO cDao;
    RoutineDAO rDao;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest hsr, HttpServletResponse hsr1) {
        rDao = new RoutineDAO();
        cDao = new CustomerDAO();
        ModelAndView mv = new ModelAndView();
        try {
            String action = hsr.getParameter("action");
            if (action.equals("delete")) {
                int rID = Integer.parseInt(hsr.getParameter("routineid"));
                rDao.delete(rDao.get(rID));
                return null;
            }
            if (action.equals("view")) {
                Customer c = cDao.get((String) hsr.getSession().getAttribute("userName"));
                List<Routine> routine = rDao.getRoutine(c);
                mv.addObject("routine", routine);
                //mv.addObject("cust", c);
                mv.setViewName("viewmyroutine");
                return mv;
            }
            int id = Integer.parseInt(hsr.getParameter("cust"));
            Customer c = cDao.get(id);
            List<Routine> routine = rDao.getRoutine(c);
            // List<Routine> routine = cDao.getRoutine(c);
            mv.addObject("routine", routine);
            mv.addObject("custom", c);
            mv.setViewName("viewroutine");
        } catch (Exception e) {
            HttpSession session = hsr.getSession();
            session.removeAttribute("userName");
            session.invalidate();
            mv.setViewName("invalid");
        }
        return mv;
    }

}
