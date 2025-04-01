package da;

import db.DBConnection;
import entity.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import da.StorageDAO;
import entity.Storage;
import entity.ProductStorage;

public class ProductDAO {

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

    public List<Product> getProductsByCategory(int categoryId) {
        List<Product> productList = new ArrayList<>();
        String query;

        if (categoryId == 0) {
            query = "SELECT * FROM Product"; // Retrieve all products
        } else {
            query = "SELECT * FROM Product WHERE CATEGORYID = ?";
        }

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

            if (categoryId != 0) {
                stmt.setInt(1, categoryId);
            }

            ResultSet rs = stmt.executeQuery();

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

    public List<Product> searchProducts(String keyword) {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE LOWER(NAME) LIKE LOWER(?)";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, "%" + keyword.toLowerCase() + "%");

            ResultSet rs = stmt.executeQuery();

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

    public boolean insertProduct(Product product) {
        String productQuery = "INSERT INTO Product (CATEGORYID, NAME, DESCRIPTION, PRICE, STOCKQUANTITY, IMAGE1, IMAGE2, IMAGE3, IMAGE4, IMAGE5, AUTHOR, DETAILS ,PRODUCTID ) VALUES (? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false); // Start transaction

            // Insert product
            int productId;
            try (PreparedStatement productStmt = conn.prepareStatement(productQuery, Statement.RETURN_GENERATED_KEYS)) {
                productStmt.setString(1, product.getCategoryID());
                productStmt.setString(2, product.getName());
                productStmt.setString(3, product.getDescription());
                productStmt.setDouble(4, product.getPrice());
                productStmt.setInt(5, product.getStockQuantity());
                productStmt.setString(6, product.getImage1());
                productStmt.setString(7, product.getImage2());
                productStmt.setString(8, product.getImage3());
                productStmt.setString(9, product.getImage4());
                productStmt.setString(10, product.getImage5());
                productStmt.setString(11, product.getAuthor());
                productStmt.setString(12, product.getDetails());
                productStmt.setInt(13, product.getProductID());

                int rowsInserted = productStmt.executeUpdate();
                if (rowsInserted == 0) {
                    conn.rollback();
                    return false;
                }

                // Retrieve generated product ID
                try (ResultSet generatedKeys = productStmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        productId = generatedKeys.getInt(1);
                    } else {
                        conn.rollback();
                        return false;
                    }
                }
            }

     
            conn.commit(); // Commit transaction
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
