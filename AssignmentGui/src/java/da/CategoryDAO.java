package da;

import db.DBConnection;
import entity.Category;
import entity.Product;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {

    public CategoryDAO() {
    }

    public List<Category> getAllCategory() {
        List<Category> categoryList = new ArrayList<>();
        String query = "SELECT * FROM Category";

        try (Connection conn = DBConnection.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("CATEGORYID"));
                c.setName(rs.getString("CATEGORYNAME"));
                c.setImage(rs.getString("IMAGE"));

                categoryList.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryList;
    }
}
