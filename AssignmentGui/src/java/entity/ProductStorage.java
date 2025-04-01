package entity;

public class ProductStorage {

    private int id;
    private Product product;
    private Storage storage;

    public ProductStorage(int id, Product product, Storage storage) {
        this.id = id;
        this.product = product;
        this.storage = storage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Storage getStorage() {
        return storage;
    }

    public void setStorage(Storage storage) {
        this.storage = storage;
    }
}
