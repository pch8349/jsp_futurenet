<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 2025-04-21
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pch.jsp.Coffee"%>

<%
  Coffee c1 = new Coffee("아메리카노", 1500, "콜롬비아 수프리모");
  Coffee c2 = new Coffee("라떼", 2000, "에티오피아 예거체프");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  out.print(c1.getName()+","+c1.getPrice()+","+c1.getBean());
%>
<br>
<br>
<%=c2.getName()%>
<%=c2.getPrice()%>
<%=c2.getBean()%>
</body>
</html>
