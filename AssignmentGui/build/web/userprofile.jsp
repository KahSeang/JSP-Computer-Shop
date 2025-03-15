<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - E-Commerce</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            height: 100vh;
            background: #f5f5f5;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background: #007aff;
            color: white;
            padding: 20px;
            height: 100vh;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar ul li {
            padding: 10px;
            cursor: pointer;
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
        }

        .sidebar ul li:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 20px;
        }

        .profile-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
        }

        .profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 20px;
        }

        .user-info {
            flex: 1;
        }

        .user-info h2 {
            margin-bottom: 5px;
        }

        .order-history, .wishlist {
            background: white;
            padding: 20px;
            margin-top: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .order-history h3, .wishlist h3 {
            margin-bottom: 15px;
        }

        .order-item, .wishlist-item {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
    </style>
        <jsp:include page="header.jsp" />

</head>
<body>
    <div class="sidebar">
        <h2>User Menu</h2>
        <ul>
            <li>Profile</li>
            <li>Order History</li>
            <li>Wishlist</li>
            <li>Settings</li>
            <li>Logout</li>
        </ul>
    </div>

    <div class="main-content">
        <div class="profile-card">
            <img class="profile-pic" src="https://via.placeholder.com/100" alt="Profile Picture">
            <div class="user-info">
                <h2>John Doe</h2>
                <p>Email: johndoe@email.com</p>
                <p>Phone: +1 234 567 890</p>
            </div>
        </div>

        <div class="order-history">
            <h3>Order History</h3>
            <div class="order-item">Order #12345 - Status: Delivered</div>
            <div class="order-item">Order #12346 - Status: Pending</div>
        </div>

        <div class="wishlist">
            <h3>Wishlist</h3>
            <div class="wishlist-item">iPhone 15 Pro</div>
            <div class="wishlist-item">MacBook Air M3</div>
        </div>
    </div>
</body>

</html>
