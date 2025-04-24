<%@ page import="com.pch.paintfinder.member.dao.Member" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ include file="include/header.jsp" %>
<%@ page pageEncoding="UTF-8" %>

<%
    String id = request.getParameter("id");
    String pw = request.getParameter("password");

    String idError = "";

    if ("POST".equalsIgnoreCase(request.getMethod()) && id != null && pw != null) {

        Map<String, Member> memberMap = (Map<String, Member>) application.getAttribute("memberMap");

        if (memberMap == null) {
            memberMap = new HashMap<>();
            application.setAttribute("memberMap", memberMap);
        }

        Member m = memberMap.get(id);

        // 조회값이 없으면 사용 가능하므로, 가입 성공
        if(m == null){
            Member member = new Member(id, pw, new ArrayList<>());
            memberMap.put(id, member);
            application.setAttribute("memberMap", memberMap);
            out.println("<script>alert('회원가입 성공'); location.href='login.jsp';</script>");
        } else {
            idError = "이미 사용중인 ID 입니다";
        }

    }
%>

<div class="container mt-5" style="max-width: 400px;">
    <h2 class="text-center mb-4">회원가입</h2>
    <form method="post">
        <div class="mb-3">
            <label for="id" class="form-label">아이디</label>
            <input type="text" class="form-control" id="id" name="id" required>
            <% if (!idError.isEmpty()) { %>
            <small class="text-danger"><%= idError %></small>
            <% } %>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">가입하기</button>
    </form>
</div>

<%@ include file="include/footer.jsp" %>