<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Products</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            .container {
                width: 85%;
                background: white;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h2 {
                text-align: center;
                color: #333;
            }

            label {
                display: block;
                margin: 10px 0 5px;
                font-weight: bold;
            }

            input, select {
                width: 100%;
                padding: 8px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            textarea {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: none; /* Prevent resizing */
                margin-bottom: 15px;
            }

            button {
                background-color: red;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
                font-size: 16px;
            }

            button:hover {
                background-color: indianred;
            }

            hr {
                margin: 40px 0; /* Increased top and bottom spacing */
                border: 1px solid #ddd;
            }
        </style>
    </head>
    <body>

        <%@ include file="admin_sidebar.jsp" %>

        <div class="main-content">

            <div class="container">
                <h2>Add Products</h2>
                <form action="ProductAddServlet" method="post" enctype="multipart/form-data">
                    <label>Product Name:</label>
                    <input type="text" name="name" required>

                    <label>Product ID</label>
                    <input type="text" name="productID" required>

                    <label>Category:</label>
                    <input name="category_id" type="text">

                    <label>Description:</label>
                    <textarea name="description" required></textarea>

                    <label>Price:</label>
                    <input type="number" step="0.01" name="price" required>

                    <label>Stock Quantity:</label>
                    <input type="number" name="stock_quantity" required>

                    <label>Author:</label>
                    <input type="text" name="author">

                    <label>Details:</label>
                    <textarea name="details"></textarea>

                    <!-- comment -->    
                    <label>Storage Option:</label>
                    <input type="text" name="storage_id">

                    <!-- Image Uploads -->
                    <label>Upload Image 1:</label>
                    <input type="file" name="image1" accept="image/*" required>
                    <label>Upload Image 2:</label>
                    <input type="file" name="image2" accept="image/*">
                    <label>Upload Image 3:</label>
                    <input type="file" name="image3" accept="image/*">
                    <label>Upload Image 4:</label>
                    <input type="file" name="image4" accept="image/*">
                    <label>Upload Image 5:</label>
                    <input type="file" name="image5" accept="image/*">

                    <input type="submit" value="Add Product">
                </form>

            </div>
        </div>
    </body>
</html>
