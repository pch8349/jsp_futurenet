<%@ page import="com.pch.paintfinder.palette.dao.Palette" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.pch.paintfinder.paint.dao.Paint" %>
<%@ page import="java.util.List" %>
<%@ include file="include/header.jsp" %>
<%@ include file="include/navbar.jsp"%>
<%@ page pageEncoding="UTF-8" %>

<%
    String idParam = request.getParameter("id");
    int paletteId = idParam != null ? Integer.parseInt(idParam) : -1;

    Map<Integer, Palette> paletteMap = (Map<Integer, Palette>) application.getAttribute("paletteMap");
    Palette palette = (paletteMap != null && paletteMap.containsKey(paletteId)) ? paletteMap.get(paletteId) : null;
%>

<% if (palette != null) { %>

<div class="container mt-4 text-center">

    <!-- 🛠 수정 버튼 (오른쪽 정렬) -->
    <% if (loginId != null && palette.getMemberId() != null && loginId.equals(palette.getMemberId())) { %>
    <div class="d-flex justify-content-end mb-2" style="margin: 0 auto;">
        <form method="get" action="myPaletteEdit.jsp">
            <input type="hidden" name="id" value="<%= palette.getId() %>">
            <input type="hidden" name="action" value="edit">
            <button type="submit" class="btn btn-outline-secondary btn-sm">✏ 수정</button>
        </form>
    </div>
    <% } %>

    <div class="d-flex justify-content-center mb-4">
        <div style="width: 600px;">

            <!-- 🎨 제목 (이미지 위) -->
            <h4 class="text-center mb-3">
                <%= palette.getName() != null ? palette.getName() : "-" %>
            </h4>

            <!-- 🖼 이미지 영역 -->
            <div style="width: 600px; height: 600px; display: flex; align-items: center; justify-content: center; overflow: hidden; background-color: #f8f9fa;">
                <img src="<%= palette.getImgUrl() != null ? palette.getImgUrl() : "assets/placeholder.png" %>"
                     alt="palette image"
                     style="width: 100%; height: 100%; object-fit: contain;">
            </div>
        </div>
    </div>
    <p class="text-muted mb-5">❤️ 좋아요 <%= palette.getLike() %>개</p>

    <!-- 🎨 3. Paint 카드 리스트 -->
    <div class="row justify-content-center">
        <%
            List<Paint> paints = palette.getPaints();
            if (paints != null && !paints.isEmpty()) {
                for (Paint paint : paints) {
        %>
        <div class="col-md-3 mb-4">
            <div class="card shadow-sm h-100">
                <img src="<%= paint.getImg() %>" class="card-img-top" alt="paint image">
                <div class="card-body text-center">
                    <h6 class="card-title"><%= paint.getName() %></h6>
                    <p class="card-text text-muted"><%= paint.getBrand() %></p>
                    <p class="card-text small text-secondary">색상코드: <%= paint.getColor() %></p>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <p class="text-muted">등록된 물감이 없습니다.</p>
        <%
            }
        %>
    </div>
</div>

<% } else { %>
<p class="text-danger text-center mt-5">해당 Palette 정보를 찾을 수 없습니다.</p>
<% } %>


<%@ include file="include/footer.jsp" %>