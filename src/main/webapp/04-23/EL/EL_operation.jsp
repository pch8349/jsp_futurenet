<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
1 + 1 = ${1 + 1} <br>
2 - 2 = ${2 - 2} <br>
3 * 2 = ${3 * 2} <br>
10 / 3 = ${10 / 3} <br>

10 % 3 = ${10 % 3}<br>

크다 : ${3 > 2} or ${3 gt 2} <br>

크거나 같다 : ${3 >= 2}<br>

작다 : ${3 < 2}<br>

작거나 같다 : ${3<=2}<br>

같다 : ${3 == 2}<br>

같지 않다 : ${3 != 2}<br>
<c:set var="변수명" value="값" />
</body>
</html>
