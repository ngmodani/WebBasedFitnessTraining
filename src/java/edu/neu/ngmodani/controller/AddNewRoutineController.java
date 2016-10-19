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
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/**
 *
 * @author ngmodani
 */
public class AddNewRoutineController extends SimpleFormController {

    CustomerDAO customerDao;
    RoutineDAO routineDAO;

    public AddNewRoutineController() {

    }

    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) {

        ModelAndView mv = new ModelAndView();
        try {
            customerDao = new CustomerDAO();
            Customer customer;
            Routine routine = (Routine) command;
            //String user = (String) request.getAttribute("cust");
            int id = Integer.parseInt(request.getParameter("cust"));
            customer = customerDao.get(id);
            // Routine routine = new Routine();
            routine.setCustomer(customer);
            routine.setDate(new Date());
            customer.getRoutine().add(routine);
            routineDAO = new RoutineDAO();
            routineDAO.save(routine);
            mv.setViewName("success");
        } catch (Exception e) {
            HttpSession session = request.getSession();
            session.removeAttribute("userName");
            session.invalidate();
            mv.setViewName("invalid");
        }
        return mv;
    }

    @Override
    protected void onFormChange(HttpServletRequest request, HttpServletResponse response, Object command) throws Exception {
        customerDao = new CustomerDAO();
        Customer customer;
        Routine routine = (Routine) command;
        //String user = (String) request.getAttribute("cust");
        int id = Integer.parseInt(request.getParameter("cust"));
        customer = customerDao.get(id);
        // Routine routine = new Routine();
        routine.setCustomer(customer);
        customer.getRoutine().add(routine);

        //routineDAO = new RoutineDAO();
//        routineDAO.update(routine);
    }
    /*
     @Override
     protected void doSubmitAction(Object command) throws Exception {
     Routine routine = (Routine) command;
     routineDAO = new RoutineDAO();

     routineDAO.update(routine);

     //        customerDao.create(r);
     }
     /*
     @Override
     protected Object formBackingObject(HttpServletRequest request) throws Exception {
     customerDao = new CustomerDAO();
     Customer customer;
     //String user = (String) request.getAttribute("cust");
     int id = Integer.parseInt(request.getParameter("cust"));
     customer = customerDao.get(id);
     Routine routine = new Routine();
     routine.setCustomer(customer);
     customer.getRoutine().add(routine);
     return routine;
     }
     */

}
