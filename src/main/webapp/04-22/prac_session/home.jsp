<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="text-align: center">
<%
    String id = "";
    if(session.getAttribute("id") != null){
        id = session.getAttribute("id").toString();
    };

%>
<%
    if(id.equals("")){ %>
<h3>안내</h3>
<hr>
회원 전용 페이지입니다.
<br>
로그인 하시기 바랍니다.
<br />

<a href="loginForm.jsp">[index]</a>
<%} else { %>
    <h2>{Home} | <a href="logout.jsp">로그아웃</a>(<%= id %>님) </h2>
    <hr>
<% } %>


</body>
</html>
