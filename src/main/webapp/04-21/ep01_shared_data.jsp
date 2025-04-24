<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 2025-04-21
  Time: 오후 3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    private int totalCnt = 0;

    public int getTotalCnt() {
        return totalCnt;
    }

    public void plusTotalCnt() {
        totalCnt = totalCnt + 1;
    }
%>
<%
    int cnt = 0;
    cnt = cnt + 1;

    plusTotalCnt();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
totalCnt=<%= getTotalCnt()%>
<br>
cnt=<%=cnt%>
</body>
</html>
