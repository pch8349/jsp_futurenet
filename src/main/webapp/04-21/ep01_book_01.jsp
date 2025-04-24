<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 2025-04-21
  Time: 오후 4:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="com.pch.jsp.Book"%>
<%
  Book b1 = new Book();
  b1.setCategory("만화");
  b1.setTitle("열혈강호");
  b1.setAuthor("전극진,양재현");
  b1.setPublisher("대원아이씨");
  b1.setPrice(4500);
%>
<html>
<head>
    <title>Title</title>
  <style>
    table, th, td {
      border: 1px solid black;
    }
  </style>
</head>
<body>

도서 정보
<hr>
<table>
  <tr>
    <th>카테고리</th>
    <th>제목</th>
    <th>작가</th>
    <th>출판사</th>
    <th>가격</th>
  </tr>
  <tr>
    <td><%=b1.getCategory()%></td>
    <td><%=b1.getTitle()%></td>
    <td><%=b1.getAuthor()%></td>
    <td><%=b1.getPublisher()%></td>
    <td><%=b1.getPrice()%></td>
  </tr>
</table>
카테고리:<%=b1.getCategory()%>
<br>
제목:<%=b1.getTitle()%>
<br>
작가:<%=b1.getAuthor()%>
<br>
출판사:<%=b1.getPublisher()%>
<br>
가격:<%=b1.getPrice()%>



</body>
</html>
