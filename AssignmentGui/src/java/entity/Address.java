package entity;

public class Address {
    private int addressId;
    private int userId;
    private String addressType;//比如一些是HOME 的一些是公司的
    private String street;
    private int cityId;
    private int stateId;
    private String zipCode;

    public Address(int addressId, int userId, String addressType, String street, int cityId, int stateId, String zipCode) {
        this.addressId = addressId;
        this.userId = userId;
        this.addressType = addressType;
        this.street = street;
        this.cityId = cityId;
        this.stateId = stateId;
        this.zipCode = zipCode;
    }

        public Address( int userId, String addressType, String street, int cityId, int stateId, String zipCode) {
        this.userId = userId;
        this.addressType = addressType;
        this.street = street;
        this.cityId = cityId;
        this.stateId = stateId;
        this.zipCode = zipCode;
    }

    // Getters
    public int getAddressId() {
        return addressId;
    }

    public int getUserId() {
        return userId;
    }

    public String getAddressType() {
        return addressType;
    }

    public String getStreet() {
        return street;
    }

    public int getCityId() {
        return cityId;
    }

    public int getStateId() {
        return stateId;
    }

    public String getZipCode() {
        return zipCode;
    }

    // Setters
    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setAddressType(String addressType) {
        this.addressType = addressType;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }
}

