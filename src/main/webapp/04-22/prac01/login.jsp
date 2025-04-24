<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    String id = "";
    if(cookies != null){
        for(Cookie c : cookies){
            if(c.getName().equals("id")){
                id = c.getValue();
            }
        }
    }
%>
<form action="result.jsp" method="post">
    아이디 : <input type="text" maxlength="20" name="id" value="<%= id  %>" required> <br>
    패스워드 : <input type="password" maxlength="20" name="password" required><br>
    <input type="checkbox" name="idSave" value="true">&nbsp;아이디 저장<br>
    <input type="submit" value="로그인">
    <input type="reset" value="취소">
</form>
</body>
</html>