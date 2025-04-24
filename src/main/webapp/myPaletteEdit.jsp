<%@ page import="com.pch.paintfinder.palette.dao.Palette" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.pch.paintfinder.paint.dao.Paint" %>
<%@ page import="java.util.List" %>
<%@ include file="include/header.jsp" %>
<%@ include file="include/navbar.jsp" %>
<%@ page pageEncoding="UTF-8" %>

<%
    // 요청 파라미터로 전달된 id를 이용해 수정할 팔레트 가져오기
    String idParam = request.getParameter("id");
    int paletteId = idParam != null ? Integer.parseInt(idParam) : -1;

    Map<Integer, Palette> paletteMap = (Map<Integer, Palette>) application.getAttribute("paletteMap");
    Palette palette = (paletteMap != null && paletteMap.containsKey(paletteId))
            ? paletteMap.get(paletteId) : null;
%>

<% if (palette != null) { %>
<div class="container mt-4 text-center">

    <!-- ✅ 완료 버튼 (단순 페이지 이동용) -->
    <div class="d-flex justify-content-end mb-3" style="margin:0 auto;">
        <a href="myPaletteDetail.jsp?id=<%= palette.getId() %>" class="btn btn-success btn-sm">완료</a>
    </div>

    <!-- ✅ 제목 수정 form -->
    <form method="post" action="updatePalette.jsp" class="d-flex justify-content-center gap-2 mb-3" style="max-width:300px; margin:0 auto;">
        <input type="hidden" name="id" value="<%= palette.getId() %>">
        <input type="text" name="name" class="form-control" value="<%= palette.getName() != null ? palette.getName() : "-" %>">
        <button type="submit" name="action" value="updateName" class="btn btn-outline-primary btn-sm">변경</button>
    </form>

    <div class="d-flex justify-content-center mb-4">
        <div style="width: 600px;">
            <!-- 이미지 영역 -->
            <div style="width: 600px; height: 600px; display: flex; align-items: center; justify-content: center; overflow: hidden; background-color: #f8f9fa;">
                <img src="<%= palette.getImgUrl() != null && !"".equals(palette.getImgUrl()) ? palette.getImgUrl() : "assets/placeholder.png" %>" alt="palette image" style="width: 100%; height: 100%; object-fit: contain;">
            </div>
        </div>
    </div>

    <!-- ✅ 사진 삭제 form -->
    <form method="post" action="updatePalette.jsp" class="d-inline-block mt-3">
        <input type="hidden" name="id" value="<%= palette.getId() %>">
        <input type="hidden" name="action" value="deleteImage">
        <button type="submit" class="btn btn-outline-danger btn-sm">🗑 사진 삭제</button>
    </form>

    <!-- ✅ 사진 추가 form -->
    <form method="post" action="updatePalette.jsp" enctype="multipart/form-data" class="d-inline-block mt-3 ms-2">
        <input type="hidden" name="id" value="<%= palette.getId() %>">
        <input type="hidden" name="action" value="uploadImage">
        <label class="btn btn-outline-primary btn-sm mb-0">
            📷 사진 추가
            <input type="file" name="image" accept="image/*" hidden onchange="this.form.submit()">
        </label>
    </form>

    <p class="text-muted mb-5">❤️ 좋아요 <%= palette.getLike() %>개</p>

    <!-- 팔레트 내 페인트 카드 리스트 (변경 없이) -->
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
                    <!-- 삭제 버튼 -->
                    <form method="post" action="deletePaintFromPalette.jsp" class="mt-3">
                        <input type="hidden" name="paletteId" value="<%= palette.getId() %>">
                        <input type="hidden" name="paintId" value="<%= paint.getId() %>">
                        <button type="submit" class="btn btn-sm btn-outline-danger">삭제</button>
                    </form>
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
