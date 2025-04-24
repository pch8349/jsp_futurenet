<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 2025-04-22
  Time: 오전 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String sex = request.getParameter("sex");
    String[] favo = request.getParameterValues("favo");
    String favoStr = "";
    if(favo != null){
        for(int i = 0; i<favo.length; i++){
            favoStr += favo[i] + " ";
        }
    }
    String intro = request.getParameter("intro").replace("\r\n", "<br/>");
%>
<ul>
    <li>아이디 : <%= id %></li>
    <li>성별 : <%= sex %></li>
    <li>관심사항 : <%= favoStr %></li>
    <li>자기소개 : <%= intro %></li>
</ul>
</body>
</html>
