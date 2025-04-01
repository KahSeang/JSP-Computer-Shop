package Controller;

import da.AdminDAO;
import entity.Admin;
import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterAdminServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin newAdmin = new Admin( email, username, password, 2);

        AdminDAO adminDAO = new AdminDAO();
        boolean success = adminDAO.registerAdmin(newAdmin);

        if (success) {
            out.println("<script>alert('Registration Sucessfull! .');</script>");
            response.sendRedirect("login.jsp");

        } else {
            out.println("<script>alert('Registration Failed! .');</script>");
        }
    }
}
