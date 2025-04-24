<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
Servlet Life Cycle
<hr width="80%">
<form action="<%= request.getContextPath() %>/LifeCycle.do" method="get">
  <input type="submit" value="Get 방식">
</form>
<br>
<form action="<%= request.getContextPath() %>/LifeCycle.do" method="post">
  <input type="submit" value="Post 방식">
</form>
</body>
</html>