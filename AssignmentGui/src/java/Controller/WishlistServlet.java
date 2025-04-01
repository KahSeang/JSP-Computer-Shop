package Controller;

import da.WishlistDAO;
import entity.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private WishlistDAO wishlistDAO;

    public void init() {
        wishlistDAO = new WishlistDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();
        String action = request.getParameter("action");

        if ("add".equals(action) || "remove".equals(action)) {
            // Get product_id from session instead of request parameter
            String productIdStr = (String) session.getAttribute("product_id");

            if (productIdStr == null || productIdStr.isEmpty()) {
                response.sendRedirect("wishlist.jsp?error=missing_product_id");
                return;
            }
            System.out.println("Action: " + action);
            System.out.println("Product ID from session: " + productIdStr);

            try {
                int productId = Integer.parseInt(productIdStr);
                boolean success = "add".equals(action)
                        ? wishlistDAO.addToWishlist(userId, productId)
                        : wishlistDAO.removeFromWishlist(userId, productId);

                // Clear product_id from session after use
                session.removeAttribute("product_id");

                response.sendRedirect(success ? "wishlist.jsp?success=true" : "wishlist.jsp?error=true");
            } catch (NumberFormatException e) {
                response.sendRedirect("wishlist.jsp?error=invalid_product_id");
            }
        }
    }
}
