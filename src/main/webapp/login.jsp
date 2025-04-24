<%@ page import="com.pch.paintfinder.member.dao.Member" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ include file="include/header.jsp" %>
<%@ page pageEncoding="UTF-8" %>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    String idError = "";
    String pwError = "";

    // 로그인 버튼이 눌렸을 때만 동작할 수 있도록 조건문 분기 처리
    if ("POST".equalsIgnoreCase(request.getMethod()) && id != null && pw != null) {
        Map<String, Member> memberMap = (Map<String, Member>) application.getAttribute("memberMap");
        if (memberMap == null) {
            memberMap = new HashMap<>();
            application.setAttribute("memberMap", memberMap);
        }

        Member m = memberMap.get(id);

        if(m != null){
            if (m.getPassword().equals(pw)) {
                Cookie userCookie = new Cookie("loginId", id);
                userCookie.setMaxAge(60 * 60);
                userCookie.setPath("/");
                response.addCookie(userCookie);

                response.sendRedirect("home.jsp");
                return;
            } else {
                pwError = "비밀번호가 일치하지 않습니다.";
            }
        } else {
            idError = "일치하는 회원 정보가 없습니다.";
        }
    }
%>

<div class="container mt-5" style="max-width: 400px;">
    <h2 class="text-center mb-4">로그인</h2>
    <form method="post">
        <div class="mb-3">
            <label for="id" class="form-label">아이디</label>
            <input type="text" class="form-control" id="id" name="id" required>
            <% if (!idError.isEmpty()) { %>
            <small class="text-danger"><%= idError %></small>
            <% } %>
        </div>
        <div class="mb-3">
            <label for="pw" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="pw" name="pw" required>
            <% if (!pwError.isEmpty()) { %>
            <small class="text-danger"><%= pwError %></small>
            <% } %>
        </div>

        <div class="row">
            <div class="col-6 pe-1">
                <a href="join.jsp" class="btn btn-outline-secondary w-100">회원가입</a>
            </div>
            <div class="col-6 ps-1">
                <button type="submit" class="btn btn-primary w-100" id="login">로그인</button>
            </div>
        </div>
    </form>
</div>

<%@ include file="include/footer.jsp" %>