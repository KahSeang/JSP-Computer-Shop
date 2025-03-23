<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add New Category</title>
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
            border-radius: 8px;
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

        input, select, textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            resize: none; /* Prevent resizing */
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
    </style>
</head>
<body>

    <%@ include file="admin_sidebar.jsp" %>

    <div class="container">
        <h2>Add New Category</h2>
        <form action="add_category_process.jsp" method="post" enctype="multipart/form-data">
            
            <!-- Category Name -->
            <label>Category Name:</label>
            <input type="text" name="category_name" required>

            <!-- Upload Category Image -->
            <label>Upload Category Image:</label>
            <input type="file" name="category_image" accept="image/*" required>

            <!-- Status (Available or Not) -->
            <label>Available:</label>
            <select name="status">
                <option value="Yes">Yes</option>
                <option value="No">No</option>
            </select>

            <!-- Submit Button -->
            <button type="submit">Add Category</button>
        </form>
    </div>

</body>
</html>
