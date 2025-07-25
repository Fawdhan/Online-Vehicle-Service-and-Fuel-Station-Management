package com.Fuel;

public class Payment {
    private int id;
    private String fullname;
    private String email;
    private String contact;
    private String address;
    private String fuelType;
    private String volume;
    private String price;
    
    public Payment(int id, String fullname, String email, String contact, String address, String fuelType, String volume, String price) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.contact = contact;
        this.address = address;
        this.fuelType = fuelType;
        this.volume = volume;
        this.price = price;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public String getFullname() {
        return fullname;
    }
    
    public String getEmail() {
        return email;
    }
    
    public String getContact() {
        return contact;
    }
    
    public String getAddress() {
        return address;
    }
    
    public String getFuelType() {
        return fuelType;
    }
    
    public String getVolume() {
        return volume;
    }
    
    public String getPrice() {
        return price;
    }
}