package Controller;

import da.ProductDAO;
import entity.Product;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215) // Handles file uploads up to ~16MB
public class ProductAddServlet extends HttpServlet {

    // Set the upload directory path
    private static final String UPLOAD_DIR = "C:/Users/acer/Documents/NetBeansProjects/AssignmentGui/web/sources/uploads/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Retrieve product details from form
            int id = Integer.parseInt(request.getParameter("productID"));
            String categoryID = request.getParameter("category_id");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            int stockQuantity = Integer.parseInt(request.getParameter("stock_quantity"));
            String author = request.getParameter("author");
            String details = request.getParameter("details");

            // Ensure the upload directory exists
            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Handle image uploads
            String image1 = saveImage(request.getPart("image1"));
            String image2 = saveImage(request.getPart("image2"));
            String image3 = saveImage(request.getPart("image3"));
            String image4 = saveImage(request.getPart("image4"));
            String image5 = saveImage(request.getPart("image5"));

            // Create Product object
            Product product = new Product();
            product.setProductID(id);
            product.setCategoryID(categoryID);
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setStockQuantity(stockQuantity);
            product.setImage1(image1);
            product.setImage2(image2);
            product.setImage3(image3);
            product.setImage4(image4);
            product.setImage5(image5);
            product.setAuthor(author);
            product.setDetails(details);

            // Insert product into the database
            ProductDAO productDAO = new ProductDAO();
            boolean success = productDAO.insertProduct(product);

            // Redirect based on success/failure
            if (success) {
                response.sendRedirect("admin_addproducts.jsp?status=success");
            } else {
                response.sendRedirect("admin_addproducts.jsp?status=failure");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin_addproducts.jsp?status=error");
        }
    }

    private String saveImage(Part part) throws IOException {
        if (part == null || part.getSize() == 0) {
            return "default.png"; // Return a default image if no file is uploaded
        }

        // Extract filename from part
        String fileName = extractFileName(part);

        // Define the upload directory
        String uploadDir = "C:/Users/acer/Documents/NetBeansProjects/AssignmentGui/web/sources/uploads/";

        // Ensure the directory exists
        File uploadPath = new File(uploadDir);
        if (!uploadPath.exists()) {
            uploadPath.mkdirs();
        }

        // Correct file path
        String filePath = uploadDir + fileName;

        // Manually save the file
        File file = new File(filePath);
        try (InputStream fileContent = part.getInputStream(); FileOutputStream outputStream = new FileOutputStream(file)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }

        return fileName;
    }

    // Extracts the filename from the Part header
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String content : contentDisp.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1).replace("\\", "/");
            }
        }
        return "default.png";
    }
}
