/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.controller;

import edu.neu.ngmodani.dao.CustomerDAO;
import edu.neu.ngmodani.pojo.Customer;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.mvc.SimpleFormController;

/**
 *
 * @author ngmodani
 */
public class UpdateProfileController extends SimpleFormController {

    CustomerDAO customerDao;

    public UpdateProfileController() {
    }

    @Override
    protected void doSubmitAction(Object command) throws Exception {

        Customer customer = (Customer) command;
        File file;
        String check = File.separator; //Checking if system is linux based or windows based by checking seprator used.
        String path = null;

        if (check.equalsIgnoreCase("\\")) {
            path = getServletContext().getRealPath("").replace("build\\", ""); //Netbeans projects gives real path as Lab6/build/web/ so we need to replace build in the path.
        }

        if (check.equalsIgnoreCase("/")) {
            path = getServletContext().getRealPath("").replace("build/", "");
            path += "/"; //Adding trailing slash for Mac systems.
        }

        if (customer.getPhoto() != null) {
            String fileNameWithExt = customer.getPhoto().getOriginalFilename();
            file = new File(path + fileNameWithExt);
            String context = getServletContext().getContextPath();

            customer.getPhoto().transferTo(file);
            customer.setPhotoName(context + "/" + fileNameWithExt);
            customerDao = new CustomerDAO();
            customerDao.update(customer);
        }

    }

    @Override
    protected Object formBackingObject(HttpServletRequest request) throws Exception {

        customerDao = new CustomerDAO();
        Customer customer;
        String user = (String) request.getSession().getAttribute("userName");
        customer = customerDao.get(user);
        return customer; //To change body of generated methods, choose Tools | Templates.
    }

}
