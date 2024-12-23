package com.realestate;

public class PropertyDTO {
    private int id;
    private String uname;
    private String propertytype;
    private String location;
    private String budget;
    private String description;
    private String link;
    private int status;
    private String email;
    private String phone;
    private String buyer;
    private String buyerPhone;
//    private String className;
    public PropertyDTO (int id, String uname, String propertytype, String location, String budget, String description, String link) {
        this.id = id;
        this.uname = uname;
        this.propertytype = propertytype;
        this.location = location;
        this.budget = budget;
        this.description = description;
        this.link = link;
    }

    public PropertyDTO (int id, String uname, String propertytype, String location, String budget, String description, String link, int status, String buyer) {
        this(id, uname, propertytype, location, budget, description, link);
        this.status = status;
        this.buyer = buyer;
    }


    public PropertyDTO (int id, String uname, String propertytype, String location, String budget, String description, String link, String buyer, String buyerPhone, int status) {
        this(id, uname, propertytype, location, budget, description, link, status, buyer);
        this.buyerPhone = buyerPhone;
    }

    public PropertyDTO (int id, String uname, String propertytype, String location, String budget, String description, String link, int status) {
        this(id, uname, propertytype, location, budget, description, link);
        this.status = status;
    }

    public PropertyDTO (int id, String uname, String propertytype, String location, String budget, String description, String link, String email, String phone) {
        this(id, uname, propertytype, location, budget, description, link);
        this.email = email;
        this.phone = phone;
    }

    public PropertyDTO (int id, String uname, String propertytype, String location, String budget, String description, String link, int status, String email, String phone) {
        this(id, uname, propertytype, location, budget, description, link, email, phone);
        this.status = status;
    }



    public int getId() {
        return this.id;
    }

    public String getUname() {
        return this.uname;
    }

    public String getPropertytype(){
        return this.propertytype;
    }

    public String getLocation(){
        return this.location;
    }

    public String getBudget(){
        return this.budget;
    }

    public String getDescription(){
        return this.description;
    }

    public String getLink(){
        return this.link;
    }

    public String getEmail(){
        return this.email;
    }

    public String getPhone(){
        return this.phone;
    }

    public Integer getStatus(){
        return this.status;
    }

    public String getBuyer(){
        return this.buyer;
    }

    public String getBuyerPhone(){
        return this.buyerPhone;
    }

}
