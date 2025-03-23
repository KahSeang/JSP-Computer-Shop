package da;

import db.DBConnection;
import entity.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    //for product.jsp
    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product";

        try (Connection conn = DBConnection.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("PRODUCTID"));
                product.setCategoryID(rs.getString("CATEGORYID"));
                product.setName(rs.getString("NAME"));
                product.setDescription(rs.getString("DESCRIPTION"));
                product.setPrice(rs.getDouble("PRICE"));
                product.setStockQuantity(rs.getInt("STOCKQUANTITY"));
                product.setImage1(rs.getString("IMAGE1"));
                product.setImage2(rs.getString("IMAGE2"));
                product.setImage3(rs.getString("IMAGE3"));
                product.setImage4(rs.getString("IMAGE4"));
                product.setImage5(rs.getString("IMAGE5"));
                product.setAuthor(rs.getString("AUTHOR"));
                product.setDetails(rs.getString("DETAILS"));

                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public Product getProductById(int productId) {
        Product product = null;
        String query = "SELECT * FROM Product WHERE PRODUCTID = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                product = new Product();
                product.setProductID(rs.getInt("PRODUCTID"));
                product.setCategoryID(rs.getString("CATEGORYID"));
                product.setName(rs.getString("NAME"));
                product.setDescription(rs.getString("DESCRIPTION"));
                product.setPrice(rs.getDouble("PRICE"));
                product.setStockQuantity(rs.getInt("STOCKQUANTITY"));
                product.setImage1(rs.getString("IMAGE1"));
                product.setImage2(rs.getString("IMAGE2"));
                product.setImage3(rs.getString("IMAGE3"));
                product.setImage4(rs.getString("IMAGE4"));
                product.setImage5(rs.getString("IMAGE5"));
                product.setAuthor(rs.getString("AUTHOR"));
                product.setDetails(rs.getString("DETAILS"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
}
