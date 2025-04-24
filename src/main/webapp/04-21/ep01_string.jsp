<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 2025-04-21
  Time: 오후 3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    String[] names = {"kim", "lee", "song"};
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    for(int i = 0; i<names.length; i++){
        out.print(names[i] + "&nbsp;");
    }
%>
<br>

<%
    for(int i = 0; i<names.length; i++){
%>
        <%=names[i]%> 하이
<%
    }
%>

<table>
    <tr>
        <th>번호</th>
        <th>값</th>
    </tr>
    <% for (int i = 0; i<names.length; i++){%>
        <tr>
            <td>i=[<%=i%>]</td>
            <td><%=names[i]%></td>
        </tr>
    <%}%>
</table>

</body>
</html>
