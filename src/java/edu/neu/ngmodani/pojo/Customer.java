/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.neu.ngmodani.pojo;

import java.util.HashSet;
import java.util.Set;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ngmodani
 */
public class Customer {

    private int customerID;
    private String firstName;
    private String lastName;
    private String userName;
    private int age;
    private String password;
    private String gender;
    private String photoName;
    private MultipartFile photo;
    private String membership_type;
    private int height;
    private int weight;
    private int ratings;
    private String speciality;
    private int waist;
    private int chest;
    private int biceps;
    private String dateofsubscription;
    private String trainerUserName;
    private Set<Routine> routine;// = new HashSet<>(0);
    //private Set<Message> message;

    public Customer() {
        routine = new HashSet<>();
        //message = new HashSet<>();
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public MultipartFile getPhoto() {
        return photo;
    }

    public void setPhoto(MultipartFile photo) {
        this.photo = photo;
    }

    public String getMembership_type() {
        return membership_type;
    }

    public void setMembership_type(String membership_type) {
        this.membership_type = membership_type;
    }

    public String getDateofsubscription() {
        return dateofsubscription;
    }

    public void setDateofsubscription(String dateofsubscription) {
        this.dateofsubscription = dateofsubscription;
    }

    public String getTrainerUserName() {
        return trainerUserName;
    }

    public void setTrainerUserName(String trainerUserName) {
        this.trainerUserName = trainerUserName;
    }

    public Set<Routine> getRoutine() {
        return routine;
    }

    public void setRoutine(Set<Routine> routine) {
        this.routine = routine;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getRatings() {
        return ratings;
    }

    public void setRatings(int ratings) {
        this.ratings = ratings;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public int getWaist() {
        return waist;
    }

    public void setWaist(int waist) {
        this.waist = waist;
    }

    public int getChest() {
        return chest;
    }

    public void setChest(int chest) {
        this.chest = chest;
    }

    public int getBiceps() {
        return biceps;
    }

    public void setBiceps(int biceps) {
        this.biceps = biceps;
    }

}
