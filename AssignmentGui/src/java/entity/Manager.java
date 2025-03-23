package entity;

public class Manager {
    private String managerID;
    private String permissions;
    private String productID;

    public Manager() {}

    public Manager(String managerID, String permissions, String productID) {
        this.managerID = managerID;
        this.permissions = permissions;
        this.productID = productID;
    }

    public String getManagerID() { return managerID; }
    public void setManagerID(String managerID) { this.managerID = managerID; }

    public String getPermissions() { return permissions; }
    public void setPermissions(String permissions) { this.permissions = permissions; }

    public String getProductID() { return productID; }
    public void setProductID(String productID) { this.productID = productID; }
}
