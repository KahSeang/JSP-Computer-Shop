package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entity.User;
import da.UserDAO;

public class UserUpdateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        user.setUsername(username);
        user.setEmail(email);
        user.setPhone(phone);

        UserDAO userDAO = new UserDAO(); // Assumes UserDAO handles the connection internally
        boolean updateSuccess = userDAO.updateUserProfile(user);

        if (updateSuccess) {
            session.setAttribute("user", user);
            request.setAttribute("message", "Profile updated successfully!");
            request.getRequestDispatcher("userprofile.jsp").forward(request, response);

        } else {
            request.setAttribute("error", "Email or Username already in use!");
            request.getRequestDispatcher("userprofile.jsp").forward(request, response);

        }
    }
}
