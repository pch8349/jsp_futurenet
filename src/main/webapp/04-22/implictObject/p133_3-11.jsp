<%@ page import="java.util.Map" %>
<%@ page import="com.pch.jsp.Person" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>application 영역의 속성 읽기</h2>
<%
    Map<String, Person> maps = (Map<String, Person>)application.getAttribute("maps");
    Set<String> keys = maps.keySet();
    for(String key : keys){
        Person person = maps.get(key);
        out.print(String.format("이름 : %s, 나이 : %d<br />", person.getName(), person.getAge()));
    }
%>
</body>
</html>
