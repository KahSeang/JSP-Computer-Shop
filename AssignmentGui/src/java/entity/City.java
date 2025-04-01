package entity;
//db name cities

public class City {

    private int cityId;
    private String cityName;
    private int stateId;

    public City(int cityId, String cityName, int stateId) {
        this.cityId = cityId;
        this.cityName = cityName;
        this.stateId = stateId;
    }

    public City(int cityId, String cityName) {
        this.cityId = cityId;
        this.cityName = cityName;
       
    }

    public int getCityId() {
        return cityId;
    }

    public String getCityName() {
        return cityName;
    }

    public int getStateId() {
        return stateId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }
}
