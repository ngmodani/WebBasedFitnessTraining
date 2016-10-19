/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.controller;

import edu.neu.ngmodani.dao.CustomerDAO;
import edu.neu.ngmodani.pojo.Customer;
import org.springframework.web.servlet.mvc.SimpleFormController;

/**
 *
 * @author ngmodani
 */
public class RegistrationController extends SimpleFormController {

    CustomerDAO customerDao;

    public RegistrationController() {
    }

    @Override
    protected void doSubmitAction(Object command) throws Exception {
        Customer customer = (Customer) command;
        customerDao = new CustomerDAO();
        if(customer.getMembership_type().equals("Trainer")){
            customer.setSpeciality("generic");
            customer.setRatings(1);
        }
        customerDao.create(customer);
        
    }
}
