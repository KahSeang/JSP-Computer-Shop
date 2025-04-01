<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sidebar Design</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            body {
                display: flex;
                background-color: #f8f9fa;
            }

            /* Sidebar */
            .sidebar {
                width: 250px;
                background-color: #2c3e50;
                color: white;
                padding: 20px;
                height: 100vh;
                position: fixed;
                overflow-y: auto;
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
                transition: width 0.3s ease-in-out;
            }

            .sidebar h2 {
                text-align: center;
                font-size: 20px;
                margin-bottom: 20px;
                color: #f39c12;
            }

            .sidebar h3 {
                font-size: 16px;
                margin-bottom: 10px;
                color: #ecf0f1;
            }

            .sidebar ul {
                list-style: none;
                padding: 0;
            }

            .sidebar ul li {
                margin: 10px 0;
            }

            .sidebar ul li a {
                color: white;
                text-decoration: none;
                font-size: 16px;
                display: flex;
                align-items: center;
                padding: 10px 15px;
                border-radius: 5px;
                transition: background 0.3s;
            }

            .sidebar ul li a i {
                margin-right: 10px;
            }

            .sidebar ul li a:hover {
                background: #f39c12;
                color: black;
            }

            /* Dropdown */
            .dropdown-content {
                display: none;
                padding-left: 20px;
                margin-top: 5px;
            }

            .dropdown-content a {
                display: block;
                font-size: 14px;
                padding: 8px;
                border-radius: 5px;
                transition: background 0.3s;
            }

            .dropdown-content a:hover {
                background: #f39c12;
                color: black;
            }

            .toggle-icon {
                margin-left: auto;
                transition: transform 0.3s ease-in-out;
            }

            .rotate {
                transform: rotate(180deg);
            }

            /* Content */
      

            .main-content {
                margin-left: 320px; /* Adjust based on sidebar width */
                padding: 20px;
                width: calc(100% - 250px); /* Make it take remaining width */
                transition: margin-left 0.3s ease-in-out;
            }

            .sidebar.collapsed {
                width: 70px;
            }

            .sidebar.collapsed + .main-content {
                margin-left: 70px;
                width: calc(100% - 70px);
            }


        </style>
    </head>
    <body>

        <!-- Sidebar -->
        <div class="sidebar">
            <h2>Computer Of Technology</h2>
            <h3>Bookboard</h3>
            <ul>
                <li><a href="admin.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="#"><i class="fas fa-user-plus"></i> Add Staff</a></li>
                <li><a href="#"><i class="fas fa-chart-line"></i> Reports</a></li>
                <li>
                    <a href="javascript:void(0)" onclick="toggleDropdown('categoriesDropdown', 'iconCat')">
                        <i class="fas fa-folder"></i> Categories 
                        <i id="iconCat" class="fas fa-chevron-down toggle-icon"></i>
                    </a>
                    <div class="dropdown-content" id="categoriesDropdown">
                        <a href="admin_addcategories.jsp"><i class="fas fa-plus"></i> Add Categories</a>
                        <a href="admin_modifycategories.jsp"><i class="fas fa-edit"></i> Modify Categories</a>
                        <a href="admin_deletecategories.jsp"><i class="fas fa-trash"></i> Delete Categories</a>
                    </div>
                </li>
                <li>
                    <a href="javascript:void(0)" onclick="toggleDropdown('productsDropdown', 'iconProd')">
                        <i class="fas fa-box"></i> Products 
                        <i id="iconProd" class="fas fa-chevron-down toggle-icon"></i>
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
            function toggleDropdown(id, iconId) {
                var dropdown = document.getElementById(id);
                var icon = document.getElementById(iconId);

                if (dropdown.style.display === "block") {
                    dropdown.style.display = "none";
                    icon.classList.remove("rotate");
                } else {
                    dropdown.style.display = "block";
                    icon.classList.add("rotate");
                }
            }
        </script>

    </body>
</html>
