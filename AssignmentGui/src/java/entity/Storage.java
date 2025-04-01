package entity;

public class Storage {

    private int id;
    private int size; // Example: 512 for 512GB
    private String sizeLabel; // Example: "512GB SSD"
    private String description;
    private double price; // Price for the storage option

    public Storage(int id, int size, String sizeLabel, String description, double price) {
        this.id = id;
        this.size = size;
        this.sizeLabel = sizeLabel;
        this.description = description;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getSizeLabel() {
        return sizeLabel;
    }

    public void setSizeLabel(String sizeLabel) {
        this.sizeLabel = sizeLabel;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
