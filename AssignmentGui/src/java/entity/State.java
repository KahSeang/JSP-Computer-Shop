package entity;

//EG KEDAH PENANG ... I DO THIS BECAUSE I WANT DEFFERENT STATE DIFFERENT DELIVERY DAY
public class State {

    private int stateId;
    private String stateName;
    private String country;
    private int deliveryTime;  // day 几天到

    public State(int stateId, String stateName, String country, int deliveryTime) {
        this.stateId = stateId;
        this.stateName = stateName;
        this.country = country;
        this.deliveryTime = deliveryTime;
    }

    public State(int stateId, String stateName) {
        this.stateId = stateId;
        this.stateName = stateName;

    }

    public int getStateId() {
        return stateId;
    }

    public String getStateName() {
        return stateName;
    }

    public String getCountry() {
        return country;
    }

    // Setters
    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(int deliveryTime) {
        this.deliveryTime = deliveryTime;
    }
}
