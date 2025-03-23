<%-- 
    Document   : abcd
    Created on : 18 Mar 2025, 11:21:28 pm
    Author     : acer
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<ul>
    <% 
        List<String> categoryNames = (List<String>) request.getAttribute("categoryNames");
        if (categoryNames != null) {
            for (String category : categoryNames) { 
    %>
                <li><%= category %></li>
    <% 
            }
        } else { 
    %>
            <li>No categories available</li>
    <% 
        } 
    %>
</ul>
    </body>
</html>
