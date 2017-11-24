package com.csylh.entity;

public class Doubanc {
    private String country;
    private int nums;
    public String getCountry() {

        return country;
    }
    public void setCountry(String country)
    {
        this.country = country;
    }
    public int getNums() {

        return nums;
    }
    public void setNums(int nums) {

        this.nums = nums;
    }
    public Doubanc(String country, int nums) {
        super();
        this.country = country;
        this.nums = nums;
    }
    public Doubanc() {

        super();
    }


}