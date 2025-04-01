<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Category</title>
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
                border: 1px solid #ddd;
            }
        </style>
    </head>
    <body>

        <%@ include file="admin_sidebar.jsp" %>
        <div class="main-content">

        <div class="container">
            <h2>Modify Category</h2>
            <form action="#" method="post" enctype="multipart/form-data">

                <!-- Category Selection -->
                <label>Select the Category to Change:</label>
                <select name="select_category" required>
                    <option value="" disabled selected>-- Select Category --</option>
                    <option value="Laptop">Laptop</option>
                    <option value="Smartphone">Smartphone</option>
                    <option value="Accessories">Accessories</option>
                    <option value="Gaming">Gaming</option>
                </select>

                <label>Original Category Name:</label>
                <input type="text" name="ori_category_name" readonly>

                <!-- Upload Original Category Image -->
                <label>Original Category Image:</label>
                <input type="file" name="ori_category_image" accept="image/*">

                <hr>

                <!-- New Category Name -->
                <label>New Category Name:</label>
                <input type="text" name="new_category_name" required>

                <!-- Upload New Category Image -->
                <label>New Category Image:</label>
                <input type="file" name="new_category_image" accept="image/*" required>

                <!-- Submit Button -->
                <button type="submit">Change</button>
            </form>
        </div>
        </div>
    </body>
</html>
