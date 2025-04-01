package da;

import db.DBConnection;
import entity.Address;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AddressDAO {

    public boolean insertAddress(Address address) {
        String sql = "INSERT INTO Addresses (user_id, address_type, street, city_id, state_id, zip_code) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, address.getUserId());
            stmt.setString(2, address.getAddressType());
            stmt.setString(3, address.getStreet());
            stmt.setInt(4, address.getCityId());
            stmt.setInt(5, address.getStateId());
            stmt.setString(6, address.getZipCode());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0; // Return true if at least one row is inserted
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; 
    }

    public List<Address> getAllAddresses() {
        List<Address> addresses = new ArrayList<>();
        String sql = "SELECT * FROM Addresses";

        try (Connection conn = DBConnection.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                addresses.add(new Address(
                        rs.getInt("address_id"),
                        rs.getInt("user_id"),
                        rs.getString("address_type"),
                        rs.getString("street"),
                        rs.getInt("city_id"),
                        rs.getInt("state_id"),
                        rs.getString("zip_code")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return addresses;
    }

    public void updateAddress(Address address) {
        String sql = "UPDATE Addresses SET address_type = ?, street = ?, city_id = ?, state_id = ?, zip_code = ? WHERE address_id = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, address.getAddressType());
            stmt.setString(2, address.getStreet());
            stmt.setInt(3, address.getCityId());
            stmt.setInt(4, address.getStateId());
            stmt.setString(5, address.getZipCode());
            stmt.setInt(6, address.getAddressId());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteAddress(int addressId) {
        String sql = "DELETE FROM Addresses WHERE address_id = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, addressId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Address> getUserAddresses(int userId) {
        List<Address> addresses = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement("SELECT * FROM addresses WHERE USER_ID = ?")) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                addresses.add(new Address(
                        rs.getInt("address_Id"),
                        rs.getInt("user_Id"),
                        rs.getString("address_Type"),
                        rs.getString("street"),
                        rs.getInt("city_Id"),
                        rs.getInt("state_Id"),
                        rs.getString("zip_Code")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return addresses;
    }
}
