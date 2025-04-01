<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
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
                background: url('sources/images/login2.jpg') no-repeat center center fixed;
            }
            .container {
                display: flex;
                width: 800px;
                height: 500px;
                border-radius: 15px;
                overflow: hidden;
                backdrop-filter: blur(10px);
                background: rgba(255, 255, 255, 0.15);
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
                border: 1px solid rgba(255, 255, 255, 0.2);
            }
            .image-section {
                flex: 1;
                background: url('sources/images/login.jpg') no-repeat center center/cover;
            }
            .form-section {
                flex: 1;
                padding: 40px;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }
            h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #fff;
                text-shadow: 1px 1px 10px rgba(0, 0, 0, 0.5);
            }
            .input-box {
                margin-bottom: 15px;
            }
            label {
                color: white;
                font-weight: bold;
            }
            input {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid rgba(255, 255, 255, 0.2);
                border-radius: 8px;
                background: rgba(255, 255, 255, 0.2);
                color: white;
                outline: none;
                transition: 0.3s ease-in-out;
            }
            input::placeholder {
                color: rgba(255, 255, 255, 0.7);
            }
            input:focus {
                background: rgba(255, 255, 255, 0.3);
                border-color: rgba(255, 255, 255, 0.4);
            }
            button {
                width: 100%;
                padding: 12px;
                background: rgba(0, 123, 255, 0.7);
                color: white;
                font-weight: bold;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                transition: 0.3s ease-in-out;
            }
            button:hover {
                background: rgba(0, 123, 255, 1);
            }
            .toggle-link {
                text-align: center;
                margin-top: 10px;
            }
            .toggle-link a {
                color: #90ee90;
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
                <h2>Register Admin</h2>
                <form action="RegisterAdminServlet" method="post">
                    <div class="input-box">
                        <label>Username</label>
                        <input type="text" name="username" placeholder="Enter your username" required>
                    </div>
                    <div class="input-box">
                        <label>Email</label>
                        <input type="email" name="email" placeholder="Enter your email" required>
                    </div>
                    <div class="input-box">
                        <label>Password</label>
                        <input type="password" name="password" placeholder="Enter your password" required>
                    </div>
                    <div class="input-box">
                        <label>Confirm Password</label>
                        <input type="password" name="confirm_password" placeholder="Re-enter your password" required>
                    </div>
                    <button type="submit">Sign Up</button>
                    <p class="toggle-link"><a href="login.jsp">Already have an account? Login</a></p>
                </form>
            </div>
        </div>

    </body>
</html>
