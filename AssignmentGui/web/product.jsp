<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, entity.Product" %>
<%@ page import="entity.Category" %>
<jsp:useBean id="productList" class="java.util.ArrayList" scope="session"/>
<jsp:useBean id="categories" class="java.util.ArrayList" scope="session"/>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Interactive Product Layout</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                background-color: white;
                margin: 0;
                padding: 0;
            }
            .product-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 59px;
                padding: 20px;
                max-width: 80%;
                margin: 20px auto;
            }
            .product {
                width: 350px; /* Fixed width */
                height: 350px; /* Fixed height */
                background: white;
                padding: 15px;
                border-radius: 10px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
                transition: transform 0.2s ease-in-out;
                cursor: pointer;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: space-between;
                text-align: center;
            }
            .product:hover {
                transform: scale(1.05);
            }
            .product img {
                width: 200px;
                height: 200px;
                object-fit: cover;
                border-radius: 5px;
            }
            .price {
                color: red;
                font-weight: bold;
                font-size: 16px;
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            }

            body {
            }

            /* Top Category Bar */
            .category-bar {
                background: #ffffff;
                padding: 10px 0;
                display: flex;
                gap: 20px;
                border-bottom: 1px solid #ddd;
                z-index: -1;
                align-items: center; /* Align items vertically */
                justify-content: center; /* Center the navigation links */
                flex: 1; /* Allow the nav to take up remaining space */
            }

            .category-bar a {
                text-decoration: none;
                color: #333;
                font-size: 16px;
                font-weight: 500;
                transition: 0.3s;
            }

            .category-bar a:hover {
                color: #007aff;
            }

            .header {
                background: white;
                padding: 15px 40px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                position: sticky;
                top: 0;
                width: 100%;
                z-index: 99;
            }

            .logo {
                font-size: 24px;
                font-weight: bold;
                color: #333;
                margin-right: 20px;
            }
            .search-bar {
                display: flex;
                align-items: center;
                justify-content: space-between;
                border: 1px solid #ddd;
                border-radius: 25px;
                padding: 5px 10px;
                background: #fff;
                width: 250px;
            }

            .search-bar input[type="text"] {
                flex: 1; /* Allows text input to take available space */
                border: none;
                outline: none;
                font-size: 14px;
                background: transparent;
                padding: 5px;
            }

            .search-bar input[type="submit"] {
                background: transparent;
                border: none;
                cursor: pointer;
                font-size: 16px;
                color: #555;
                padding: 5px;
            }


            .icons {
                display: flex;
                gap: 15px;
                font-size: 20px;
                cursor: pointer;
                color: #333;
            }

        </style>
        <script>

            function goToDetailPage(product) {
                window.location.href = `product_detail.jsp`;
            }
        </script>

    </head>

    <body>
        <jsp:include page="header.jsp" />

        <header class="header">
            <div class="logo">COT</div>
            <nav class="category-bar">
                <%
                    if (!categories.isEmpty()) {
                        for (Category c : (List<Category>) categories) {
                %>
                <a href="ProductServlet?categoryId=<%= c.getId()%>">
                    <%= c.getName()%> </a>
                    <%
                            }
                        }
                    %>

            </nav>         
            <%--<button type="submit">&#128269;</button> --%>

            <div class="search-bar">
                <form action="ProductServlet" method="GET">
                    <input type="text" name="search" placeholder="Search products...">
                    <input type="submit" value="&#128269;">

                </form>

            </div>
        </header>


        <div class="product-grid" style="margin-top: 50px;">
            <%
                if (!productList.isEmpty()) {
                    for (Product product : (List<Product>) productList) {
            %>
            <a href="ProductServlet?action=viewDetails&id=<%= product.getProductID()%>"  class="product" style="text-decoration:none;color: black;">
                <img src="<%= product.getImage1()%>" alt="<%= product.getName()%>">
                <h3><%= product.getName()%></h3>
                <p class="price">RM <%= product.getPrice()%></p>
            </a>
            <%
                }
            } else {
            %>
            <p>No products available.</p>
            <%
                }
            %>
        </div>

    </body>
    <jsp:include page="footer.jsp" />
</html>
