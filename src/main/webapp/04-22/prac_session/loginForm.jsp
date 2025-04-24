<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="text-align: center">
<h2><a href="index.jsp">index</a> | {로그인}</h2>
<hr>
<form action="loginResult.jsp" method="post">
    아이디 : <input type="text" maxlength="20" name="id" required> <br>
    패스워드 : <input type="password" maxlength="20" name="password" required><br>
    <input type="submit" value="로그인">
    <input type="reset" value="취소">
</form>
</body>
</html>
