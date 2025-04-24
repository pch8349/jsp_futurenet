<%@ page import="com.pch.paintfinder.paint.dao.Paint" %>
<%@ page import="java.util.*" %>
<%@ page import="com.pch.paintfinder.common.code.PaintColorCode" %>
<%@ page import="com.pch.paintfinder.palette.dao.Palette" %>
<%@ include file="include/header.jsp" %>
<%@ include file="include/navbar.jsp"%>
<%@ page pageEncoding="UTF-8" %>

<%
    // application 에 저장된 전체 데이터
    Map<Integer, Paint> paintMap = (Map<Integer, Paint>) application.getAttribute("paintMap");

    // 화면에 출력할 복사한 데이터
    Map<Integer, Paint> showPaintMap = new HashMap<>(paintMap);
%>

<%
    // 필터값 읽어오기
    String[] filters = request.getParameterValues("colorFilter");
    filters = filters == null ? new String[0] :  request.getParameterValues("colorFilter");

    // 검색어 값 읽어오기
    String search = request.getParameter("search");
    search = search == null ? "" : request.getParameter("search");

    // 검색 필터 적용할 맵 생성
    Map<Integer, Paint> filteredMap = new LinkedHashMap<>();

    for (Map.Entry<Integer, Paint> entry : paintMap.entrySet()) {
        Paint paint = entry.getValue();

        // 색상 조건 확인
        boolean colorMatch = filters.length == 0 || Arrays.stream(filters)
                .anyMatch(f -> PaintColorCode.fromString(f) == paint.getColor());

        // 검색어 조건 확인 (name 또는 brand에 포함되는지)
        boolean searchMatch = search.isEmpty()
                || paint.getName().toLowerCase().contains(search.toLowerCase())
                || paint.getBrand().toLowerCase().contains(search.toLowerCase());

        if (colorMatch && searchMatch) {
            filteredMap.put(entry.getKey(), paint);
        }
    }

    showPaintMap = new HashMap<>(filteredMap);
%>

<div class="container mt-5 text-center">

    <h3 class="mb-4">물감 전체보기</h3>

    <!-- 상단 필터 & 검색창 -->
    <form method="get" action="paint.jsp">
        <div class="row align-items-start mb-4">
            <!-- 왼쪽: 색상 체크박스 (13개, 5개씩 보기 좋게) -->
            <div class="col-md-6 text-start">
                <div class="row">
                    <%
                        PaintColorCode[] colors = PaintColorCode.values();
                        String[] selectedColors = request.getParameterValues("colorFilter");
                        Set<String> selectedSet = selectedColors != null ? new HashSet<>(Arrays.asList(selectedColors)) : new HashSet<>();
                        for (int i = 0; i < colors.length; i++) {
                            String colorName = colors[i].toString();
                    %>
                    <div class="col-6 col-md-2 mb-2">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="colorFilter"
                                   value="<%= colorName %>" id="color_<%= i %>"
                                <%= selectedSet.contains(colorName) ? "checked" : "" %>>
                            <label class="form-check-label small" for="color_<%= i %>">
                                <%= colorName %>
                            </label>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

            <!-- 오른쪽: 검색창 + 검색 버튼 -->
            <div class="col-md-6 text-end">
                <div class="d-flex justify-content-end">
                    <input type="text" class="form-control w-75 me-2" name="search"
                           placeholder="물감 이름 검색"
                           value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
                    <button type="submit" class="btn btn-primary">검색</button>
                </div>
            </div>
        </div>
    </form>

    <div class="row justify-content-center">
        <%
            if (showPaintMap != null) {
                List<Paint> paintList = new ArrayList<>(showPaintMap.values());
                Collections.sort(paintList, Comparator.comparingInt(Paint::getId)); // id 순 정렬

                for (Paint paint : paintList) {
        %>
        <div class="col-md-3 mb-4">
            <div class="card shadow-sm h-100">
                <img src="<%= paint.getImg() %>" class="card-img-top" alt="paint image">
                <div class="card-body">
                    <h5 class="card-title"><%= paint.getName() %></h5>
                    <p class="card-text text-muted mb-1">브랜드: <%= paint.getBrand() %></p>
                    <p class="card-text mb-1">색상코드: <%= paint.getColor() %></p>
                    <p class="card-text text-secondary small">ID: <%= paint.getId() %></p>

                    <!-- 모달을 열기 위한 버튼 -->
                    <button type="button"
                            class="btn btn-sm btn-outline-primary w-100"
                            data-bs-toggle="modal"
                            data-bs-target="#addToPaletteModal"
                            data-paint-id="<%= paint.getId() %>"
                            data-paint-name="<%= paint.getName() %>">
                    + 내 팔레트에 추가
                    </button>
                </div>
            </div>
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


<!-- 모달 구조 시작 -->
<div class="modal fade" id="addToPaletteModal" tabindex="-1" aria-labelledby="addToPaletteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <!-- 모달 내부 form: 팔레트에 페인트 추가 요청을 서버로 전송 -->
        <form method="post" action="addToMyPalette.jsp">
            <div class="modal-content">

                <!-- 모달 상단 제목 영역 -->
                <div class="modal-header">
                    <h5 class="modal-title" id="addToPaletteModalLabel">내 팔레트에 추가</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
                </div>

                <!-- 모달 본문 -->
                <div class="modal-body">

                    <!-- 선택한 페인트 정보 표시 -->
                    <p class="mb-2">추가할 페인트: <strong id="modalPaintName">-</strong></p>
                    <!-- 서버에 넘길 페인트 ID -->
                    <input type="hidden" name="paintId" id="modalPaintId">

                    <!-- 내 팔레트 목록을 셀렉트로 표시 -->
                    <div class="mb-3">
                        <label for="paletteSelect" class="form-label">팔레트를 선택하세요:</label>
                        <select class="form-select" name="paletteId" id="paletteSelect" required>
                            <%-- application에 저장된 전체 팔레트 중, 로그인 사용자 소유만 출력 --%>
                            <%
                                Map<Integer, Palette> paletteMap = (Map<Integer, Palette>) application.getAttribute("paletteMap");
                                if (paletteMap != null && loginId != null) {
                                    for (Palette p : paletteMap.values()) {
                                        if (loginId.equals(p.getMemberId())) {
                            %>
                            <option value="<%= p.getId() %>">id: <%=p.getId()%> <%= p.getName() != null ? p.getName() : "이름 없는 팔레트" %></option>
                            <%
                                        }
                                    }
                                }
                            %>
                        </select>
                    </div>

                </div>

                <!-- 모달 하단 버튼 영역 -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">추가</button>
                </div>

            </div>
        </form>
    </div>
</div>
<script>
    const modal = document.getElementById('addToPaletteModal');

    // 모달이 열릴 때마다 실행되는 이벤트
    modal.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget; // 클릭된 버튼

        // 버튼에 저장된 페인트 정보 가져오기
        const paintId = button.getAttribute('data-paint-id');
        const paintName = button.getAttribute('data-paint-name');

        // 모달 내부 요소에 값 전달
        document.getElementById('modalPaintId').value = paintId;
        document.getElementById('modalPaintName').textContent = paintName;
    });
</script>

<%@ include file="include/footer.jsp" %>