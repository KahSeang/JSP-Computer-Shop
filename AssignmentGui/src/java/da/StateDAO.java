package da;

import db.DBConnection;
import entity.Address;
import entity.State;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StateDAO {

    public void insertState(State state) {
        String sql = "INSERT INTO States (state_name, country, delivery_time) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, state.getStateName());
            stmt.setString(2, state.getCountry());
            stmt.setInt(3, state.getDeliveryTime()); // New field
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<State> getAllStates() {
        List<State> states = new ArrayList<>();
        String sql = "SELECT * FROM States";

        try (Connection conn = DBConnection.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                states.add(new State(
                        rs.getInt("state_id"),
                        rs.getString("state_name"),
                        rs.getString("country"),
                        rs.getInt("delivery_time") // Fetch delivery time
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return states;
    }

    public void updateState(State state) {
        String sql = "UPDATE States SET state_name = ?, country = ?, delivery_time = ? WHERE state_id = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, state.getStateName());
            stmt.setString(2, state.getCountry());
            stmt.setInt(3, state.getDeliveryTime());
            stmt.setInt(4, state.getStateId());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteState(int stateId) {
        String sql = "DELETE FROM States WHERE state_id = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, stateId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public State getStateById(int stateId) {
        // Assuming you have some database connection and query logic
        // Example code using JDBC:
        State state = null;
        String query = "SELECT * FROM states WHERE state_id = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, stateId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                state = new State(rs.getInt("state_id"), rs.getString("state_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return state;
    }
    
      public String getStateNameById(int userId, List<Address> addresses) {
        for (Address address : addresses) {
            if (address.getUserId() == userId) {
                State state = getStateByAddressId(address.getStateId()); 
                if (state != null) {
                    return state.getStateName(); // Return the state name
                }
            }
        }
        return null; 
    }

    // Helper method to fetch state by stateId from the database
    private State getStateByAddressId(int stateId) {
        String sql = "SELECT * FROM States WHERE state_id = ?";
        State state = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, stateId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    state = new State(
                            rs.getInt("state_id"),
                            rs.getString("state_name"),
                            rs.getString("country"),
                            rs.getInt("delivery_time") 
                    );
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return state;
    }

}

