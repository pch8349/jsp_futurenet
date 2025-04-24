<%@ page import="java.util.Map" %>
<%@ page import="com.pch.jsp.Person" %>
<%@ page import="java.util.HashMap" %><
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>apllication 영역의 공유</h2>
<%
    Map<String, Person> maps = new HashMap<>();
    maps.put("actor1", new Person("이수일", 30));
    maps.put("actor2", new Person("심순애", 28));
    application.setAttribute("maps", maps);
%>
application 영역에 속성이 저장되었습니다.

</body>
</html>
