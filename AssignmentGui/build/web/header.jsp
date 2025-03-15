<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>TARUMT PHARMACY</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            /* General Styles */
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f9f9f9;
                padding-top: 80px; /* Add padding to avoid overlap with the fixed header */
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
                height: 80px; /* Fixed height for the header */
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

            /* Icons (Cart and User) */
            .icons {
                display: flex;
                align-items: center;
            }

            .icons a {
                color: #333;
                font-size: 20px;
                margin-left: 20px;
                transition: color 0.3s ease;
            }

            .icons a:hover {
                color: #007bff;
            }

            /* User Icon Dropdown */
            .user-menu {
                position: relative;
                display: inline-block;
                margin-left: 30px; /* Adjust the value to increase the gap */
            }

            .user-icon {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                cursor: pointer;
                border: 2px solid #ccc;
                transition: transform 0.3s ease, border-color 0.3s ease;
            }

            .user-icon:hover {
                transform: scale(1.1);
                border-color: #007bff;
            }

            .user-dropdown {
                display: none;
                position: absolute;
                right: 0;
                background-color: #fff;
                min-width: 200px;
                box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
                z-index: 1000;
                border-radius: 5px;
                overflow: hidden;
                margin-top: 10px;
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
            }

            .user-dropdown a:hover {
                background-color: #f1f1f1;
            }

            .show {
                display: block;
            }
        </style>
    </head>
    <body>
        <header>
            <!-- Logo -->
            <a href="home.jsp">
                <img class="logo" src="sources/images/logo.png" alt="logo">
            </a>

            <!-- Navigation Links -->
            <nav>
                <ul class="navlinks">
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="product.jsp">Product</a></li>
                    <li><a href="wishlist.jsp">Wishlist</a></li>
                                        <li><a href="contactus.jsp">Contact Us</a></li>


                    <li>
                        <div class="dropdown">
                            <a href="${pageContext.request.contextPath}/#">Order</a>
                            <div class="dropdown-content">
                                <a href="${pageContext.request.contextPath}/contactus.html">Order History</a>
                                <a href="${pageContext.request.contextPath}/contactus.html">Order Status</a>

                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="dropdown">
                            <a href="${pageContext.request.contextPath}/joinus.html" class="dropbtn">ABCD</a>
                            <div class="dropdown-content">
                                <a href="${pageContext.request.contextPath}/review.html">Review</a>
                            </div>
                        </div>

                    <li><a href="wishlist.jsp">ChatBot</a></li>

                    </li>
                </ul>
            </nav>

            <!-- Icons (Cart and User) -->
            <!-- Icons (Cart and User) -->
            <div class="icons">
                <a href="${pageContext.request.contextPath}/cart.html"><i class="fas fa-shopping-cart"></i></a>
                <div class="user-menu">
                    <img src="sources/images/user.png" alt="User Icon" class="user-icon" onclick="toggleUserDropdown()">
                    <div id="userDropdown" class="user-dropdown">
                        <a href="userprofile.jsp"><i class="fas fa-user-circle"></i> Profile</a>
                        <a href="settings.jsp"><i class="fas fa-cog"></i> Settings</a>
                        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </div>
                </div>
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
    </body>
</html>