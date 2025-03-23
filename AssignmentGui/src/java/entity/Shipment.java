package entity;

public class Shipment {
    private String shipmentID;
    private String orderID;
    private String trackingNumber;
    private String shippingAddress;
    private String deliveryStatus;

    public Shipment() {}

    public Shipment(String shipmentID, String orderID, String trackingNumber, String shippingAddress, String deliveryStatus) {
        this.shipmentID = shipmentID;
        this.orderID = orderID;
        this.trackingNumber = trackingNumber;
        this.shippingAddress = shippingAddress;
        this.deliveryStatus = deliveryStatus;
    }

    public String getShipmentID() { return shipmentID; }
    public void setShipmentID(String shipmentID) { this.shipmentID = shipmentID; }

    public String getOrderID() { return orderID; }
    public void setOrderID(String orderID) { this.orderID = orderID; }

    public String getTrackingNumber() { return trackingNumber; }
    public void setTrackingNumber(String trackingNumber) { this.trackingNumber = trackingNumber; }

    public String getShippingAddress() { return shippingAddress; }
    public void setShippingAddress(String shippingAddress) { this.shippingAddress = shippingAddress; }

    public String getDeliveryStatus() { return deliveryStatus; }
    public void setDeliveryStatus(String deliveryStatus) { this.deliveryStatus = deliveryStatus; }
}