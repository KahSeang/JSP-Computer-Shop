<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mod. Pharma Analytics Hub</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            
            margin: 0;
            padding: 0;
            display: flex;
            background-color: #f8f9fa;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background-color: #ddd;
            color: #000;
            padding: 20px;
            height: auto;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
        }

        .sidebar h2 {
            color: #2c3e50;
            text-align: center;
        }
        
        .sidebar h3{
            color: #2c3e50;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 10px 0;
        }

        .sidebar ul li a {
            color: #000;
            text-decoration: none;
            font-size: 16px;
            display: flex;
            align-items: center;
            padding: 8px 10px;
            width: 100%;
        }

        .sidebar ul li a i {
            margin-right: 10px; /* Moves icon to the left of text */
        }

        .sidebar ul li a:hover {
            color: #3498db;
        }

        /* Dropdown Content */
        .dropdown-content {
            display: none;
            padding-left: 20px;
        }

        .dropdown-content a {
            display: block;
            font-size: 14px;
            padding: 5px 0;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 20px;
            background-color: #f8f9fa;
        }

        .main-content h1 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        /* Table */
        .table-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #f8f9fa;
            font-weight: bold;
            color: #2c3e50;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Computer Of Technology</h2>
        <h3>Bookboard</h3>
        <ul>
            <li><a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="#"><i class="fas fa-file-upload"></i> Add Staff</a></li>
            <li><a href="#"><i class="fas fa-chart-line"></i> Reports</a></li>
            <li>
                <a href="javascript:void(0)" onclick="toggleDropdown('categoriesDropdown')">
                    <i class="fas fa-folder"></i> Categories <i class="fas fa-chevron-down"></i>
                </a>
                <div class="dropdown-content" id="categoriesDropdown">
                    <a href="admin_addcategories.jsp"><i class="fas fa-plus"></i> Add Categories</a>
                    <a href="admin_modifycategories.jsp"><i class="fas fa-edit"></i> Modify Categories</a>
                    <a href="admin_deletecategories.jsp"><i class="fas fa-trash"></i> Delete Categories</a>
                </div>
            </li>
            <li>
                <a href="javascript:void(0)" onclick="toggleDropdown('productsDropdown')">
                    <i class="fas fa-box"></i> Products <i class="fas fa-chevron-down"></i>
                </a>
                <div class="dropdown-content" id="productsDropdown">
                    <a href="admin_addproducts.jsp"><i class="fas fa-plus"></i> Add Products</a>
                    <a href="admin_modifyproducts.jsp"><i class="fas fa-edit"></i> Modify Products</a>
                    <a href="admin_deleteproducts.jsp"><i class="fas fa-trash"></i> Delete Products</a>
                </div>
            </li>
            <li><a href="#"><i class="fas fa-clipboard-list"></i> Sample Registration</a></li>
        </ul>
    </div>

    <script>
        function toggleDropdown(id) {
            var dropdown = document.getElementById(id);
            dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
        }
    </script>
</body>
</html>
