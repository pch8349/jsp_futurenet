<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.pch.paintfinder.member.dao.Member" %>
<%@ page import="com.pch.paintfinder.paint.dao.Paint" %>
<%@ page import="com.pch.paintfinder.common.code.PaintColorCode" %>
<%@ include file="include/header.jsp" %>

<%
    // 사용자 더미데이터
    Map<String, Member> memberMap = new HashMap<>();

    Member member = new Member("asdf", "asdf", new ArrayList<>());

    memberMap.put(member.getId(), member);
    application.setAttribute("memberMap", memberMap);


    // 페인트 더미데이터
    Map<Integer, Paint> paintMap = new HashMap<>();

    int id = 0;
    paintMap.put(++id, new Paint(id, "Raw Umber", "Liquitex", PaintColorCode.BROWN, "assets/liqitex_RawUmber.jpg"));
    paintMap.put(++id, new Paint(id, "Peach", "Liquitex", PaintColorCode.ORANGE, "assets/liqitex_Peach.jpg"));
    paintMap.put(++id, new Paint(id, "Cadmium Yellow Light Hue", "Liquitex", PaintColorCode.YELLOW, "assets/liqitex_CadmiumYellowLightHue.jpg"));
    paintMap.put(++id, new Paint(id, "Quinacridone Red", "Liquitex", PaintColorCode.RED, "assets/liqitex_QuinacridoneRed.jpg"));
    paintMap.put(++id, new Paint(id, "Emerald Green", "Liquitex", PaintColorCode.GREEN, "assets/liqitex_EmeraldGreen.jpg"));
    paintMap.put(++id, new Paint(id, "Cobalt Blue Hue", "Liquitex", PaintColorCode.BLUE, "assets/liqitex_CobaltBlueHue.jpg"));
    paintMap.put(++id, new Paint(id, "Deep Violet", "Liquitex", PaintColorCode.PURPLE, "assets/liqitex_DeepViolet.jpg"));
    paintMap.put(++id, new Paint(id, "Carbon Black", "Liquitex", PaintColorCode.BLACK, "assets/liqitex_CarbonBlack.jpg"));
    paintMap.put(++id, new Paint(id, "Titanium White", "Liquitex", PaintColorCode.WHITE, "assets/liqitex_TitaniumWhite.jpg"));

    application.setAttribute("paintMap", paintMap);

    response.sendRedirect("login.jsp");

%>
<div class="container mt-5">
    <h1 class="text-center">부트스트랩 + JSP 프로젝트</h1>
    <p class="text-center">환영합니다!</p>
    <div class="text-center">
        <button class="btn btn-primary" onclick="saveData()">저장</button>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/script.js"></script>

<%@ include file="include/footer.jsp" %>