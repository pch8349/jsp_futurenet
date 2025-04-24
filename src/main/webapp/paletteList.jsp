<%@ page import="com.pch.paintfinder.palette.dao.Palette" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ include file="include/header.jsp" %>
<%@ include file="include/navbar.jsp"%>
<%@ page pageEncoding="UTF-8" %>

<style>
    .nav-tabs .nav-link {
        color: black; /* 비활성 탭도 검정색 */
    }
    .nav-tabs .nav-link.active {
        font-weight: bold;
        border-color: black black transparent;
        color: black; /* 활성 탭도 검정색 */
    }
</style>

<%
    Map<Integer, Palette> paletteMap = (Map<Integer, Palette>) application.getAttribute("paletteMap");
    if (paletteMap == null) {
        paletteMap = new LinkedHashMap<>();
    }


    String tab = request.getParameter("tab");
    if (tab == null) tab = "all";
%>

<div class="row justify-content-center mx-3 mx-md-5">
    <ul class="nav nav-tabs justify-content-center mb-4">
        <li class="nav-item">
            <a class="nav-link <%= "all".equals(tab) ? "active" : "" %>" href="paletteList.jsp?tab=all">
                전체 팔레트 조회
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link <%= "liked".equals(tab) ? "active" : "" %>" href="paletteList.jsp?tab=liked">
                좋아요한 팔레트 조회
            </a>
        </li>
    </ul>

    <%
        if ( paletteMap != null && ! paletteMap.isEmpty()) {
            for (Palette palette :  paletteMap.values()) {
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