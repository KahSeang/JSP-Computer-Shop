<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leon Accent Chair</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
            margin-bottom: 10px;
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


    </style>
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="container">
        
        <!-- Side Images -->
        <div class="side-images">
            <img src="sources/images/products/lp_1_a.png" alt="Image 1" onclick="changeImage('sources/images/products/chair_1.png')">
            <img src="sources/images/products/lp_1_b.png" alt="Image 2" onclick="changeImage('sources/images/products/chair_2.png')">
            <img src="sources/images/products/lp_1_c.png" alt="Image 3" onclick="changeImage('sources/images/products/chair_3.png')">
            <img src="sources/images/products/lp_1_d.png" alt="Image 4" onclick="changeImage('sources/images/products/chair_4.png')">
        </div>

        <!-- Main Image -->
        <div class="main-image">
            <img src="sources/images/products/lp_1_c.png" alt="Main Image" id="mainImage">
        </div>

        <!-- Product Details -->
        <div class="product-details">
            <h2>
                Product Details
                <i class="fas fa-heart favorite-icon" onclick="toggleFavorite()"></i>
            </h2>
            <p>by Carly Cushnie</p>
            <p class="price">$1,198</p>


            <!-- Quantity Selector -->
            <div class="quantity">
                <button onclick="decreaseQuantity()">-</button>
                <input type="number" value="1" id="quantity">
                <button onclick="increaseQuantity()">+</button>
            </div>

            <!-- Buttons -->
            <div class="buttons">
                <button class="buy-now">BUY NOW</button>
                <button class="add-to-cart">ADD TO CART</button>
            </div>

            <p>Fashion designer and creative director Carly Cushnie brings her celebrated sense of style to interiors with her first-ever line of furniture exclusively for Lulu and Georgia.</p>

            <!-- Expandable Sections -->
            <div class="expandable" onclick="toggleSection('details')">Details <span>+</span></div>
            <div class="expandable-content" id="details">This chair features a modern, tufted design with a natural boucle finish.</div>

            <div class="expandable" onclick="toggleSection('dimensions')">Dimensions <span>+</span></div>
            <div class="expandable-content" id="dimensions">Height: 32", Width: 28", Depth: 30"</div>

            <div class="expandable" onclick="toggleSection('care')">Care <span>+</span></div>
            <div class="expandable-content" id="care">Spot clean with a damp cloth. Avoid harsh chemicals.</div>

            <div class="expandable" onclick="toggleSection('sustainability')">Sustainability <span>+</span></div>
            <div class="expandable-content" id="sustainability">Made from eco-friendly materials.</div>
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
            if (qty.value > 1) qty.value = parseInt(qty.value) - 1;
        }

        function toggleSection(id) {
            let section = document.getElementById(id);
            section.style.display = section.style.display === "block" ? "none" : "block";
        }
        
        function toggleFavorite() {
            let heartIcon = document.querySelector(".favorite-icon");
            heartIcon.classList.toggle("active");
        }

    </script>

    <jsp:include page="footer.jsp" />

</body>
</html>
