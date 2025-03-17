<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>E-Commerce Header</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            }

            body {
            }

            /* Top Category Bar */
            .category-bar {
                background: #ffffff;
                padding: 10px 0;
                display: flex;
                justify-content: center;
                gap: 20px;
                border-bottom: 1px solid #ddd;
                z-index: -1;
            }

            .category-bar a {
                text-decoration: none;
                color: #333;
                font-size: 16px;
                font-weight: 500;
                transition: 0.3s;
            }

            .category-bar a:hover {
                color: #007aff;
            }

            /* Header Styles */
            .header {
                background: white;
                padding: 15px 40px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                position: sticky;
                top: 0;
                width: 100%;
                z-index: 99;
            }

            .logo {
                font-size: 24px;
                font-weight: bold;
                color: #333;
            }

            .search-bar {
                flex: 1;
                margin: 0 20px;
                display: flex;
                align-items: center;
                border: 1px solid #ddd;
                border-radius: 25px;
                padding: 3px 15px;
                background: #fff;
            }

            .search-bar input {
                border: none;
                outline: none;
                width: 100%;
                font-size: 12px;
                background: transparent;
            }

            .search-bar button {
                background: transparent;
                border: none;
                cursor: pointer;
                font-size: 16px;
                color: #555;
            }

            .icons {
                display: flex;
                gap: 15px;
                font-size: 20px;
                cursor: pointer;
                color: #333;
            }
        </style>
    </head>
    <body>

        <header class="header">
            <div class="logo">COT</div>
            <nav class="category-bar">
                <a href="#">Home</a>
                <a href="#">Electronics</a>
                <a href="#">Clothing</a>
                <a href="#">Accessories</a>
                <a href="#">Deals</a>
                <a href="#">New Arrivals</a>
                <a href="#">More</a>
                <a href="#">More</a><a href="#">More</a><a href="#">More</a><a href="#">More</a><a href="#">More</a><a href="#">More</a><a href="#">More</a>

                <div class="search-bar">
                    <input type="text" placeholder="Search products...">
                    <button>&#128269;</button>
                </div>
            </nav>
        </header>

    </body>
</html>
