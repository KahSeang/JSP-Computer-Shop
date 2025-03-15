package Controller;

import da.UserDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirm_password");

            if (email == null || email.isEmpty() ||
                username == null || username.isEmpty() ||
                password == null || password.isEmpty() ||
                confirmPassword == null || confirmPassword.isEmpty()) {
                
                out.println("<script>alert('All fields are required!'); window.location='register.jsp';</script>");
                return;
            }

            if (!password.equals(confirmPassword)) {
                out.println("<script>alert('Passwords do not match!'); window.location='register.jsp';</script>");
                return;
            }

            User user = new User(email, username, password);
            UserDAO userDAO = new UserDAO();

            boolean isRegistered = userDAO.registerUser(user);

            if (isRegistered) {
                response.sendRedirect("register.jsp");
            } else {
                out.println("<script>alert('Registration failed! Username or Email may already exist.'); window.location='register.jsp';</script>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles user registration";
    }
}

