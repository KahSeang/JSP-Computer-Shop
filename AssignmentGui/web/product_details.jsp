<%@page import="java.util.ArrayList"%>
<%@ page import="entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="product" class="entity.Product" scope="session"/>
<% 
    String productId = request.getParameter("product_id");
    if (productId != null) {
        session.setAttribute("product_id", productId);
    }
%>

<%@ page import="java.util.List, entity.Storage" %>

<html>
    <head><title>Product Details</title>


        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f8f8;
            }

            .container {
                display: flex;
                max-width: 100%;
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            }

            /* Side Images */
            .side-images {
                width: 15%;
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .side-images img {
                width: 100%;
                height: auto;
                border-radius: 5px;
                cursor: pointer;
                transition: transform 0.3s ease;
            }

            .side-images img:hover {
                transform: scale(1.1);
            }

            /* Main Image */
            .main-image {
                width: 50%;
                padding: 0 20px;
            }

            .main-image img {
                width: 100%;
                height: auto;
                border-radius: 10px;
                transition: transform 0.3s ease;
            }

            .main-image img:hover {
                transform: scale(1.05);
            }

            /* Product Details */
            .product-details {
                width: 35%;
                padding: 20px;
            }

            .product-details h2 {
                font-size: 28px;
                color: #333;
                margin-bottom: 10px;
            }

            .product-details p {
                font-size: 16px;
                color: #555;
                margin-bottom: 15px;
            }

            .price {
                font-size: 36px;
                font-weight: bold;
                color: #000;
            }

            /* Quantity Selector */
            .quantity {
                display: flex;
                align-items: center;
                gap: 10px;
                margin: 15px 0;
            }

            .quantity button {
                background: #ddd;
                border: none;
                padding: 5px 10px;
                cursor: pointer;
                border-radius: 5px;
            }

            .quantity input {
                width: 40px;
                text-align: center;
                border: 1px solid #ddd;
                padding: 5px;
                border-radius: 5px;
            }

            /* Buttons */
            .buttons {
                display: flex;
                gap: 10px;
                margin-bottom: 20px;
            }

            .buttons button {
                flex: 1;
                padding: 12px;
                border: none;
                font-size: 16px;
                font-weight: bold;
                border-radius: 5px;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .buy-now {
                background: #000;
                color: white;
            }

            .buy-now:hover {
                background: #444;
            }

            .add-to-cart {
                background: #f8f8f8;
                border: 1px solid #000;
            }

            .add-to-cart:hover {
                background: #ddd;
            }

            .add-to-cart:disabled {
                opacity: 0.5; /* Make the button dimmer */
                cursor: not-allowed; /* Change cursor to indicate it's not clickable */
            }

            /* Expandable Sections */
            .expandable {
                border-top: 1px solid #ddd;
                padding: 10px 0;
                cursor: pointer;
                font-size: 18px;
                font-weight: bold;
                display: flex;
                justify-content: space-between;
            }

            .expandable-content {
                display: none;
                padding: 10px;
                color: #555;
            }

            .favorite-icon {
                float: right;
                font-size: 24px;
                border-radius: 50%;
                padding: 5px;
                cursor: pointer;
                transition: all 0.3s ease;
                color: grey;
            }

            .favorite-icon.active {
                color: red;
                border-color: red;
            }

            .pricing-section {
                display: flex;
                flex-wrap: wrap;
                gap: 15px; /* Space between price options */
                margin-bottom: 20px;
            }

            .price-option {
                flex: 1 1 calc(25% - 15px); /* 4 options per row with spacing */
                text-align: center;
                background: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                cursor: pointer;
                transition: all 0.3s ease;
                border: 2px solid transparent; /* Add border for selection */
            }

            .price-option:hover {
                background-color: #f8f8f8; /* Hover effect */
                transform: translateY(-5px); /* Slight lift on hover */
            }

            .price-option.selected {
                border: 2px solid #000; /* Highlight border for selected option */
                background-color: #f0f0f0; /* Highlight background for selected option */
                transform: scale(1.05); /* Slightly enlarge the selected option */
            }

            .price-option h3 {
                font-size: 20px;
                color: #333;
                margin-bottom: 10px;
            }

            .price-option p {
                font-size: 14px;
                color: #666;
                line-height: 1.4;
            }
            .favorite-button {
                border: none;
                background: none;
                cursor: pointer;
            }

            .favorite-button .fas.fa-heart {
                color: grey;
            }

            .favorite-button .fas.fa-heart.active {
                color: red;
            }

        </style>


    </head>
    <jsp:include page="header.jsp" />

    <body>

        <div class="container">

            <!-- Side Images -->
            <div class="side-images">
                <img src="<jsp:getProperty name='product' property='image1'/>" alt="Image 1" onclick="changeImage('<jsp:getProperty name='product' property='image1'/>')">
                <img src="<jsp:getProperty name='product' property='image2'/>" alt="Image 2" onclick="changeImage('<jsp:getProperty name='product' property='image2'/>')">
                <img src="<jsp:getProperty name='product' property='image3'/>" alt="Image 3" onclick="changeImage('<jsp:getProperty name='product' property='image3'/>')">
                <img src="<jsp:getProperty name='product' property='image4'/>" alt="Image 4" onclick="changeImage('<jsp:getProperty name='product' property='image4'/>')">
            </div>

            <!-- Main Image -->
            <div class="main-image">
                <img src="<jsp:getProperty name='product' property='image1'/>" alt="Main Image" id="mainImage">
            </div>

            <!-- Product Details -->
            <div class="product-details">
                <h2>
                    <jsp:getProperty name='product' property='name'/>
                    
                    <form action="wishlist" method="post">
                        <input type="hidden" name="product_id" value="<%= product.getProductID()%>">
                        <input type="hidden" name="action" value="${isFavorite ? 'remove' : 'add'}">
                        <button type="submit" class="favorite-button">
                            <i class="fas fa-heart ${isFavorite ? 'active' : ''}"></i>
                        </button>
                    </form>


                </h2>

                <p><jsp:getProperty name='product' property='author'/> </p>
                <p>Stock : <jsp:getProperty name='product' property='stockQuantity'/></p>

                <%
                    Object obj = session.getAttribute("storageOptions");
                    List<Storage> storageOptions = null;
                    if (obj instanceof List) {
                        storageOptions = (List<Storage>) obj;
                    }
                %>
                <div class="pricing-section">
                    <% if (storageOptions != null && !storageOptions.isEmpty()) { %>
                    <% for (Storage storage : storageOptions) {%>
                    <div class="price-option" data-price="<%= storage.getPrice() + product.getPrice()%>" onclick="selectPriceOption(this)">
                        <h3><%= storage.getSizeLabel()%></h3>
                        <p>From RM <%= storage.getPrice() + product.getPrice()%></p>
                    </div>
                    <% } %>
                    <% } else { %>
                    <p>No storage options available.</p>
                    <% }%>
                </div>


                <!-- Buttons -->
                <div class="buttons">
                    <button class="buy-now" disabled>BUY NOW</button>
                    <button class="add-to-cart" disabled>ADD TO CART</button>
                </div>

                <!-- Description -->
                <p>                    <jsp:getProperty name='product' property='description'/></p>

                <!-- Expandable Sections -->
                <div class="expandable" onclick="toggleSection('details')">Details <span>+</span></div>
                <div class="expandable-content" id="details"><jsp:getProperty name='product' property='details'/></div>
            </div>

        </div>


        <script>
            function changeImage(imageSrc) {
                document.getElementById("mainImage").src = imageSrc;
            }

            function increaseQuantity() {
                let qty = document.getElementById("quantity");
                qty.value = parseInt(qty.value) + 1;
            }

            function decreaseQuantity() {
                let qty = document.getElementById("quantity");
                if (qty.value > 1)
                    qty.value = parseInt(qty.value) - 1;
            }

            function toggleSection(id) {
                let section = document.getElementById(id);
                section.style.display = section.style.display === "block" ? "none" : "block";
            }

            function toggleFavorite(productId) {
                let heartIcon = document.querySelector(`.favorite-icon[data-id="${productId}"]`);
                let isFavorite = heartIcon.classList.contains("active");

                // Send request to server to add/remove wishlist
                fetch("wishlist", {
                    method: "POST",
                    headers: {"Content-Type": "application/x-www-form-urlencoded"},
                    body: `product_id=${productId}&action=${isFavorite ? 'remove' : 'add'}`
                })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                heartIcon.classList.toggle("active");
                            } else {
                                alert("Something went wrong!");
                            }
                        })
                        .catch(error => console.error("Error:", error));
            }

            function selectPriceOption(selectedOption) {
                // Remove the 'selected' class from all options
                document.querySelectorAll('.price-option').forEach(option => {
                    option.classList.remove('selected');
                });

                // Add the 'selected' class to the clicked option
                selectedOption.classList.add('selected');

                // Enable the buttons
                document.querySelector('.buy-now').disabled = false;
                document.querySelector('.add-to-cart').disabled = false;
            }

            // Function to handle "BUY NOW" button click
            document.querySelector('.buy-now').addEventListener('click', function () {
                const selectedOption = document.querySelector('.price-option.selected');
                if (selectedOption) {
                    const price = selectedOption.getAttribute('data-price');
                    alert(`You selected the option with price: RM ${price}`);
                    // Proceed with the purchase logic
                } else {
                    alert('Please select a price option before proceeding.');
                }
            });

            // Function to handle "ADD TO CART" button click
            document.querySelector('.add-to-cart').addEventListener('click', function () {
                const selectedOption = document.querySelector('.price-option.selected');
                if (selectedOption) {
                    const price = selectedOption.getAttribute('data-price');
                    alert(`Added to cart: RM ${price}`);
                    0

                    // Proceed with the add-to-cart logic
                } else {
                    alert('Please select a price option before adding to cart.');
                }
            });
        </script>

        <jsp:include page="footer.jsp" />
    </body>
</html>
