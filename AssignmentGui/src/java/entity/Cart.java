package entity;

import java.sql.Timestamp;

public class Cart {
    private String cartID;
    private String customerID;
    private Timestamp createdAt;

    public Cart() {}

    public Cart(String cartID, String customerID, Timestamp createdAt) {
        this.cartID = cartID;
        this.customerID = customerID;
        this.createdAt = createdAt;
    }

    public String getCartID() { return cartID; }
    public void setCartID(String cartID) { this.cartID = cartID; }

    public String getCustomerID() { return customerID; }
    public void setCustomerID(String customerID) { this.customerID = customerID; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}