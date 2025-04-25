<%@ page import="com.pch.paintfinder.paint.dao.Paint" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.pch.paintfinder.palette.dao.Palette" %>
<%@ include file="include/header.jsp" %>
<%@ include file="include/navbar.jsp"%>
<%@ page pageEncoding="UTF-8" %>

<%
    Map<Integer, Paint> paintMap = (Map<Integer, Paint>) application.getAttribute("paintMap");
    Map<Integer, Palette> paletteMap = (Map<Integer, Palette>) application.getAttribute("paletteMap");
%>

<div class="container mt-5 text-center">

    <!-- ✅ 오늘의 팔레트 -->
    <h3 class="mb-4">
        <a href="paletteList.jsp" class="text-decoration-none text-dark">오늘의 팔레트</a>
    </h3>
    <div class="row justify-content-center">
        <%
            if (paletteMap != null) {
                List<Palette> palettesWithImg = new ArrayList<>();
                for (Palette p : paletteMap.values()) {
                    if (p.getImgUrl() != null && !p.getImgUrl().isEmpty()) {
                        palettesWithImg.add(p);
                    }
                }

                Collections.shuffle(palettesWithImg);
                int count = Math.min(4, palettesWithImg.size());

                for (int i = 0; i < count; i++) {
                    Palette palette = palettesWithImg.get(i);
        %>
        <div class="col-md-3 mb-4">
            <a href="myPaletteDetail.jsp?id=<%= palette.getId() %>">
                <img src="<%= palette.getImgUrl() %>" alt="palette image" class="img-fluid" style="max-width: 100%;">
            </a>
        </div>
        <%
            }
        } else {
        %>
        <p>등록된 팔레트가 없습니다.</p>
        <%
            }
        %>
    </div>

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