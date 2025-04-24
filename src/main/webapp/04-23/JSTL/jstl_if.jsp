<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- 변수 선언 --%>
<c:set var="color" value="black" />
<c:set var="score" value="20"/>

<%-- if --%>
<c:if test = "${color eq 'black'}" var="result1">
    ${color}
</c:if>
| result1 = ${result1}
<br>

<%-- ne : 같지 않다. --%>
<c:if test="${score ne 10}" var="result3">
    ${score} 는 10이 아님
</c:if>
| result 3 = ${result3}
<br>

<%-- != : 같지 않다 --%>
<c:if test="${color != null}" var="result2">
    ${color}는 not null
</c:if>
| result2 = ${result2}

<%-- >= : 크거나 같다. --%>
<c:if test="${score >= 10}" var="result4">
    ${score}는 10 보다 크다
</c:if>
| result4 - ${result4}

</body>
</html>
