<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entity.User" %>
<% User user = (User) session.getAttribute("user"); %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>COT</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            /* General Styles */
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f9f9f9;
                padding-top: 80px;
            }

            /* Header Styles */
            header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 5%;
                background-color: #ffffff;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                z-index: 1000;
                height: 80px;
            }

            /* Logo */
            .logo {
                cursor: pointer;
                width: 80px;
                height: auto;
            }

            /* Navigation Links */
            .navlinks {
                list-style: none;
                display: flex;
                align-items: center;
            }

            .navlinks li {
                position: relative;
                margin: 0 15px;
            }

            .navlinks li a {
                color: #333;
                text-decoration: none;
                font-size: 16px;
                font-weight: 500;
                transition: color 0.3s ease;
            }

            .navlinks li a:hover {
                color: #007bff;
            }

            /* Dropdown Menu */
            .dropdown-content {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                background-color: #ffffff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
                z-index: 100;
                min-width: 160px;
            }

            .dropdown-content a {
                color: #333;
                padding: 10px 15px;
                display: block;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }

            .dropdown-content a:hover {
                background-color: #f8f9fa;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            /* Icons Section */
            .icons {
                display: flex;
                align-items: center;
                gap: 25px;
            }

            .icons a {
                color: #333;
                font-size: 20px;
                transition: color 0.3s ease;
            }

            .icons a:hover {
                color: #007bff;
            }

            /* Live Help Section */
            .live-help {
                display: flex;
                align-items: center;
                padding: 8px 12px;
                border-radius: 20px;
                transition: background-color 0.2s ease;
            }

            .live-help:hover {
                background-color: #f0f7ff;
            }

            .live-help i {
                margin-right: 8px;
                color: #007bff;
                font-size: 16px;
            }

            .live-help span {
                font-size: 14px;
                font-weight: 500;
                color: #333;
            }

            /* User Profile Container */
            .user-container {
                position: relative;
                display: flex;
                align-items: center;
                padding: 5px 10px 5px 5px;
                border-radius: 25px;
                background-color: #f5f5f5;
                cursor: pointer;
                transition: all 0.3s ease;
                border: 1px solid #e0e0e0;
            }

            .user-container:hover {
                background-color: #e8f0fe;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .user-icon {
                width: 34px;
                height: 34px;
                border-radius: 50%;
                object-fit: cover;
                margin-right: 8px;
            }

            .username {
                font-size: 14px;
                font-weight: 500;
                color: #333;
                margin-right: 5px;
            }

            .user-dropdown-arrow {
                color: #666;
                font-size: 12px;
                transition: transform 0.3s ease;
            }

            .user-container.active .user-dropdown-arrow {
                transform: rotate(180deg);
            }

            /* User Dropdown Menu */
            .user-dropdown {
                display: none;
                position: absolute;
                right: 0;
                top: 100%;
                background-color: #fff;
                min-width: 200px;
                box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.15);
                z-index: 1000;
                border-radius: 8px;
                overflow: hidden;
                margin-top: 10px;
                border: 1px solid #e0e0e0;
            }

            .user-dropdown a {
                color: #333;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                text-align: left;
                transition: background-color 0.3s ease;
                font-size: 14px;
            }

            .user-dropdown a i {
                margin-right: 10px;
                color: #007bff;
                width: 20px;
                text-align: center;
            }

            .user-dropdown a:hover {
                background-color: #f1f1f1;
            }

            .show {
                display: block;
            }

            /*
            pop up
            */

            .popup {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 300px;
                padding: 20px;
                background: white;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
                text-align: center;
                z-index: 1000;
            }

            .popup button {
                margin: 10px;
                padding: 10px;
                border: none;
                cursor: pointer;
            }

            .overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(15, 23, 42, 0.7);
                backdrop-filter: blur(8px);
                z-index: 100;
                animation: fadeIn 0.3s ease-out;
            }
            .login-btn {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 8px 20px;
                border-radius: 25px;
                background-color: #f5f5f5;
                color: #333;
                font-size: 14px;
                font-weight: 500;
                border: 1px solid #e0e0e0;
                cursor: pointer;
                transition: all 0.3s ease;
                height: 40px;
            }

            .login-btn:hover {
                background-color: #e8f0fe;
                border-color: #007bff;
                color: #007bff;
            }

            .login-btn:active {
                transform: scale(0.98);
            }

            .popup {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 600px;
                max-width: 90%;
                height: 350px; /* Fixed height */
                background: rgba(255, 255, 255, 0.95);
                border-radius: 20px;
                box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
                overflow: hidden; /* Ensures no overflow */
                z-index: 1001;
            }

            .popup-container {
                display: flex;
                height: 100%;
                width: 100%;
            }

            .popup-image {
                width: 45%;
                height: 100%; /* Full height of container */
                background: url('sources/images/popup_image.png') center/cover no-repeat;
                position: relative;
                border-radius: 10px;
            }

            .popup-content {
                width: 55%;
                height: 100%; /* Full height */
                padding: 40px;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            .popup-title {
                font-size: 24px;
                font-weight: 700;
                color: #111827;
                margin-bottom: 10px;
            }

            .popup-message {
                font-size: 16px;
                color: #4b5563;
                line-height: 1.6;
                margin-bottom: 30px;
            }

            .action-buttons {
                display: flex;
                flex-direction: column;
                gap: 12px;
            }

            .btn {
                padding: 14px 20px;
                border-radius: 10px;
                font-weight: 600;
                font-size: 15px;
                cursor: pointer;
                transition: all 0.2s ease;
                border: none;
                text-align: center;
                width: 100%;
            }

            .btn-login {
                background-color: grey;
                color: white;
                box-shadow: 0 4px 6px -1px rgba(79, 70, 229, 0.2);
            }

            .btn-login:hover {
                background-color: #6b7280;
                transform: translateY(-2px);
                box-shadow: 0 10px 15px -3px #6b7280;
            }

            .btn-register {
                background-color: grey;
                color: white;
                border: 1px solid #e5e7eb;
            }

            .btn-register:hover {
                background-color: #6b7280;
                transform: translateY(-2px);
                box-shadow: 0 10px 15px -3px #6b7280;
            }

            .btn-close {
                background-color: grey;
                color: white;
                border: 1px solid #e5e7eb;
            }

            .btn-close:hover {
                background-color: #6b7280;
                transform: translateY(-2px);
                box-shadow: 0 10px 15px -3px #6b7280;
            }

            .close-btn {
                position: absolute;
                top: 10px;
                right: 10px;
                width: 24px;
                height: 24px;
                cursor: pointer;
                opacity: 0.7;
                transition: opacity 0.2s;
                background: none;
                border: none;
                padding: 0;
                z-index: 1002;
            }

            .close-btn:hover {
                opacity: 1;
            }

            .close-btn::before, .close-btn::after {
                content: '';
                position: absolute;
                top: 50%;
                left: 50%;
                width: 18px;
                height: 2px;
                background-color: #6b7280;
            }

            .close-btn::before {
                transform: translate(-50%, -50%) rotate(45deg);
            }

            .close-btn::after {
                transform: translate(-50%, -50%) rotate(-45deg);
            }

            /* Animations */
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }

            @keyframes slideUp {
                from {
                    opacity: 0;
                    transform: translate(-50%, -40%);
                }
                to {
                    opacity: 1;
                    transform: translate(-50%, -50%);
                }
            }

            /* Responsive adjustments */
            @media (max-width: 768px) {
                .popup {
                    flex-direction: column;
                    height: auto;
                }

                .popup-image {
                    width: 100%;
                    height: 200px; /* Fixed height for mobile */
                }

                .popup-content {
                    width: 100%;
                    height: auto;
                }
            }
        </style>
    </head>
    <body>
        <header>
            <!-- Logo -->
            <a href="HomeServlet">
                <img class="logo" src="sources/images/logo.png" alt="logo">
            </a>
            <%
                HttpSession userSession = request.getSession(false);
                Object user2 = (userSession != null) ? userSession.getAttribute("user") : null;
                boolean isLoggedIn = (userSession != null && userSession.getAttribute("user") != null);

            %>

            <!-- Navigation Links -->
            <nav>
                <ul class="navlinks">
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="ProductServlet">Product</a></li>
                    <li><a href="contactus.jsp">Contact Us</a></li>
                        <% if (user2 != null) { %>
                    <li><a href="wishlist.jsp">Wishlist</a></li>
                    <li>
                        <div class="dropdown">
                            <a href="${pageContext.request.contextPath}/#">Order</a>
                            <div class="dropdown-content">
                                <a href="${pageContext.request.contextPath}/contactus.html">Order History</a>
                                <a href="${pageContext.request.contextPath}/contactus.html">Order Status</a>

                            </div>
                        </div>
                    </li>

                    <li><a href="chatbot.jsp">ChatBot</a></li>
                    <li>
                        <div class="dropdown">
                            <a href="${pageContext.request.contextPath}/joinus.html" class="dropbtn">ABCD</a>
                            <div class="dropdown-content">
                                <a href="${pageContext.request.contextPath}/review.html">Review</a>
                            </div>
                        </div>

                    </li>
                    <% }%>

                </ul>
            </nav>

            <!-- Icons (Cart and User) -->
            <!-- Icons (Cart and User) -->
            <div class="icons">
                <% if (user2 != null) {%>

                <a href="${pageContext.request.contextPath}/cart.jsp"><i class="fas fa-shopping-cart"></i></a>


                <div class="user-container" onclick="toggleUserDropdown(this)">
                    <img src="sources/images/user.png" alt="User Icon" class="user-icon">
                    <span class="username"><%= user.getUsername()%></span>
                    <i class="fas fa-chevron-down user-dropdown-arrow"></i>
                    <div id="userDropdown" class="user-dropdown">
                        <a href="userprofile.jsp"><i class="fas fa-user-circle"></i> Profile</a>
                        <a href="AddressServlet"><i class="fas fa-cog"></i>Address Settings</a>
                        <a href="login.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </div>
                </div>
                <% }%>
                <% if (user2 == null) { %>

                <a href="login.jsp">
                    <button class="login-btn">
                        Login
                    </button>
                </a>
                <% }%>

            </div>
        </header>

        <script>
            // Function to toggle the user dropdown menu
            function toggleUserDropdown() {
                var dropdown = document.getElementById("userDropdown");
                dropdown.classList.toggle("show");
            }

            // Close the dropdown if the user clicks outside of it
            window.onclick = function (event) {
                if (!event.target.matches('.user-icon')) {
                    var dropdowns = document.getElementsByClassName("user-dropdown");
                    for (var i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.classList.contains('show')) {
                            openDropdown.classList.remove('show');
                        }
                    }
                }
            }
        </script>

        <script>window.onclick = function (event) {
                if (!event.target.closest('.user-container')) {
                    var dropdown = document.getElementById("userDropdown");
                    var containers = document.getElementsByClassName("user-container");
                    if (dropdown.classList.contains('show')) {
                        dropdown.classList.remove('show');
                        for (var i = 0; i < containers.length; i++) {
                            containers[i].classList.remove('active');
                        }
                    }
                }
            }</script>


        <div class="overlay" id="overlay"></div>
        <div class="popup" id="popup">
            <button class="close-btn" onclick="closePopup()"></button>
            <div class="popup-container">
                <div class="popup-image"></div>
                <div class="popup-content">

                    <div class="action-buttons">
                        <button class="btn btn-login" onclick="window.location.href = 'login.jsp'">Sign In</button>
                        <button class="btn btn-register" onclick="window.location.href = 'register.jsp'">Create Account</button>
                        <button class="btn btn-close" onclick="closePopup()">Continue Browsing</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            window.onload = function () {
                var isLoggedIn = <%= isLoggedIn%>; // Pass JSP boolean value to JavaScript

                if (!isLoggedIn && !sessionStorage.getItem("popupShown")) { //这样的话只会一次
                    setTimeout(function () {
                        document.getElementById("popup").style.display = "block";
                        document.getElementById("overlay").style.display = "block";
                        sessionStorage.setItem("popupShown", "true"); // Store flag in session storage
                    }, 10000); // 10 seconds delay
                }
            };
        </script>

        <script>
            function closePopup() {
                document.getElementById("popup").style.display = "none";
                document.getElementById("overlay").style.display = "none";
            }

            // Show pop-up after 10 seconds if user is not logged in
            window.onload = function () {
                var isLoggedIn = <%= isLoggedIn%>; // Pass JSP boolean value to JavaScript
                if (!isLoggedIn) {
                    setTimeout(function () {
                        document.getElementById("popup").style.display = "block";
                        document.getElementById("overlay").style.display = "block";
                    }, 3000); // 10 seconds delay
                }
            };
        </script>

    </body>
</html>