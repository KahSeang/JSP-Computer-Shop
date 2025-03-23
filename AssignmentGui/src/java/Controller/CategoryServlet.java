/*package Controller;

import da.CategoryDAO;
import entity.Category;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
@WebServlet("/categories")
public class CategoryServlet extends HttpServlet {
    
    private CategoryDAO categoryDAO;

    @Override
    public void init() throws ServletException {
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = categoryDAO.getAllCategories();


        if (categories == null || categories.isEmpty()) {
            System.out.println("No categories found!");
        }

        request.setAttribute("categories", categories);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        categoryDAO.close();
    }
}
*/