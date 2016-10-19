/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.validator;

import edu.neu.ngmodani.pojo.Customer;
import edu.neu.ngmodani.pojo.Routine;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author ngmodani
 */
public class RoutineValidator implements Validator {

    private static final String ALPHA_NUM_PATTERN = "^[A-Za-z0-9 ​_]*[A-Za-z0-9][A-Za-z0-9 _​]*$";
    private static final String ALPHA_PATTERN = "^[A-Za-z ​_]*[A-Za-z][A-Za-z _​]*$";

    @Override
    public boolean supports(Class clazz) {

        return Routine.class.equals(clazz);
    }

    @Override
    public void validate(Object object, Errors errors) {

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "daysofweek", "Test", "Field cannot be empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "exercise1", "Test", "Field cannot be empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "exercise1url", "Test", "Field cannot be empty");

        Routine routine = (Routine) object;

        Pattern alphaNumPattern = Pattern.compile(ALPHA_NUM_PATTERN);
        Pattern alphaPattern = Pattern.compile(ALPHA_PATTERN);

        Matcher matcher;
        Matcher matcher1;
        Matcher matcher2;

        matcher = alphaPattern.matcher(routine.getDaysofweek());
        if (!matcher.matches()) {
            errors.rejectValue("daysofweek", "Test", "Alphabetical values only.");
        }
        matcher1 = alphaNumPattern.matcher(routine.getExercise1());
        if (!matcher1.matches()) {
            errors.rejectValue("exercise1", "Test", "AlphaNumeric values only.");
        }
        matcher2 = alphaNumPattern.matcher(routine.getExercise1url());
        if (!matcher2.matches()) {
            errors.rejectValue("exercise1url", "Test", "AlphaNumeric values only.");
        }

    }

}
