<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 2025-04-21
  Time: 오후 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    try {
        int myAge = Integer.parseInt(request.getParameter("age")) + 10;
        out.println("10년후 당신의 나이는 " + myAge + "입니다.");
    } catch (Exception e){
        out.println("에외 발생 : 매개변수 age 가 null 입니다.");
    }
%>
</body>
</html>
