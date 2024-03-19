<%-- 
    Document   : logout
    Created on : Sep 17, 2018, 10:51:09 AM
    Author     : JAVA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
session.invalidate();
response.sendRedirect("index.html");       
%>
    </body>
</html>
