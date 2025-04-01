package da;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import entity.Product;
import db.DBConnection;

public class WishlistDAO {

    private Connection conn;

    public WishlistDAO() {
        conn = DBConnection.getConnection();
    }

    public boolean addToWishlist(int userId, int productId) {
        String sql = "INSERT INTO wishlist_items (user_id, productid) VALUES (?, ?) ON DUPLICATE KEY UPDATE added_at = NOW()";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removeFromWishlist(int userId, int productId) {
        String sql = "DELETE FROM wishlist_items WHERE user_id = ? AND productid = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Product> getUserWishlist(int userId) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.* FROM wishlist_items wi JOIN products p ON wi.productid = p.productid WHERE wi.user_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                products.add(new Product(
                        rs.getInt("productid"), // productID
                        rs.getString("categoryid"), // categoryID
                        rs.getString("name"), // name
                        rs.getString("description"), // description
                        rs.getDouble("price"), // price
                        rs.getInt("stockquantity"), // stockQuantity
                        rs.getString("image1"), // image1
                        rs.getString("image2"), // image2
                        rs.getString("image3"), // image3
                        rs.getString("image4"), // image4
                        rs.getString("image5"), // image5
                        rs.getString("discountid"), // discountID
                        rs.getString("details") // details
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
