<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wishlist</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .wishlist {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
        }
        .wishlist th, .wishlist td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        .wishlist th {
            background-color: #f4f4f4;
        }
        .add-to-cart {
            background-color: black;
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }
        .delete {
            color: red;
            cursor: pointer;
        }
        .product {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .product img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 5px;
        }
        .product-info {
            text-align: left;
        }
        .product-id {
            font-size: 12px;
            color: gray;
        }
    </style>
</head>
<body>
            <jsp:include page="header.jsp" />

    <h2 style="text-align: center;">♡ WISHLIST</h2>
    <table class="wishlist">
        <tr>
            <th>Product</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Stock Status</th>
            <th>Action</th>
        </tr>
        <tr>
            <td>
                <div class="product">
                    <img src="sources/images/products/lp_1_a.png" alt="Wooden Classical Chairs">
                    <div class="product-info">
                        Wooden Classical Chairs<br>
                        <span class="product-id">SKU: 12345</span>
                    </div>
                </div>
            </td>
            <td><button>-</button> 1 <button>+</button></td>
            <td><del>$405.00</del> <b>$375.00</b></td>
            <td>✔ 188 in stock</td>
            <td><button class="add-to-cart">Add to Cart</button> <span class="delete">🗑</span></td>
        </tr>
        <tr>
            <td>
                <div class="product">
                    <img src="bag.jpg" alt="Xanna Note">
                    <div class="product-info">
                        Xanna Note<br>
                        <span class="product-id">SKU: 12345-3-1-1</span>
                    </div>
                </div>
            </td>
            <td><button>-</button> 1 <button>+</button></td>
            <td>$505.00</td>
            <td>✔ 188 in stock</td>
            <td><button class="add-to-cart">Add to Cart</button> <span class="delete">🗑</span></td>
        </tr>
        <tr>
            <td>
                <div class="product">
                    <img src="airfryer.jpg" alt="Air Fryer with DualZone">
                    <div class="product-info">
                        Air Fryer with DualZone<br>
                        <span class="product-id">SKU: 12345-1</span>
                    </div>
                </div>
            </td>
            <td><button>-</button> 1 <button>+</button></td>
            <td>$300.00</td>
            <td>✔ 187 in stock</td>
            <td><button class="add-to-cart">Add to Cart</button> <span class="delete">🗑</span></td>
        </tr>
        <tr>
            <td>
                <div class="product">
                    <img src="jacket.jpg" alt="Stainless Steel Freing">
                    <div class="product-info">
                        Stainless Steel Freing<br>
                        <span class="product-id">SKU: 12345-3</span>
                    </div>
                </div>
            </td>
            <td><button>-</button> 1 <button>+</button></td>
            <td><del>$705.00</del> <b>$545.00</b></td>
            <td>✔ 188 in stock</td>
            <td><button class="add-to-cart">Add to Cart</button> <span class="delete">🗑</span></td>
        </tr>
    </table>
</body>
</html>
