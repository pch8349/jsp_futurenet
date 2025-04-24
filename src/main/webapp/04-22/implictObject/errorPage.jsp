<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 2025-04-22
  Time: 오전 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="text-align: center">
<%
    int status = response.getStatus();
%>
ERROR : <%= status %>
<br>
관리자에게 문의하셈
</body>
</html>
