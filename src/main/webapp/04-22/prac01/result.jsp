<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String idSave = request.getParameter("idSave");

    if(idSave != null && idSave.equals("true")){
        Cookie cookie = new Cookie("id", id);
        cookie.setPath(request.getContextPath());  // 경로를 컨텍스트 루트로 설정
        cookie.setMaxAge(3600);  // 유지 기간을 1시간으로 설정
        response.addCookie(cookie);  // 응답 헤더에 쿠키 추가
    } else {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("id".equals(cookie.getName())) {
                    // 쿠키 무효화
                    cookie.setMaxAge(0); // 0초 → 삭제 의미
                    cookie.setPath(request.getContextPath()); // 생성 시와 동일한 path 설정 필요
                    response.addCookie(cookie); // 브라우저에 반영
                    break;
                }
            }
        }
    }
%>

아이디 : <%= id %>
<br>
패스워드 : <%= password %>
<br>
아이디 저장 : <%= idSave %>
<br />
<a href="login.jsp">{ 로그인 }</a>
</body>
</html>
