/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.controller;

import edu.neu.ngmodani.dao.CustomerDAO;
import edu.neu.ngmodani.dao.MessageDAO;
import edu.neu.ngmodani.pojo.Customer;
import edu.neu.ngmodani.pojo.Message;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/**
 *
 * @author ngmodani
 */
public class SendMessageController extends SimpleFormController {

    MessageDAO messageDao;

    public SendMessageController() {
    }

    @Override
    protected void doSubmitAction(Object command) throws Exception {
        Message message = (Message) command;
        messageDao = new MessageDAO();
        message.setMessageDate(new Date());
        messageDao.save(message);
    }

    @Override
    protected Object formBackingObject(HttpServletRequest request) {
        try {
            //messageDao = new MessageDAO();
            Message message = new Message();
            message.setFromUser((String) request.getSession().getAttribute("userName"));
            String toUser = request.getParameter("to");
            message.setUserName(toUser);
            return message;
        } catch (Exception e) {
            ModelAndView mv = new ModelAndView();
            HttpSession session = request.getSession();
            session.removeAttribute("userName");
            session.invalidate();
            mv.setViewName("invalid");
            return mv;
        }

    }

}
