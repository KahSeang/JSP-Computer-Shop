package entity;

import java.sql.Timestamp;

public class Payment {
    private String paymentID;
    private String orderID;
    private String paymentMethod;
    private Timestamp paymentDate;
    private String paymentStatus;

    public Payment() {}

    public Payment(String paymentID, String orderID, String paymentMethod, Timestamp paymentDate, String paymentStatus) {
        this.paymentID = paymentID;
        this.orderID = orderID;
        this.paymentMethod = paymentMethod;
        this.paymentDate = paymentDate;
        this.paymentStatus = paymentStatus;
    }

    public String getPaymentID() { return paymentID; }
    public void setPaymentID(String paymentID) { this.paymentID = paymentID; }

    public String getOrderID() { return orderID; }
    public void setOrderID(String orderID) { this.orderID = orderID; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public Timestamp getPaymentDate() { return paymentDate; }
    public void setPaymentDate(Timestamp paymentDate) { this.paymentDate = paymentDate; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }
}