package entity;

public class ProductDiscount {

    private String productID;
    private String discountID;

    public ProductDiscount() {
    }

    public ProductDiscount(String productID, String discountID) {
        this.productID = productID;
        this.discountID = discountID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getDiscountID() {
        return discountID;
    }

    public void setDiscountID(String discountID) {
        this.discountID = discountID;
    }
}
