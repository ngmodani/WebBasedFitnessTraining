/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.dao;

import static edu.neu.ngmodani.dao.DAO.getSession;
import edu.neu.ngmodani.pojo.Customer;
import edu.neu.ngmodani.pojo.Message;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ngmodani
 */
public class MessageDAO extends DAO {

    public void save(Message mes) throws Exception {
        try {
            begin();
            System.out.println("inside DAO");
            getSession().save(mes);

            commit();
            //return true;
        } catch (HibernateException e) {
            rollback();
            // throw new AdException("Could not create user " + username, e);
            throw new Exception("Exception while sending message: " + e.getMessage());

            // return false;
        }
    }
    
     public List<Message> getInboxMessages(String to) throws Exception {

        List<Message> list = null;
        try {
            Criteria crit = getSession().createCriteria(Message.class);
            crit.add(Restrictions.eq("userName", to));
            list = crit.list();
            return list;
        } catch (HibernateException e) {
            rollback();
            System.out.println("Error : " + e);
            return list;
        }
    }
     
      public List<Message> getSentMessages(String from) throws Exception {

        List<Message> list = null;
        try {
            Criteria crit = getSession().createCriteria(Message.class);
            crit.add(Restrictions.eq("fromUser", from));
            list = crit.list();
            return list;
        } catch (HibernateException e) {
            rollback();
            System.out.println("Error : " + e);
            return list;
        }
    }

}
