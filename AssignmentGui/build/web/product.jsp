<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s ease-in-out;
            cursor: pointer;
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
    </style>
    <script>
        function filterProducts(category) {
            let products = document.querySelectorAll('.product');
            products.forEach(product => {
                if (category === 'all' || product.dataset.category === category) {
                    product.style.display = 'block';
                } else {
                    product.style.display = 'none';
                }
            });
        }
        function goToDetailPage(product) {
            window.location.href = `product_detail.jsp`;
        }
    </script>
</head>
<body>
    <jsp:include page="header.jsp" />
        <jsp:include page="header_product.jsp" />

   
    <div class="product-grid" style="margin-top: 50px">
        <div class="product" data-category="iMac" onclick="goToDetailPage('iMac')">
            <img src="sources/images/products/lp_1_a.png" alt="iMac" >
            <h3>iMac</h3>
            <p class="price">RM 6,699.00</p>
        </div>
        <div class="product" data-category="iMac" onclick="goToDetailPage('MacMini')">
            <img src="images/mac-mini.jpeg" alt="Mac Mini">
            <h3>Mac Mini</h3>
            <p class="price">RM 3,349.00</p>
        </div>
        <div class="product" data-category="Asus" onclick="goToDetailPage('Asus-All-in-One')">
            <img src="images/asus-all-in-one.webp" alt="Asus-All-in-One">
            <h3>ASUS AiO A3 (A3402WV)</h3>
            <p class="price">RM 2,699.00</p>
        </div>
        <div class="product" data-category="iMac" onclick="goToDetailPage('iMac')">
            <img src="sources/images/products/lp_1_a.png" alt="iMac" >
            <h3>iMac</h3>
            <p class="price">RM 6,699.00</p>
        </div>
        <div class="product" data-category="iMac" onclick="goToDetailPage('iMac')">
            <img src="sources/images/products/lp_1_a.png" alt="iMac" >
            <h3>iMac</h3>
            <p class="price">RM 6,699.00</p>
        </div>
        <div class="product" data-category="iMac" onclick="goToDetailPage('iMac')">
            <img src="sources/images/products/lp_1_a.png" alt="iMac" >
            <h3>iMac</h3>
            <p class="price">RM 6,699.00</p>
        </div>
        <div class="product" data-category="iMac" onclick="goToDetailPage('iMac')">
            <img src="sources/images/products/lp_1_a.png" alt="iMac" >
            <h3>iMac</h3>
            <p class="price">RM 6,699.00</p>
        </div>
        <div class="product" data-category="iMac" onclick="goToDetailPage('iMac')">
            <img src="sources/images/products/lp_1_a.png" alt="iMac" >
            <h3>iMac</h3>
            <p class="price">RM 6,699.00</p>
        </div>
        <div class="product" data-category="iMac" onclick="goToDetailPage('iMac')">
            <img src="sources/images/products/lp_1_a.png" alt="iMac" >
            <h3>iMac</h3>
            <p class="price">RM 6,699.00</p>
        </div>
    </div>
</body>
<jsp:include page="footer.jsp" />
</html>
