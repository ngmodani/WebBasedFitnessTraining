/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.dao;

import static edu.neu.ngmodani.dao.DAO.getSession;
import edu.neu.ngmodani.pojo.Customer;
import edu.neu.ngmodani.pojo.Routine;
import java.util.List;
import java.util.Set;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ngmodani
 */
public class RoutineDAO extends DAO {

    public RoutineDAO() {

    }

    public void delete(Routine r) throws Exception {
        try {
            begin();
            getSession().delete(r);
            commit();
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not delete routine", e);
        }
    }

    public Routine get(int rID) throws Exception {
        try {
            begin();
            Query q = getSession().createQuery("FROM Routine c where c.routineID = :id");
            q.setParameter("id", rID);
            //q.setParameter("pass", pass);
            Routine routin = (Routine) q.uniqueResult();
            commit();
            return routin;
        } catch (HibernateException e) {
            rollback();
            System.out.println("Error : " + e);
            return null;
        }
    }

    public Routine update(Routine r) throws Exception {
        try {
            begin();
            System.out.println("inside DAO");
            getSession().update(r);
            commit();
            return r;
        } catch (HibernateException e) {
            rollback();
            // throw new AdException("Could not create user " + username, e);
            throw new Exception("Exception while creating routine: " + e.getMessage());
        }
    }

    public Routine save(Routine r) throws Exception {
        try {
            begin();
            System.out.println("inside DAO");
            getSession().save(r);
            commit();
            return r;
        } catch (HibernateException e) {
            rollback();
            // throw new AdException("Could not create user " + username, e);
            throw new Exception("Exception while creating routine: " + e.getMessage());
        }
    }

    public List<Routine> getRoutine(Customer c) throws Exception {

        List<Routine> list = null;
        try {
            Criteria crit = getSession().createCriteria(Routine.class);
            crit.add(Restrictions.eq("customer", c));

            list = crit.list();
            return list;
        } catch (HibernateException e) {
            rollback();
            System.out.println("Error : " + e);
            return list;
        }
    }

}
