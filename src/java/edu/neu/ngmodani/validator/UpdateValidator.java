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
public class UpdateValidator implements Validator {

    private static final String IMAGE_PATTERN = "([^\\s]+(\\.(?i)(jpg|png|gif|bmp))$)";

    private static final String ALPHA_NUM_PATTERN = "^[A-Za-z0-9 ​_]*[A-Za-z0-9][A-Za-z0-9 _​]*$";
    private static final String ALPHA_PATTERN = "^[A-Za-z ​_]*[A-Za-z][A-Za-z _​]*$";

    @Override
    public boolean supports(Class clazz) {

        return Customer.class.equals(clazz);
    }

    @Override
    public void validate(Object object, Errors errors) {
        Pattern alphaNumPattern = Pattern.compile(ALPHA_NUM_PATTERN);
        Pattern alphaPattern = Pattern.compile(ALPHA_PATTERN);
        Customer customer = (Customer) object;

        Pattern pattern = Pattern.compile(IMAGE_PATTERN);
        Matcher matcher;
        Matcher matcher1;
        MultipartFile photo;
        photo = customer.getPhoto();
        matcher = pattern.matcher(photo.getOriginalFilename());

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "Test", "Field cannot be empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "Test", "Field cannot be empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gender", "Test", "Field cannot be empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "age", "Test", "Field cannot be empty");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "height", "Test", "Field cannot be empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "weight", "Test", "Field cannot be empty");

        matcher = alphaPattern.matcher(customer.getFirstName());
        if (!matcher.matches()) {
            errors.rejectValue("firstName", "Test", "Alphabetical values only.");
        }
        matcher1 = alphaPattern.matcher(customer.getLastName());
        if (!matcher1.matches()) {
            errors.rejectValue("lastName", "Test", "Alphabetical values only.");
        }

        if (customer.getAge() < 17) {
            errors.rejectValue("age", "Test", "18+ only.");
        }
        if (customer.getHeight() < 10) {
            errors.rejectValue("height", "Test", "Invalid input.");
        }
        if (customer.getWeight() < 10) {
            errors.rejectValue("weight", "Test", "Invalid input.");
        }
        if (0 == photo.getSize()) {
            errors.rejectValue("photo", "Test", "File is empty!");
        }
        /*
         if (!matcher.matches()) {
         errors.rejectValue("photo", "Test", "Invalid Image Format");
         }
         */
        if (3000000 < photo.getSize()) {
            errors.rejectValue("photo", "Test", "File size is over 5mb !");
        }

    }

}
