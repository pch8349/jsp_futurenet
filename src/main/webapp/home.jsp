<%@ page import="com.pch.paintfinder.paint.dao.Paint" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ include file="include/header.jsp" %>
<%@ include file="include/navbar.jsp"%>
<%@ page pageEncoding="UTF-8" %>

<%
    Map<Integer, Paint> paintMap = (Map<Integer, Paint>) application.getAttribute("paintMap");
%>

<div class="container mt-5 text-center">

    <hr>
    <h3 class="mb-4">
        <a href="paint.jsp" class="text-decoration-none text-dark">오늘의 물감</a>
    </h3>

    <div class="row justify-content-center">
        <%
            if (paintMap != null) {
                List<Paint> paintList = new ArrayList<>(paintMap.values());
                Collections.shuffle(paintList); // 리스트 섞기

                int count = Math.min(4, paintList.size()); // 최대 4개까지
                for (int i = 0; i < count; i++) {
                    Paint paint = paintList.get(i);
                    String imgPath = paint.getImg();
        %>
        <div class="col-md-3 mb-4">
            <img src="<%= imgPath %>" alt="paint image" class="img-fluid" style="max-width: 100%;">
        </div>
        <%
            }
        } else {
        %>
        <p>등록된 물감 정보가 없습니다.</p>
        <%
            }
        %>
    </div>
</div>

<%@ include file="include/footer.jsp" %>