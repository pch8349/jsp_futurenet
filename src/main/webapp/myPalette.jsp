<%@ page import="com.pch.paintfinder.palette.dao.Palette" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ include file="include/header.jsp" %>
<%@ include file="include/navbar.jsp"%>
<%@ page pageEncoding="UTF-8" %>

<%
    // 1. paletteMap 가져오기 또는 초기화
    Map<Integer, Palette> paletteMap = (Map<Integer, Palette>) application.getAttribute("paletteMap");
    if (paletteMap == null) {
        paletteMap = new LinkedHashMap<>();
    }

    // 3. 내 팔레트만 필터링
    Map<Integer, Palette> myPaletteMap = new LinkedHashMap<>();
    if (loginId != null) {
        for (Map.Entry<Integer, Palette> entry : paletteMap.entrySet()) {
            Palette palette = entry.getValue();
            if (loginId.equals(palette.getMemberId())) {
                myPaletteMap.put(entry.getKey(), palette);
            }
        }
    }
%>

<%
    String action = request.getParameter("action");
    int newPaletteId = -1;


    // +추가하기 버튼 로직
    if ("add".equals(action)) {

        // 2. paletteMap 가장 큰 id 찾기
        int maxId = 0;
        if (!paletteMap.isEmpty()) {
            maxId = Collections.max(paletteMap.keySet());
        }
        newPaletteId = maxId + 1;

        // 3. 새로운 Palette 객체 생성
        Palette newPalette = new Palette(newPaletteId, loginId);

        // 4. paletteMap에 추가 및 저장
        paletteMap.put(newPaletteId, newPalette);
        myPaletteMap.put(newPaletteId, newPalette);
        application.setAttribute("paletteMap", paletteMap);

        response.sendRedirect("myPalette.jsp");
    }


%>

<div class="row justify-content-center mx-3 mx-md-5">

    <!-- 버튼 영역: 오른쪽 정렬된 col -->
    <div class="col-12 d-flex justify-content-end mb-3">
        <form method="get" action="myPalette.jsp">
            <input type="hidden" name="action" value="add">
            <button type="submit" class="btn btn-primary">+ 추가하기</button>
        </form>
    </div>

    <%
        if ( myPaletteMap != null && ! myPaletteMap.isEmpty()) {
            for (Palette palette :  myPaletteMap.values()) {
    %>
    <div class="col-md-3 mb-4">
        <div class="card shadow-sm h-100 bg-light" style="height: 100%;">
            <div style="height: 400px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                <a href="myPaletteDetail.jsp?id=<%= palette.getId() %>">
                    <img src="<%= palette.getImgUrl() != null ? palette.getImgUrl() : "assets/placeholder.png" %>"
                         class="card-img-top"
                         alt="palette image"
                         style="max-width: 100%; max-height: 100%; object-fit: contain;">
                </a>
            </div>
            <div class="card-body text-muted">
                <h5 class="card-title"><%= palette.getName() != null ? palette.getName() : "새 팔레트" %></h5>
                <p class="card-text mb-1">ID: <%= palette.getId() %></p>
                <p class="card-text text-secondary small">물감 수: <%= palette.getPaints() != null ? palette.getPaints().size() : 0 %></p>
            </div>
        </div>
    </div>

    <%
        }
    } else {
    %>
    <p class="text-muted">아직 생성된 팔레트가 없습니다.</p>
    <%
        }
    %>
</div>

<%@ include file="include/footer.jsp" %>