<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Error Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                margin: 50px;
                background-color: #f8d7da;
            }
            .error-container {
                background: white;
                padding: 20px;
                border-radius: 10px;
                display: inline-block;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                color: #721c24;
            }
            p {
                color: #721c24;
            }
            a {
                display: inline-block;
                margin-top: 15px;
                padding: 10px 15px;
                background-color: #dc3545;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }
            a:hover {
                background-color: #c82333;
            }
        </style>
    </head>
    <body>
        <div class="error-container">
            <h1>Oops! Something went wrong.</h1>
            <p>${errorMessage}</p>
            <a href="index.jsp">Go Back Home</a>
        </div>
    </body>
</html>
