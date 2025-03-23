package entity;

public class CartItem {
    private String cartItemID;
    private String cartID;
    private String productID;
    private int quantity;

    public CartItem() {}

    public CartItem(String cartItemID, String cartID, String productID, int quantity) {
        this.cartItemID = cartItemID;
        this.cartID = cartID;
        this.productID = productID;
        this.quantity = quantity;
    }

    public String getCartItemID() { return cartItemID; }
    public void setCartItemID(String cartItemID) { this.cartItemID = cartItemID; }

    public String getCartID() { return cartID; }
    public void setCartID(String cartID) { this.cartID = cartID; }

    public String getProductID() { return productID; }
    public void setProductID(String productID) { this.productID = productID; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}