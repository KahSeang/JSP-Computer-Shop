package Controller;

import da.AddressDAO;
import da.CityDAO;
import da.StateDAO;
import entity.Address;
import entity.City;
import entity.State;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;

public class AddressServlet extends HttpServlet {

    private AddressDAO addressDAO;
    private CityDAO cityDAO;
    private StateDAO stateDAO;

    @Override
    public void init() throws ServletException {
        addressDAO = new AddressDAO();
        cityDAO = new CityDAO();
        stateDAO = new StateDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Fetch data
        List<Address> addresses = addressDAO.getUserAddresses(user.getId());
        List<City> cities = cityDAO.getAllCities();
        List<State> states = stateDAO.getAllStates();
        String stateName = stateDAO.getStateNameById(user.getId(),addresses);
        String cityName = cityDAO.getCityNameById(user.getId(),addresses);

        // Use request scope instead of session scope
        request.setAttribute("addresses", addresses);
        request.setAttribute("cities", cities);
        request.setAttribute("states", states);

        request.setAttribute("cityName", cityName);
        request.setAttribute("stateName", stateName);

        // Forward request to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("useraddress.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            String addressType = request.getParameter("addressType");
            String street = request.getParameter("street");
            int cityId = Integer.parseInt(request.getParameter("city"));
            int stateId = Integer.parseInt(request.getParameter("state"));
            String zipCode = request.getParameter("zipCode");

            Address newAddress = new Address(user.getId(), addressType, street, cityId, stateId, zipCode);

            if (addressDAO.insertAddress(newAddress)) {
                response.sendRedirect("AddressServlet");
            } else {
                request.setAttribute("error", "Failed to insert address");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid data format");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

}
