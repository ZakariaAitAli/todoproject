<%--
  Created by IntelliJ IDEA.
  User: Pro
  Date: 04/04/2023
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="beans.Uticonnexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="beans.Handler" %>
<%@ page import="beans.LowPriorityHandler" %>
<%@ page import="beans.*" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>My dashbord</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

</head>
<body>

<h1>aaaa</h1>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<String[]> all_tasks = (ArrayList) request.getAttribute("all_tasks"); %>
<html>
<head>
    <title>Title</title>
    <% for (String[] task:all_tasks) {%>
    <h1>id <%=task[0]%></h1>
    <h1>titre <%=task[1]%></h1>
    <h1>clor <%=task[2]%></h1>
    <%}%>
</head>

</body>
</html>
