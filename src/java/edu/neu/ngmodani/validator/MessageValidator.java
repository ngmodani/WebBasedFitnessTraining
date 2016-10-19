/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.validator;

import edu.neu.ngmodani.pojo.Message;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author ngmodani
 */
public class MessageValidator implements Validator {

    private static final String ALPHA_NUM_PATTERN = "^[A-Za-z0-9 ​_]*[A-Za-z0-9][A-Za-z0-9 _​]*$";

    @Override
    public boolean supports(Class clazz) {

        return Message.class.equals(clazz);
    }

    @Override
    public void validate(Object object, Errors errors) {

        Pattern alphaNumPattern = Pattern.compile(ALPHA_NUM_PATTERN);

        Matcher matcher;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "messagebody", "Test", "Field cannot be empty");

        Message msg = (Message) object;
        matcher = alphaNumPattern.matcher(msg.getMessagebody());
        if (!matcher.matches()) {
            errors.rejectValue("messagebody", "Test", "Message can only contain alphanumeric values.");
        }
    }

}
