<%@ page import="com.pch.jsp.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Member[] members = {
            new Member("김봄", 20, 180.0F, 'F', false),
            new Member("김여름", 30, 190.0F, 'M', false),
            new Member("김가을", 40, 200.0F, 'F', true),
    };
%>

<table>
    <tr>
        <th>index</th>
        <th>이름</th>
        <th>나이</th>
        <th>키</th>
        <th>성별</th>
        <th>결혼여부</th>
    </tr>
    <c:forEach var="member" items="<%= members %>" varStatus="status">
        <tr>
            <td>${status.index}</td>
            <td>${member.name}</td>
            <td>${member.age}</td>
            <td>${member.height}</td>
            <td>${member.gender}</td>
            <td>${member.married ? "기혼" : "미혼"}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
