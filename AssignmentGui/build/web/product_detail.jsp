
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Event Details</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            /* CSS for event details page */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f0f0f0;
            }

            .container {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                max-width: 100%;
                margin: 20px auto;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }

            .side-images {
                width: 20%;
                padding: 20px;
                box-sizing: border-box;
            }

            .side-images img {
                display: block;
                width: 130px;
                height: 130px;
                object-fit: cover;
                border-radius: 5px;
                margin-bottom: 10px;
                cursor: pointer;
                transition: transform 0.3s ease;
            }

            .side-images img:hover {
                transform: scale(1.05);
            }

            .event-details {
                width: 80%;
                padding: 20px;
                box-sizing: border-box;
            }

            .event-details h2 {
                font-size: 24px;
                color: #333;
                margin: 0 0 10px;
            }

            .event-details img {
                width: 100%;
                height: 400px;
                object-fit: cover;
                border-radius: 5px;
                margin-bottom: 20px;
                transition: transform 0.3s ease;
            }

            .event-details img:hover {
                transform: scale(1.05);
            }

            .event-details p {
                font-size: 16px;
                color: #666;
                margin: 10px 0;
            }

            #map {
                height: 400px;
                width: 100%;
            }

            .action-buttons {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            .action-buttons button {
                border: none;
                outline: none;
                cursor: pointer;
                transition: background-color 0.3s;
                padding: 10px;
                margin: 0 10px;
            }

            .action-buttons button:hover {
                background-color: #333;
            }

            .favorite-button {
                background-color: red;
                color: #fff;
            }

            .cart-button {
                background-color: #4caf50;
                color: #fff;
            }

            .submit-button {
                background-color: #007bff;
                color: #fff;
            }

            .action-buttons i.fa {
                font-size: 24px;
            }
            .product-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                width: 80%;
                margin: auto;
            }

            .product-image img {
                width: 100%;
                max-width: 400px;
                border-radius: 10px;
            }

            .product-details {
                background: rgba(255, 255, 255, 0.2);
                backdrop-filter: blur(8px);
                padding: 20px;
                border-radius: 15px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
                text-align: center;
            }

            .product-details p {
                font-size: 16px;
                color: black;
                margin: 10px 0;
            }

            .price-container {
                color: red;
                font-weight: bold;
                font-size: 18px;
                margin-top: 10px;
            }

            .original-price {
                text-decoration: line-through;
                color: #bbb;
            }

            .hot-deal {
                background: red;
                color: white;
                padding: 5px 10px;
                border-radius: 5px;
            }

            .action-buttons {
                display: flex;
                justify-content: space-around;
                margin-top: 20px;
            }

            .action-buttons button {
                border: none;
                outline: none;
                cursor: pointer;
                padding: 12px 20px;
                font-size: 16px;
                font-weight: bold;
                border-radius: 10px;
                transition: all 0.3s ease-in-out;
            }

            .favorite-button {
                background: rgba(255, 0, 0, 0.8);
                color: white;
                box-shadow: 0 4px 10px rgba(255, 0, 0, 0.3);
            }

            .favorite-button:hover {
                background: rgba(255, 0, 0, 1);
            }

            .cart-button {
                background: rgba(76, 175, 80, 0.8);
                color: white;
                box-shadow: 0 4px 10px rgba(76, 175, 80, 0.3);
            }

            .cart-button:hover {
                background: rgba(76, 175, 80, 1);
            }

            .submit-button {
                background: rgba(0, 123, 255, 0.8);
                color: white;
                box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
            }

            .submit-button:hover {
                background: rgba(0, 123, 255, 1);
            }
            .cart-controls {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 10px;
            }

            .cart-controls input {
                width: 40px;
                text-align: center;
            }

            .minus, .plus {
                background: gray;
                color: white;
                border: none;
                padding: 5px 10px;
                margin: 0 5px;
                cursor: pointer;
            }

        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="container">
            <div class="side-images">
                <img src="sources/images/products/lp_1_a.png" alt="Side Image 1" onmouseover="changeMainImage('sources/images/products/lp_1_a.png')" onmouseout="resetMainImage()">
                <img src="sources/images/products/lp_1_b.png" alt="Side Image 2" onmouseover="changeMainImage('sources/images/products/lp_1_a.png')" onmouseout="resetMainImage()">
                <img src="sources/images/products/lp_1_c.png" alt="Side Image 3" onmouseover="changeMainImage('sources/images/products/lp_1_a.png')" onmouseout="resetMainImage()">
                <img src="sources/images/products/lp_1_d.png" alt="Side Image 4" onmouseover="changeMainImage('sources/images/products/lp_1_a.png')" onmouseout="resetMainImage()">
                <img src="sources/images/products/lp_1_a.png" alt="Side Image 5" onmouseover="changeMainImage('sources/images/products/lp_1_a.png')" onmouseout="resetMainImage()">
            </div>

            <div class="event-details">
                <h2>Product Name</h2>
                <img src="sources/images/products/lp_1_a.png" alt="Event Image" id="mainImage">

                <div class="product-details">
                    <p><strong>Description:</strong> This is a sample event description.</p>
                    <p><strong>Available:</strong> 50 units</p>
                    <p><strong>Price:</strong> RM4,997</p>

                    <div class="price-container">
                        <span class="original-price">Was RM5,399</span>
                        <span class="hot-deal">HOT DEAL</span>
                    </div>

                    <div class="cart-controls">
                        <button class="minus">-</button>
                        <input type="number" value="1">
                        <button class="plus">+</button>
                    </div>

                    <div class="action-buttons">
                        <button class="favorite-button"><i class="fa fa-heart"></i> Favorite</button>
                        <button class="cart-button"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                        <button class="submit-button"><i class="fa fa-check"></i> Buy Now</button>
                    </div>
                </div>

            </div>
        </div>

        <script>
            function changeMainImage(imageSrc) {
                document.getElementById("mainImage").src = imageSrc;
            }

            function resetMainImage() {
                document.getElementById("mainImage").src = "sources/images/products/lp_1_a.png";
            }


        </script>

        <jsp:include page="footer.jsp" />

    </body>
</html>
