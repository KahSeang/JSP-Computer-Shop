package da;

import java.sql.*;
import entity.User;
import db.DBConnection;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;

public class UserDAO {

    private Connection conn;

    public UserDAO() {
        conn = DBConnection.getConnection();
    }

    public boolean registerUser(User user, HttpServletResponse response) throws IOException {
        if (userExists(user.getUsername(), user.getEmail())) {
            response.getWriter().write("<script>alert('User already exists in Users or Admin table.'); window.location.href='register.jsp';</script>");
            return false;
        }

        String query = "INSERT INTO users (email, username, password) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, hashPassword(user.getPassword())); // Hash the password
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public User loginUser(String username, String password) {
        String query = "SELECT * FROM users WHERE username = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedHashedPassword = rs.getString("password");

                if (verifyPassword(password, storedHashedPassword)) {
                    return new User(rs.getInt("ID"),rs.getString("email"), rs.getString("username"), storedHashedPassword, 1, rs.getString("phone"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Hash password using SHA-256
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }

    // Verify password by hashing the input and comparing it with stored hash
    private boolean verifyPassword(String inputPassword, String storedHashedPassword) {
        return hashPassword(inputPassword).equals(storedHashedPassword);
    }

    public boolean userExists(String username, String email) {
        String query = "SELECT * FROM users WHERE username = ? OR email = ? "
                + "UNION "
                + "SELECT * FROM admin WHERE username = ? OR email = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, username);
            stmt.setString(4, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next(); // Returns true if a user exists in either table
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //userprofile.jsp
    public boolean updateUserProfile(User user) {
        String checkQuery = "SELECT COUNT(*) FROM users WHERE (email = ? OR username = ?) AND id != ?";
        String updateQuery = "UPDATE users SET email = ?, username = ?, phone = ? WHERE id = ?";

        try (PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
            checkStmt.setString(1, user.getEmail());
            checkStmt.setString(2, user.getUsername());
            checkStmt.setInt(3, user.getId());
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                System.out.println("Error: Email or Username already exists!");
                return false; // Prevent update
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        try (PreparedStatement stmt = conn.prepareStatement(updateQuery)) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getPhone());
            stmt.setInt(4, user.getId());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateUser(User user) {
        String query = "UPDATE users SET email = ?, username = ?, password = ?, phone = ? WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, hashPassword(user.getPassword()));
            stmt.setString(4, user.getPhone());
            stmt.setInt(5, user.getId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
