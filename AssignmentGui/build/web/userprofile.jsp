<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entity.User" %>
<% User user = (User) session.getAttribute("user");
    String message = (String) session.getAttribute("message");
    String error = (String) session.getAttribute("error");
    session.removeAttribute("message"); // 清除消息，防止刷新后重复显示
    session.removeAttribute("error");%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Profile</title>
        <style>
            body {
                font-family: 'Poppins', sans-serif;
            }
            :root {
                --primary: #4a3c6d;
                --secondary: #8b7ba5;
                --accent: #c8b8db;
                --light: #f9f8fa;
                --dark: #2a2438;
                --text: #4a4a4a;
                --gold: #d4af37;
            }

            .profile-container {
                width: 1000px;
                background: white;
                border-radius: 16px;
                overflow: hidden;
                box-shadow: 0 25px 50px rgba(0, 0, 0, 0.08);
                position: relative;
                margin: 20px auto;
                display: flex;
            }

            .profile-header {
                background: linear-gradient(135deg, var(--primary), var(--dark));
                padding: 40px;
                color: white;
                text-align: center;
                position: relative;
                width: 300px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                font-family: 'Poppins', sans-serif;
            }

            .profile-avatar {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                background: var(--accent);
                margin: 0 auto 20px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 36px;
                font-weight: 600;
                color: white;
                border: 3px solid var(--gold);
                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
            }

            .profile-name {
                font-family: 'Poppins', sans-serif;
                font-size: 28px;
                font-weight: 600;
                margin-bottom: 5px;
                letter-spacing: 0.5px;
            }

            .profile-location {
                font-size: 14px;
                opacity: 0.9;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 5px;
            }

            .profile-location::before {
                content: "📍";
                margin-right: 5px;
            }

            .profile-content {
                padding: 40px;
                position: relative;
                flex: 1;
            }

            .content-header {
                margin-bottom: 30px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid rgba(0, 0, 0, 0.05);
                padding-bottom: 15px;
            }

            .content-title {
                font-family: 'Poppins', sans-serif;
                font-size: 22px;
                font-weight: 600;
                color: var(--primary);
                margin: 0;
                position: relative;
            }

            .content-title::after {
                content: "";
                position: absolute;
                bottom: -16px;
                left: 0;
                width: 50px;
                height: 3px;
                background: var(--gold);
            }

            .last-updated {
                font-size: 12px;
                color: #999;
                display: flex;
                align-items: center;
                gap: 5px;
            }

            .last-updated::before {
                content: "🕒";
                margin-right: 5px;
            }

            .form-group {
                margin-bottom: 25px;
            }

            .form-row {
                display: flex;
                gap: 25px;
                margin-bottom: 20px;
            }

            .form-col {
                flex: 1;
                position: relative;
            }

            label {
                display: block;
                margin-bottom: 8px;
                font-size: 12px;
                font-weight: 500;
                color: var(--primary);
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .input-wrapper {
                position: relative;
            }

            .input-wrapper::before {
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                font-size: 14px;
                color: var(--secondary);
            }

            .input-wrapper[data-icon="userid"]::before {
                content: "🆔";
            }
            .input-wrapper[data-icon="name"]::before {
                content: "👤";
            }
            .input-wrapper[data-icon="email"]::before {
                content: "✉";
            }
            .input-wrapper[data-icon="address"]::before {
                content: "🏠";
            }
            .input-wrapper[data-icon="state"]::before {
                content: "🗺";
            }
            .input-wrapper[data-icon="city"]::before {
                content: "🏙";
            }
            .input-wrapper[data-icon="postcode"]::before {
                content: "📮";
            }
            .input-wrapper[data-icon="phone"]::before {
                content: "📞";
            }

            input[type="text"],
            input[type="email"],
            input[type="tel"],
            input[type="text"][readonly],
            select {
                width: 100%;
                padding: 14px 15px 14px 40px;
                border: 1px solid #e0e0e0;
                border-radius: 8px;
                font-size: 14px;
                transition: all 0.3s;
                background-color: #fafafa;
                color: var(--dark);
                appearance: none;
            }

            input[type="text"][readonly] {
                background-color: #f0f0f0;
                color: #666;
                cursor: not-allowed;
            }

            select {
                background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%238b7ba5' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
                background-repeat: no-repeat;
                background-position: right 10px center;
                background-size: 15px;
            }

            input[type="text"]:focus,
            input[type="email"]:focus,
            input[type="tel"]:focus,
            select:focus {
                border-color: var(--secondary);
                background-color: white;
                box-shadow: 0 5px 15px rgba(141, 153, 187, 0.15);
                outline: none;
                padding-left: 45px;
            }

            .save-btn {
                background: linear-gradient(to right, var(--primary), var(--secondary));
                color: white;
                border: none;
                padding: 14px 30px;
                border-radius: 8px;
                cursor: pointer;
                font-size: 14px;
                font-weight: 500;
                text-transform: uppercase;
                letter-spacing: 1px;
                margin-top: 20px;
                transition: all 0.3s;
                box-shadow: 0 4px 15px rgba(93, 78, 109, 0.3);
                width: 100%;
                position: relative;
                overflow: hidden;
            }

            .save-btn::after {
                content: "→";
                position: absolute;
                right: 20px;
                top: 50%;
                transform: translateY(-50%);
                transition: all 0.3s;
            }

            .save-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(93, 78, 109, 0.4);
            }

            .save-btn:hover::after {
                right: 15px;
            }

            .form-note {
                font-size: 11px;
                color: #999;
                margin-top: 5px;
                font-style: italic;
                display: flex;
                align-items: center;
                gap: 5px;
            }

            .form-note::before {
                content: "🔒";
                margin-right: 5px;
            }
            #addressbutton{

                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
                transition: 0.3s ease;
            }
        </style>
    </head>
    <body>

        <% if (request.getAttribute("message") != null) {%>
        <script>
            alert("<%= request.getAttribute("message")%>");
        </script>
        <% } %>

        <% if (request.getAttribute("error") != null) {%>
        <script>
            alert("<%= request.getAttribute("error")%>");
        </script>
        <% } %>



        <jsp:include page="header.jsp" />
        <%
            HttpSession userSession = request.getSession(false);
            Object user2 = (userSession != null) ? userSession.getAttribute("user") : null;
            boolean isLoggedIn = (userSession != null && userSession.getAttribute("user") != null);
        %>
        <div class="profile-container" style="margin-top: 50px">
            <div class="profile-header">
                <div class="profile-avatar">ST</div>
                <div class="profile-name"><%= user.getUsername()%></div>
                <div class="profile-location">Johor, Malaysia</div>
            </div>

            <div class="profile-content">
                <div class="content-header">
                    <h1 class="content-title">Personal Information</h1>
                </div>

                <form action="UserUpdateServlet" method="post" id="profileForm">
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="userid">User ID</label>
                                <div class="input-wrapper" data-icon="userid">
                                    <input type="text" id="userid" name="userid" value="<%= user.getId()%>" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="name">Username</label>
                                <div class="input-wrapper" data-icon="name">
                                    <input type="text" id="name" name="name" value="<%= user.getUsername()%>" required>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <div class="input-wrapper" data-icon="phone">
                                    <input type="tel" id="phone" name="phone" value="<%= user.getPhone()%>" >
                                </div>
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <div class="input-wrapper" data-icon="email">
                                    <input type="email" id="email" name="email" value="<%= user.getEmail()%>" required>
                                </div>
                            </div>
                        </div>
                    </div>

                    <input type="submit" class="save-btn" value="Save Changes">
                </form>
            </div>
        </div>

    
    </body>
</html>
