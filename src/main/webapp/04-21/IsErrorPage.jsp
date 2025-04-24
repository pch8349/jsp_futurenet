<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 2025-04-21
  Time: 오후 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>서비스 오류</h2>
<p>
  오류명 :
  <%=exception.getClass().getName()%>
  <br/>
  <%=exception.getMessage()%>
</p>

</body>
</html>
