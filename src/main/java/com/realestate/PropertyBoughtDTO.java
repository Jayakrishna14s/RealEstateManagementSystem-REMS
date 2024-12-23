package com.realestate;

public class PropertyBoughtDTO {
    private int ID;
    private String propertytype;
    private String sellerName;

    public PropertyBoughtDTO(int ID, String propertytype, String sellerName) {
        this.ID = ID;
        this.propertytype = propertytype;
        this.sellerName = sellerName;
    }

    public int getID() {
        return this.ID;
    }

    public String getPropertytype() {
        return this.propertytype;
    }

    public String getSellerName() {
        return this.sellerName;
    }
}
