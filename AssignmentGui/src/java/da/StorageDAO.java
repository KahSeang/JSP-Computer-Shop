package da;

import db.DBConnection;
import entity.Storage;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StorageDAO {


    public List<Storage> getAllStorageByProductId(int productId) {
        List<Storage> storageList = new ArrayList<>();
        String sql = "SELECT s.* FROM storage s JOIN product_storage ps ON s.id = ps.storage_id WHERE ps.product_id = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                storageList.add(new Storage(
                        rs.getInt("id"),
                        rs.getInt("size"),
                        rs.getString("size_label"),
                        rs.getString("description"),
                        rs.getDouble("price")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return storageList;
    }
}
