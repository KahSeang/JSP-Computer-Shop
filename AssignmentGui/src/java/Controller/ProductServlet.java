package Controller;

import da.ProductDAO;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("viewDetails".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("id"));
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductById(productId);

            if (product != null) {
                HttpSession session = request.getSession();
                session.setAttribute("product", product); // Store product in session
                response.sendRedirect("product_details.jsp"); // Redirect instead of forward
            } else {
                response.sendRedirect("product.jsp");
            }
        } else {
            ProductDAO productDAO = new ProductDAO();
            List<Product> productList = productDAO.getAllProducts();
            request.getSession().setAttribute("productList", productList); // Store list in session
            response.sendRedirect("product.jsp");
        }
    }
}
