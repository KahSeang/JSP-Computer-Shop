package da;

import db.DBConnection;
import entity.Admin;
import java.sql.*;

public class AdminDAO {

    private Connection conn;

    public AdminDAO() {
        conn = DBConnection.getConnection();
    }

    public boolean registerAdmin(Admin admin) {
        if (userOrAdminExists(admin.getUsername(), admin.getEmail())) {
            System.out.println("Admin already exists in Users or Admin table.");
            return false;
        }

        String query = "INSERT INTO Admin (email, username, password) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, admin.getEmail());
            stmt.setString(2, admin.getUsername());
            stmt.setString(3, admin.getPassword());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Admin loginAdmin(String username, String password) {
        String query = "SELECT * FROM Admin WHERE username = ? AND password = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Admin(rs.getString("email"), rs.getString("username"), rs.getString("password"), 2);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean userOrAdminExists(String username, String email) {
        String query = "SELECT username, email FROM users WHERE username = ? OR email = ? " +
                       "UNION " +
                       "SELECT username, email FROM Admin WHERE username = ? OR email = ?";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, username);
            stmt.setString(4, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
