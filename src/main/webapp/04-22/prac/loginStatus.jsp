<%@ page import="com.pch.jsp.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% List<User> users = (List<User>)application.getAttribute("users"); %>
<%= users.size()%>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>순번</th>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>로그인 일시</th>
    </tr>
    <%
        int i = 1;
        if (users != null) {
            for (User u : users) {
    %>
    <tr>
        <td><%= i++ %></td>
        <td><%= u.getId() %></td>
        <td><%= u.getPassword() %></td>
        <td><%= u.getDate() %></td>
    </tr>
    <%
            }
        }
    %>
</table>
<a href="home.jsp">{홈}</a>
</body>
</html>
