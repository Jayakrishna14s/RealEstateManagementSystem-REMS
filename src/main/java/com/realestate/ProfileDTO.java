package com.realestate;

public class ProfileDTO {
    private String uname;
    private String email;
    private String phone;
    private int totalUploads;
    private int totalDeals;

    public ProfileDTO(String uname, String email, String phone, int totalUploads, int totalDeals) {
        this.uname = uname;
        this.email = email;
        this.phone = phone;
        this.totalUploads = totalUploads;
        this.totalDeals = totalDeals;
    }

    public String getUname() {
        return this.uname;
    }

    public String getEmail() {
        return this.email;
    }

    public String getPhone() {
        return this.phone;
    }

    public int getTotalUploads() {
        return this.totalUploads;
    }

    public int getTotalDeals() {
        return this.totalDeals;
    }
}
