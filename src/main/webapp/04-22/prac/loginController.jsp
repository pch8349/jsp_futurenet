<%@ page import="com.pch.jsp.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    User user = new User(request.getParameter("id"), request.getParameter("pwd"));
    List<User> users = new ArrayList<>();
    if(application.getAttribute("users") != null) {
        List<User> before = (List<User>) application.getAttribute("users");

        for (User u : before) {
            users.add(u);
        }
    }
    users.add(user);
    application.removeAttribute("users");
    application.setAttribute("users", users);

    response.sendRedirect("loginStatus.jsp");
%>

</body>
</html>
