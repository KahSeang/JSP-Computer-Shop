package Controller;

import da.UserDAO;
import entity.User;
import da.AdminDAO;
import entity.Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        UserDAO userDAO = new UserDAO();
        AdminDAO adminDAO = new AdminDAO();

        User user = userDAO.loginUser(username, password);
        Admin admin = adminDAO.loginAdmin(username, password);

        if (user != null) {
            session.setAttribute("user",user);
            session.setAttribute("role_ID", user.getRole_ID());
            session.setAttribute("username", user.getUsername());
            session.setAttribute("email", user.getEmail());
            
            response.sendRedirect("HomeServlet");
        } else if (admin != null) { 
            session.setAttribute("role_ID", admin.getRole_Id());
            session.setAttribute("username", admin.getUsername());
            session.setAttribute("email", admin.getEmail());
            response.sendRedirect("admin.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }
}
