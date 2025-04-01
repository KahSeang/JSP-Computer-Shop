package da;

import db.DBConnection;
import entity.Address;
import entity.City;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CityDAO {

    public void insertCity(City city) {
        String sql = "INSERT INTO Cities (city_name, state_id) VALUES (?, ?)";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, city.getCityName());
            stmt.setInt(2, city.getStateId());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<City> getAllCities() {
        List<City> cities = new ArrayList<>();
        String sql = "SELECT * FROM Cities";

        try (Connection conn = DBConnection.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                cities.add(new City(
                        rs.getInt("city_id"),
                        rs.getString("city_name"),
                        rs.getInt("state_id")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cities;
    }

    public void updateCity(City city) {
        String sql = "UPDATE Cities SET city_name = ?, state_id = ? WHERE city_id = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, city.getCityName());
            stmt.setInt(2, city.getStateId());
            stmt.setInt(3, city.getCityId());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCity(int cityId) {
        String sql = "DELETE FROM Cities WHERE city_id = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, cityId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public City getCityById(int cityId) {
        // Assuming you have some database connection and query logic
        // Example code using JDBC:
        City city = null;
        String query = "SELECT * FROM cities WHERE city_id = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, cityId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                city = new City(rs.getInt("city_id"), rs.getString("city_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return city;
    }

    public String getCityNameById(int userId, List<Address> addresses) {
        for (Address address : addresses) {
            if (address.getUserId() == userId) {
                City city = getCityByAddressId(address.getCityId()); // Retrieve city by cityId from Address
                if (city != null) {
                    return city.getCityName(); // Return the city name
                }
            }
        }
        return null; // Return null if no matching address is found
    }

    // Helper method to fetch city by cityId from the database
    private City getCityByAddressId(int cityId) {
        String sql = "SELECT * FROM Cities WHERE city_id = ?";
        City city = null;

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cityId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    city = new City(
                            rs.getInt("city_id"),
                            rs.getString("city_name"),
                            rs.getInt("state_id") // Fetch the associated state_id
                    );
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return city;
    }
}
