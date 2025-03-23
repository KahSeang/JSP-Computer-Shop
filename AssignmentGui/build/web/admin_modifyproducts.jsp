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
            background-color: #ccc;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        button:hover {
            background-color: #717171;
        }

        hr {
            margin: 40px 0; /* Increased top and bottom spacing */
            border: 3px solid #ddd;
        }
    </style>
</head>
<body>

    <%@ include file="admin_sidebar.jsp" %>

    <div class="container">
        <h2>Modify Products</h2>
        <form action="#" method="post" enctype="multipart/form-data">
            
            <!-- Category Selection -->
            <label>Categories that you wish to modify to:</label>
            <select name="select_category" required>
                <option value="" disabled selected>-- Select Product --</option>
                <option value="Laptop">Laptop</option>
                <option value="Smartphone">Smartphone</option>
                <option value="Accessories">Accessories</option>
                <option value="Gaming">Gaming</option>
            </select>

             <label>Original Product Name:</label>
             <input type="text" name="ori_product_name" readonly>

            <!-- Upload Original Category Image -->
            <label>Original Product Image 1:</label>
            <input type="file" name="ori_product_img_1" accept="image/*">
            
            <label>Original Product Image 2:</label>
            <input type="file" name="ori_product_img_2" accept="image/*">
            
            <label>Original Product Image 3:</label>
            <input type="file" name="ori_product_img_3" accept="image/*">
            
            <label>Original Product Image 4:</label>
            <input type="file" name="ori_product_img_4" accept="image/*">
            
            <label>Original Storage 1:</label>
            <input type="text" name="ori_storage_product_1" readonly>
            
            <label>Original Storage 1 Details:</label>
            <input type="text" name="ori_storage_details_product_1" readonly>
            
            <label>Original Storage 2:</label>
            <input type="text" name="ori_storage_product_2" readonly>
            
            <label>Original Storage 2 Details:</label>
            <input type="text" name="ori_storage_details_product_1" readonly>
            
            <label>Original Short Description:</label>
            <input type="text" name="ori_product_description" readonly>
            
            <label>Original Details: </label>
            <input type="text" name="ori_product_details" readonly>

            <hr>
            
            <label>Product Name:</label>
            <input type="text" name="ori_category_name">

            <!-- Upload Original Category Image -->
            <label>Product Image 1:</label>
            <input type="file" name="product_img_1" accept="image/*">
            
            <label>Product Image 2:</label>
            <input type="file" name="product_img_2" accept="image/*">
            
            <label>Product Image 3:</label>
            <input type="file" name="product_img_3" accept="image/*">
            
            <label>Product Image 4:</label>
            <input type="file" name="product_img_4" accept="image/*">
            
            <label>Storage 1:</label>
            <input type="text" name="storage_product_1">
            
            <label>Storage 1 Details:</label>
            <input type="text" name="storage_details_product_1">
            
            <label>Storage 2:</label>
            <input type="text" name="storage_product_2">
            
            <label>Storage 2 Details:</label>
            <input type="text" name="storage_details_product_1">
            
            <label>Short Description:</label>
            <input type="text" name="product_description">
            
            <label>Details: </label>
            <input type="text" name="product_details">
            <!-- Submit Button -->
            <button type="submit">Modify</button>
        </form>
    </div>

</body>
</html>
