<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background: url('sources/images/login3.avif') no-repeat center center fixed;
                background-size: cover;
            }
            .container {
                display: flex;
                width: 800px;
                height: 500px;
                background: rgba(255, 255, 255, 0.2);
                border-radius: 15px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
                backdrop-filter: blur(10px);
                overflow: hidden;
                border: 1px solid rgba(255, 255, 255, 0.3);
            }
            .image-section {
                flex: 1;
                background: url('sources/images/login4.jpg') no-repeat center center/cover;
            }
            .form-section {
                flex: 1;
                padding: 40px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                text-align: center;
                backdrop-filter: blur(20px);
            }
            h2 {
                color: white;
                margin-bottom: 20px;
            }
            .input-box {
                width: 100%;
                margin-bottom: 15px;
            }
            input {
                width: 100%;
                padding: 12px;
                margin-top: 5px;
                border: none;
                border-radius: 10px;
                background: rgba(255, 255, 255, 0.3);
                color: white;
                outline: none;
                font-size: 16px;
            }
            input::placeholder {
                color: rgba(255, 255, 255, 0.7);
            }
            button {
                width: 100%;
                padding: 12px;
                background: rgba(0, 128, 0, 0.8);
                color: white;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                margin-top: 10px;
                font-size: 16px;
                transition: 0.3s;
            }
            button:hover {
                background: rgba(0, 100, 0, 0.9);
            }

            .error-message {
                color: red;
                text-align: center;
                margin-bottom: 10px;
            }
            .toggle-link a {
                color: white;
                text-decoration: none;
            }
            .toggle-link a:hover {
                text-decoration: underline;
            }

        </style>
    </head>
    <body>

        <div class="container">
            <div class="image-section"></div>
            <div class="form-section">
                <h2>Login</h2>
                <!-- Display error message if login fails -->
                <%
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) {
                %>
                <p class="error-message"><%= errorMessage%></p>
                <% }%>

                <form action="LoginServlet" method="post">
                    <div class="input-box">
                        <input type="text" name="username" placeholder="Username" required>
                    </div>
                    <div class="input-box">
                        <input type="password" name="password" placeholder="Password" required>
                    </div>
                    <button type="submit">Sign In</button>
                    <p class="toggle-link"><a href="register.jsp">Don't have an account? Register</a></p>
                </form>
            </div>
        </div>

    </body>
</html>
