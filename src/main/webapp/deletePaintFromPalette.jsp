<%@ page import="com.pch.paintfinder.palette.dao.Palette" %>
<%@ page import="com.pch.paintfinder.paint.dao.Paint" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
  request.setCharacterEncoding("UTF-8");

  int paletteId = Integer.parseInt(request.getParameter("paletteId"));
  int paintId = Integer.parseInt(request.getParameter("paintId"));

  Map<Integer, Palette> paletteMap = (Map<Integer, Palette>) application.getAttribute("paletteMap");
  if (paletteMap != null && paletteMap.containsKey(paletteId)) {
    Palette palette = paletteMap.get(paletteId);
    List<Paint> paints = palette.getPaints();

    if (paints != null) {
      paints.removeIf(p -> p.getId() == paintId);  // 해당 paintId를 가진 항목 제거
    }
  }

  response.sendRedirect("myPaletteEdit.jsp?id=" + paletteId);
%>
