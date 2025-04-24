<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 2025-04-21
  Time: 오후 5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="com.pch.jsp.Movie"%>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Title</title>
  <style>
    body {
      text-align: center;
      justify-content: center;
    }

    table {
      width: 500px;
      text-align: center;
      justify-content: center;
      border-collapse: collapse;
    }
    th, td {
      border: 1px solid black;
      padding: 0 0 0 0;
    }
  </style>
</head>
<body>

<%
  ArrayList<Movie> movieList = new ArrayList<>();

  Movie m1 = new Movie("탑건:매버릭","액션","조셉 코신스키",110);
  Movie m2 = new Movie("아바타 물의길","SF","제임스 카메론", 192);
  Movie m3 = new Movie("소울","드라마","피트 닥터",107);

  movieList.add(m1);
  movieList.add(m2);
  movieList.add(m3);
%>

<h2>영화 정보</h2>
<hr>
<table>
  <tr>
    <th>제목</th>
    <th>카테고리</th>
    <th>감독</th>
    <th>상영시간</th>
  </tr>
  <%
    for(Movie m : movieList){ %>
      <tr>
        <td><%= m.getTitle()%></td>
        <td><%= m.getCate()%></td>
        <td><%= m.getAuthor()%></td>
        <td><%= m.getRuntime()%></td>
      </tr>
    <% } %>
</table>

</body>
</html>
