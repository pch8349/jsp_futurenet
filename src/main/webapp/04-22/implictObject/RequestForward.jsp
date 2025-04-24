<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 2025-04-22
  Time: 오전 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pch.jsp.Person" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>포워드로 전달된 페이지</h2>
<h4>RequestMain 파일의 리퀘스트 영역 속성 읽기</h4>
<%
    Person pPerson = (Person)(request.getAttribute("requestPerson"));
%>
<ul>
    <li>String 객체 : <%= request.getAttribute("requestString") %></li>
    <li>Person 객체 : <%= pPerson.getName() %></li>
</ul>
<h4>매개변수로 전달된 값 출력하기</h4>
<%
    request.setCharacterEncoding("UTF-8");
    out.println(request.getParameter("paramHan"));
    out.println(request.getParameter("paramEng"));
%>
</body>
</html>
