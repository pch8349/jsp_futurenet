<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 2025-04-21
  Time: 오후 3:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    private String id;
    private String password;

    public String getId(){
        return id;
    }
    public void setId(String id){
        this.id = id;
    }
    public String getPassword(){
        return password;
    }
    public void setPassword(String password){
        this.password = password;
    }
%>
<%
    setId("icecream");
    setPassword("pw1234");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
Id:<%=getId()%>
<br><br>
Password:<%out.print(getPassword()); %>
</body>
</html>
