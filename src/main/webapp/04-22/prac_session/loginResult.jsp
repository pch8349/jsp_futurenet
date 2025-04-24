<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    out.println(id + " "+ password);
    session.setAttribute("id", id);
    session.setAttribute("password", password);

    response.sendRedirect("home.jsp");
%>

</body>
</html>
