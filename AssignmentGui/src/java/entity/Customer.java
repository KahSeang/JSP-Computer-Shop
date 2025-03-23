package entity;

public class Customer {
    private String customerID;
    private String address;
    private String orderHistory;
    private String paymentMethod;

    public Customer() {}

    public Customer(String customerID, String address, String orderHistory, String paymentMethod) {
        this.customerID = customerID;
        this.address = address;
        this.orderHistory = orderHistory;
        this.paymentMethod = paymentMethod;
    }

    public String getCustomerID() { return customerID; }
    public void setCustomerID(String customerID) { this.customerID = customerID; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getOrderHistory() { return orderHistory; }
    public void setOrderHistory(String orderHistory) { this.orderHistory = orderHistory; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }
}