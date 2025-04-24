<%@ page import="com.pch.paintfinder.palette.dao.Palette" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.pch.paintfinder.paint.dao.Paint" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    // 전달받은 파라미터 받기
    int paintId = Integer.parseInt(request.getParameter("paintId"));
    int paletteId = Integer.parseInt(request.getParameter("paletteId"));

    // 전체 팔레트와 페인트 맵 가져오기
    Map<Integer, Palette> paletteMap = (Map<Integer, Palette>) application.getAttribute("paletteMap");
    Map<Integer, Paint> paintMap = (Map<Integer, Paint>) application.getAttribute("paintMap");

    // 해당 palette와 paint가 모두 존재하면 처리
    if (paletteMap != null && paintMap != null
            && paletteMap.containsKey(paletteId)
            && paintMap.containsKey(paintId)) {

        Palette palette = paletteMap.get(paletteId);
        List<Paint> paints = palette.getPaints();

        // 없으면 새로 생성
        if (paints == null) {
            paints = new ArrayList<>();
            palette.setPaints(paints);
        }

        // 중복 방지를 위해 이미 존재하는지 체크
        boolean alreadyExists = paints.stream().anyMatch(p -> p.getId() == paintId);
        if (!alreadyExists) {
            paints.add(paintMap.get(paintId));
        }
    }

    // 다시 내 팔레트 페이지로 리디렉션
    response.sendRedirect("paint.jsp");
%>
