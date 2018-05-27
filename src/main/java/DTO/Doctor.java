/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author TGMaster
 */
public class Doctor {

    private int ID;
    private String fname;
    private String lname;
    private String sex;
    private String degree;
    private boolean insurance;
    private String speciality;
    private String hours;
    private String lang;
    private int allowReview;

    public Doctor() {
    }

    public Doctor(int ID, String fname, String lname, String sex, String degree, boolean insurance, String speciality, String hours, String lang) {
        this.ID = ID;
        this.fname = fname;
        this.lname = lname;
        this.sex = sex;
        this.degree = degree;
        this.insurance = insurance;
        this.speciality = speciality;
        this.hours = hours;
        this.lang = lang;
    }

    
    public Doctor(int ID, String fname, String lname, String sex, String degree, boolean insurance, String speciality, String hours, String lang,int allowReview) {
        this.ID = ID;
        this.fname = fname;
        this.lname = lname;
        this.sex = sex;
        this.degree = degree;
        this.insurance = insurance;
        this.speciality = speciality;
        this.hours = hours;
        this.lang = lang;
        this.allowReview = allowReview;

    }

    public int getAllowReview() {
        return allowReview;
    }

    public void setAllowReview(int allowReview) {
        this.allowReview = allowReview;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public boolean getInsurance() {
        return insurance;
    }

    public void setInsurance(boolean insurance) {
        this.insurance = insurance;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public String getHours() {
        return hours;
    }

    public void setHours(String hours) {
        this.hours = hours;
    }

    public String getLang() {
        return lang;
    }

    public void setLang(String lang) {
        this.lang = lang;
    }
}
