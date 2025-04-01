package entity;

public class Staff {

    private String staffID;
    private String position;
    private String assignedTasks;
    private String productID;

    public Staff() {
    }

    public Staff(String staffID, String position, String assignedTasks, String productID) {
        this.staffID = staffID;
        this.position = position;
        this.assignedTasks = assignedTasks;
        this.productID = productID;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getAssignedTasks() {
        return assignedTasks;
    }

    public void setAssignedTasks(String assignedTasks) {
        this.assignedTasks = assignedTasks;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }
}
