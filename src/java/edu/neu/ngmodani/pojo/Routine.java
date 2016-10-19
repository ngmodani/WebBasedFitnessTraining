/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.pojo;

import java.util.Date;

/**
 *
 * @author ngmodani
 */
public class Routine {

    private int routineID;
    private Date date;
    private String daysofweek;
    private String exercise1;
    private String exercise1url;
    private String exercise2;
    private String exercise2url;
    private String exercise3;
    private String exercise3url;
    private String exercise4;
    private String exercise4url;
    private Customer customer;

    public Routine() {
    }

    public int getRoutineID() {
        return routineID;
    }

    public void setRoutineID(int routineID) {
        this.routineID = routineID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDaysofweek() {
        return daysofweek;
    }

    public void setDaysofweek(String daysofweek) {
        this.daysofweek = daysofweek;
    }

    

    public String getExercise1() {
        return exercise1;
    }

    public void setExercise1(String exercise1) {
        this.exercise1 = exercise1;
    }

    public String getExercise1url() {
        return exercise1url;
    }

    public void setExercise1url(String exercise1url) {
        this.exercise1url = exercise1url;
    }

    public String getExercise2() {
        return exercise2;
    }

    public void setExercise2(String exercise2) {
        this.exercise2 = exercise2;
    }

    public String getExercise2url() {
        return exercise2url;
    }

    public void setExercise2url(String exercise2url) {
        this.exercise2url = exercise2url;
    }

    public String getExercise3() {
        return exercise3;
    }

    public void setExercise3(String exercise3) {
        this.exercise3 = exercise3;
    }

    public String getExercise3url() {
        return exercise3url;
    }

    public void setExercise3url(String exercise3url) {
        this.exercise3url = exercise3url;
    }

    public String getExercise4() {
        return exercise4;
    }

    public void setExercise4(String exercise4) {
        this.exercise4 = exercise4;
    }

    public String getExercise4url() {
        return exercise4url;
    }

    public void setExercise4url(String exercise4url) {
        this.exercise4url = exercise4url;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

}
