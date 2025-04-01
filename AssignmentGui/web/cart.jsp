<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping Cart</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f9f9f9;
            }

            .cart-container {
                width: 100%;
                margin: auto;
                padding: 20px 50px;
                background-color: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }

            h2 {
                text-align: left;
            }

            .cart-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            .cart-table th, .cart-table td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }

            .cart-table th {
                background-color: #f4f4f4;
                font-weight: bold;
            }

            .cart-table img {
                width: 80px;
                height: 80px;
                object-fit: cover;
                border-radius: 5px;
            }

            .delete {
                color: red;
                cursor: pointer;
                font-size: 18px;
            }

            .total-summary {
                width: 100%;
                margin-top: 20px;
                display: flex;
                justify-content: flex-end;
            }

            .total-box {
                width: 40%;
                background-color: #f9f9f9;
                padding: 15px;
                border-radius: 8px;
            }

            .total-box p {
                display: flex;
                justify-content: space-between;
                font-size: 16px;
            }

            .checkout-buttons {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            .checkout-buttons a {
                text-decoration: none;
                padding: 10px 15px;
                border-radius: 5px;
                font-weight: bold;
                text-align: center;
            }

            .continue-shopping {
                background-color: #ddd;
                color: black;
            }

            .checkout {
                background-color: #72bcd4;
                color: white;
            }
        </style>
    </head>
    <body>
        <!-- HEADER -->
        <jsp:include page="header.jsp" />

        <!-- SHOPPING CART SECTION -->
        <div class="cart-container">
            <h2>SHOPPING CART</h2>
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>PRODUCT</th>
                        <th>DETAILS</th>
                        <th>UNIT PRICE</th>
                        <th>QUANTITY</th>
                        <th>TOTAL AMOUNT</th>
                        <th>ACTION</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><img src="sources/images/products/lp_1_a.png" alt="Men’s Canvas Belt"></td>
                        <td>Brown Leather <br> 36 Inches</td>
                        <td>$130</td>
                        <td>
                            <button>-</button> 1 <button>+</button>
                        </td>
                        <td>$130</td>
                        <td><span class="delete">🗑</span></td>
                    </tr>
                    <tr>
                        <td><img src="sources/images/products/lp_1_a.png" alt="Leyva Pure Leather Belt"></td>
                        <td>Brown Leather <br> 36 Inches</td>
                        <td>$200</td>
                        <td>
                            <button>-</button> 2 <button>+</button>
                        </td>
                        <td>$400</td>
                        <td><span class="delete">🗑</span></td>
                    </tr>
                    <tr>
                        <td><img src="sources/images/products/lp_1_a.png" alt="iPhone 8 Plus"></td>
                        <td>Space Grey <br> 64GB</td>
                        <td>$999</td>
                        <td>
                            <button>-</button> 1 <button>+</button>
                        </td>
                        <td>$999</td>
                        <td><span class="delete">🗑</span></td>
                    </tr>
                </tbody>
            </table>



            <!-- TOTAL PRICE SECTION -->
            <div class="total-summary">
                <div class="total-box">
                    <p>Sub Total: <span>$1529</span></p>
                    <p>Shipping: <span>$15</span></p>
                    <p>Discount: <span>$0</span></p>
                    <hr>
                    <p><strong>Total:</strong> <span><b>$1544</b></span></p>
                </div>
            </div>

            <!-- CHECKOUT BUTTONS -->
            <div class="checkout-buttons">
                <a href="product.jsp" class="continue-shopping">CONTINUE SHOPPING</a>
                <a href="checkout.jsp" class="checkout">CHECKOUT</a>
            </div>
        </div>

        <!-- FOOTER -->
        <jsp:include page="footer.jsp" />
    </body>
</html>