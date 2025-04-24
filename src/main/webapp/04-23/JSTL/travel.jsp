<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String[] travels = {"Paris", "London", "Barcelona", "NewYork", "Rome"};
    request.setAttribute("travels", travels);  // JSTL에서 사용할 수 있도록 request에 저장
%>

<table>
    <tr>
        <th>index</th>
        <th>count</th>
        <th>value</th>
    </tr>
    <c:forEach var="travel" items="${travels}" varStatus="status">
        <tr>
            <td>${status.index}</td>
            <td>${status.count}</td>
            <td>${travel}</td>
        </tr>
    </c:forEach>
</table>


</body>
</html>
