/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.validator;

import edu.neu.ngmodani.pojo.Customer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ngmodani
 */
public class RegValidator implements Validator {

    //private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    //private static final String FIELD_PATTERN = "^[A-Za-z0-9 ​_]*[A-Za-z0-9][A-Za-z0-9 _​]*$";
    private static final String ALPHA_NUM_PATTERN = "^[A-Za-z0-9 ​_]*[A-Za-z0-9][A-Za-z0-9 _​]*$";
    private static final String ALPHA_PATTERN = "^[A-Za-z ​_]*[A-Za-z][A-Za-z _​]*$";
    private static final String NUM_PATTERN = "^[0-9]*[0-9][0-9]*$";

    @Override
    public boolean supports(Class clazz) {

        return Customer.class.equals(clazz);
    }

    @Override
    public void validate(Object object, Errors errors) {

        Pattern alphaNumPattern = Pattern.compile(ALPHA_NUM_PATTERN);
        Pattern alphaPattern = Pattern.compile(ALPHA_PATTERN);
        
        Matcher matcher;
        Matcher matcher1;
        Matcher matcher2;
        Matcher matcher22;
        //Matcher matcher3;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "Test", "Field cannot be empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "Test", "Field cannot be empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gender", "Test", "Please Select.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "age", "Test", "Field cannot be empty");
        //ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "Test", "Field cannot be empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "Test", "Field cannot be empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "Test", "Field cannot be empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "membership_type", "Test", "Field cannot be empty");

        Customer customer = (Customer) object;

        matcher = alphaPattern.matcher(customer.getFirstName());

        if (!matcher.matches()) {
            errors.rejectValue("firstName", "Test", "Alphabetical values only.");
        }
        matcher1 = alphaPattern.matcher(customer.getLastName());
        if (!matcher1.matches()) {
            errors.rejectValue("lastName", "Test", "Alphabetical values only.");
        }
        matcher2 = alphaNumPattern.matcher(customer.getUserName());
        if (!matcher2.matches()) {
            errors.rejectValue("userName", "Test", "Alphanumeric values only.");
        }
        matcher22 = alphaNumPattern.matcher(customer.getPassword());
        if (!matcher22.matches()) {
            errors.rejectValue("password", "Test", "Alphanumeric values only.");
        }
        
        if(customer.getAge()<17){
            errors.rejectValue("age", "Test", "18+ only.");
        }
    }
}
