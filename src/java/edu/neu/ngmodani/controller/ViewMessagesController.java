/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.controller;

import edu.neu.ngmodani.dao.CustomerDAO;
import edu.neu.ngmodani.dao.MessageDAO;
import edu.neu.ngmodani.pojo.Message;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author ngmodani
 */
public class ViewMessagesController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) {
        ModelAndView mv = new ModelAndView();
        MessageDAO mDao = new MessageDAO();
        try {
            String user = (String) hsr.getSession().getAttribute("userName");
            String action = hsr.getParameter("action");
            List<Message> messageList;
            if (action.equals("inbox")) {
                messageList = mDao.getInboxMessages(user);
                mv.addObject("messageList", messageList);
                mv.setViewName("viewinbox");
            }
            if (action.equals("sent")) {
                messageList = mDao.getSentMessages(user);
                mv.addObject("messageList", messageList);
                mv.setViewName("viewsent");
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
