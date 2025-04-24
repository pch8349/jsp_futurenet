<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>PaintFinder</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형 핵심 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%
  String loginId = null;

  // 로그아웃 요청이 들어온 경우
  if ("true".equals(request.getParameter("logout"))) {
    Cookie logoutCookie = new Cookie("loginId", null);
    logoutCookie.setMaxAge(0);
    logoutCookie.setPath("/");
    response.addCookie(logoutCookie);
    response.sendRedirect("../login.jsp");
    return;
  }

  Cookie[] cookies = request.getCookies();
  if (cookies != null) {
    for (Cookie c : cookies) {
      if ("loginId".equals(c.getName())) {
        loginId = c.getValue();
        break;
      }
    }
  }
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.jsp">PaintFinder</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
            aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
        <% if (loginId != null) { %>
        <li class="nav-item d-flex align-items-center me-3">
          <span class="navbar-text fw-semibold text-primary">
            👤 <%= loginId %> 님
          </span>
        </li>
        <% } %>
        <li class="nav-item">
          <a class="nav-link" href="home.jsp">메인</a>
        </li>
        <% if (loginId != null) { %>
        <li class="nav-item">
          <a class="nav-link" href="include/header.jsp?logout=true">로그아웃</a>
        </li>
        <% } else { %>
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">로그인</a>
        </li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>

