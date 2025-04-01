<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, entity.Address, entity.State, entity.City" %>
<%
    List<Address> addresses = (List<Address>) request.getAttribute("addresses");
    List<State> states = (List<State>) request.getAttribute("states");
    List<City> cities = (List<City>) request.getAttribute("cities");

    if (addresses == null) {
        addresses = java.util.Collections.emptyList();
    }
    if (states == null) {
        states = java.util.Collections.emptyList();
    }
    if (cities == null) {
        cities = java.util.Collections.emptyList();
    }

String cityName = (String) request.getAttribute("cityName");
String stateName = (String) request.getAttribute("stateName");

%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Address Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f4f4f4;
            }
            .container {
                max-width: 1200px;
                margin: auto;
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .address-box {
                padding: 15px;
                border: 1px solid #ddd;
                margin: 10px 0;
                border-radius: 5px;
                background: #fff;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }
            input, select {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }
            button {
                width: 100%;
                padding: 10px;
                background: #007bff;
                color: white;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                font-size: 16px;
            }
            button:hover {
                background: #0056b3;
            }
            h2, h3 {
                text-align: center;
            }
        </style>
    </head>
            <jsp:include page="header.jsp" />

    <body>
        <div class="container">
            <h2>User Address Page</h2>

            <h3>Owned Addresses</h3>
            <p><strong>Total Addresses:</strong> <%= addresses.size()%></p>

            <% if (addresses.isEmpty()) { %>
            <p>No addresses found.</p>
            <% } else { %>
            <div>
                <% for (Address address : addresses) {%>
                <div class="address-box">
                    <strong><%= address.getAddressType()%></strong><br>
                    <%= address.getStreet()%>,
                    <%= address.getZipCode()%>,
                    <%= stateName %>,
                    <%= cityName%>
                    

                </div>
                <% } %>
            </div>
            <% } %>

            <h3>Add New Address</h3>
            <form method="POST" action="AddressServlet">
                <div class="form-group">
                    <label for="addressType">Address Type</label>
                    <input type="text" name="addressType" required>
                </div>

                <div class="form-group">
                    <label for="street">Street</label>
                    <input type="text" name="street" required>
                </div>

                <div class="form-group">
                    <label for="state">State</label>
                    <select name="state" id="state" required>
                        <option value="">Select State</option>
                        <% for (State state : states) {%>
                        <option value="<%= state.getStateId()%>"><%= state.getStateName()%></option>
                        <% } %>
                    </select>
                </div>

                <div class="form-group">
                    <label for="city">City</label>
                    <select name="city" id="city" required>
                        <option value="">Select City</option>
                        <% for (City city : cities) {%>
                        <option value="<%= city.getCityId()%>"><%= city.getCityName()%></option>
                        <% }%>
                    </select>
                </div>

                <div class="form-group">
                    <label for="zipCode">Zip Code</label>
                    <input type="text" name="zipCode" required>
                </div>

                <input type="submit" value="Add Address">
            </form>
        </div>
    </body>
</html>
