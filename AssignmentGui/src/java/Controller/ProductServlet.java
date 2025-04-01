package Controller;

import entity.Storage;
import da.StorageDAO;
import da.CategoryDAO;
import da.ProductDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

    private CategoryDAO categoryDAO;
    private ProductDAO productDAO;
    private StorageDAO storageDAO;

    @Override
    public void init() throws ServletException {
        categoryDAO = new CategoryDAO();
        productDAO = new ProductDAO();
        storageDAO = new StorageDAO();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if (request.getParameter("search") != null) {
            String searchQuery = request.getParameter("search");
            List<Product> searchResults = productDAO.searchProducts(searchQuery);
            session.setAttribute("productList", searchResults);
            response.sendRedirect("product.jsp");
            return;
        }

        if ("viewDetails".equals(action)) {
            try {
                int productId = Integer.parseInt(request.getParameter("id"));
                Product product = productDAO.getProductById(productId);
                List<Storage> storageOptions = storageDAO.getAllStorageByProductId(productId);

                if (product != null) {
                    session.setAttribute("product", product);
                    session.setAttribute("storageOptions", storageOptions);

                    response.sendRedirect("product_details.jsp");
                } else {
                    response.sendRedirect("product.jsp");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("product.jsp");
            }
        } else if (request.getParameter("categoryId") != null) {
            try {
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                List<Product> filteredProducts = productDAO.getProductsByCategory(categoryId);
                session.setAttribute("productList", filteredProducts);
                List<Category> categories = categoryDAO.getAllCategory(); //set 多一次因为HOME PAGE CALL

                session.setAttribute("categories", categories);

            } catch (NumberFormatException e) {
                session.setAttribute("productList", productDAO.getAllProducts());
            }
            response.sendRedirect("product.jsp");
        } else {
            List<Product> productList = productDAO.getAllProducts();
            List<Category> categories = categoryDAO.getAllCategory();
            session.setAttribute("categories", categories);
            session.setAttribute("productList", productList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("product.jsp");
            dispatcher.forward(request, response);
        }

    }
}
