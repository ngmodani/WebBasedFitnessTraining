/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.dao;

import edu.neu.ngmodani.pojo.Customer;
import edu.neu.ngmodani.pojo.Routine;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ngmodani
 */
public class CustomerDAO extends DAO {

    public CustomerDAO() {

    }

    public Customer get(String username, String pass) throws Exception {
        try {
            begin();
            Query q = getSession().createQuery("FROM Customer c where c.userName = :username and c.password=:pass");
            q.setParameter("username", username);
            q.setParameter("pass", pass);
            Customer user = (Customer) q.uniqueResult();
            commit();
            return user;
        } catch (HibernateException e) {
            rollback();
            System.out.println("Error : " + e);
            return null;
        }
    }

    public Customer get(String username) throws Exception {
        try {
            begin();
            Query q = getSession().createQuery("FROM Customer c where c.userName = :username");
            q.setParameter("username", username);
            //q.setParameter("pass", pass);
            Customer user = (Customer) q.uniqueResult();
            commit();
            return user;
        } catch (HibernateException e) {
            rollback();
            System.out.println("Error : " + e);
            return null;
        }
    }

    public Customer get(int id) throws Exception {
        try {
            begin();
            Query q = getSession().createQuery("FROM Customer c where c.customerID = :id");
            q.setParameter("id", id);
            //q.setParameter("pass", pass);
            Customer user = (Customer) q.uniqueResult();
            commit();
            return user;
        } catch (HibernateException e) {
            rollback();
            System.out.println("Error : " + e);
            return null;
        }
    }

    public Customer create(Customer user) throws Exception {
        try {
            begin();
            System.out.println("inside DAO");
            //user.setDateofsubscription((String)new Date());
            getSession().save(user);

            commit();
            return user;
        } catch (HibernateException e) {
            rollback();
            // throw new AdException("Could not create user " + username, e);
            throw new Exception("Exception while creating user: " + e.getMessage());
        }
    }

    public void delete(Customer user) throws Exception {
        try {
            begin();
            getSession().delete(user);
            commit();
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not delete user " + user.getFirstName(), e);
        }
    }

    public Customer update(Customer user) throws Exception {
        try {
            begin();
            System.out.println("inside DAO");
            getSession().update(user);

            commit();
            return user;
        } catch (HibernateException e) {
            rollback();
            // throw new AdException("Could not create user " + username, e);
            throw new Exception("Exception while updataing user: " + e.getMessage());
        }
    }

    public List<Customer> getTrainerBySpecial(String special) throws Exception {

        List<Customer> list = null;
        try {
            Criteria crit = getSession().createCriteria(Customer.class);
            crit.add(Restrictions.eq("membership_type", "Trainer"));
            crit.add(Restrictions.ilike("speciality", special, MatchMode.ANYWHERE));
            crit.add(Restrictions.gt("height", 17));
            list = crit.list();
            return list;
        } catch (HibernateException e) {
            rollback();
            System.out.println("Error : " + e);
            return list;
        }
    }

    public List<Customer> getTrainerByName(String name) throws Exception {

        List<Customer> list = null;
        try {
            Criteria crit = getSession().createCriteria(Customer.class);
            crit.add(Restrictions.eq("membership_type", "Trainer"));
            Criterion firstName = Restrictions.ilike("firstName", name, MatchMode.ANYWHERE);
            Criterion lastName = Restrictions.ilike("lastName", name, MatchMode.ANYWHERE);
            LogicalExpression orExp = Restrictions.or(firstName, lastName);
            crit.add(orExp);
            crit.add(Restrictions.gt("height", 17));
            list = crit.list();
            return list;
        } catch (HibernateException e) {
            rollback();
            System.out.println("Error : " + e);
            return list;
        }
    }

    public List<Customer> searchTrainer(String name, int rating, String special) throws Exception {

        List<Customer> list = null;
        try {
            Criteria crit = getSession().createCriteria(Customer.class);
            crit.add(Restrictions.eq("membership_type", "Trainer"));
            Criterion firstName = Restrictions.ilike("firstName", name, MatchMode.ANYWHERE);
            Criterion lastName = Restrictions.ilike("lastName", name, MatchMode.ANYWHERE);
            LogicalExpression orExp = Restrictions.or(firstName, lastName);
            crit.add(orExp);
            //crit.add(Restrictions.gt("height", 17));
            crit.add(Restrictions.ge("ratings", rating));
            if (!special.equals("all")) {
                crit.add(Restrictions.ilike("speciality", special, MatchMode.ANYWHERE));
            }
            list = crit.list();
            return list;
        } catch (HibernateException e) {
            rollback();
            System.out.println("Error : " + e);
            return list;
        }
    }
    
    public List<Customer> searchTrainer(int rating, String special) throws Exception {

        List<Customer> list = null;
        try {
            Criteria crit = getSession().createCriteria(Customer.class);
            crit.add(Restrictions.eq("membership_type", "Trainer"));
            crit.add(Restrictions.gt("ratings", rating));
            if (!special.equals("all")) {
                crit.add(Restrictions.ilike("speciality", special, MatchMode.ANYWHERE));
            }
            list = crit.list();
            return list;
        } catch (HibernateException e) {
            rollback();
            System.out.println("Error : " + e);
            return list;
        }
    }

    public boolean selectTrainer(Customer c, Customer trainer) {
        try {
            begin();
            System.out.println("inside DAO");
            c.setTrainerUserName(trainer.getUserName());
            getSession().update(c);

            commit();
            return true;
        } catch (HibernateException e) {
            rollback();
            // throw new AdException("Could not create user " + username, e);
            return false;
        }

    }

    public List<Customer> getCustomerByTrainer(Customer trainer) throws Exception {

        List<Customer> list = null;
        try {
            Criteria crit = getSession().createCriteria(Customer.class);
            crit.add(Restrictions.eq("membership_type", "Customer"));
            Criterion nullTrainer = Restrictions.isNull("trainerUserName");
            Criterion withTrainer = Restrictions.eq("trainerUserName", trainer.getUserName());
            LogicalExpression orExp = Restrictions.or(nullTrainer, withTrainer);
            crit.add(orExp);
            list = crit.list();
            return list;
        } catch (HibernateException e) {
            rollback();
            System.out.println("Error : " + e);
            return list;
        }
    }

    public Set<Routine> getRoutine(Customer c) {
        Set<Routine> list = null;
        try {
            list = c.getRoutine();
            return list;

        } catch (HibernateException e) {
            rollback();
            System.out.println("Error : " + e);
            return list;
        }
    }

}
