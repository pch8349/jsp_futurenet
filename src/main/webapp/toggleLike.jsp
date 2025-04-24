<%@ page import="com.pch.paintfinder.palette.dao.Palette" %>
<%@ page import="com.pch.paintfinder.member.dao.Member" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page pageEncoding="UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    int paletteId = Integer.parseInt(request.getParameter("paletteId"));
    String loginId = "";

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("loginId".equals(c.getName())) {
                loginId = c.getValue();
                break;
            }
        }
    }

    Map<Integer, Palette> paletteMap = (Map<Integer, Palette>) application.getAttribute("paletteMap");
    Map<String, Member> memberMap = (Map<String, Member>) application.getAttribute("memberMap");

    if (paletteMap != null && memberMap != null) {
        Palette palette = paletteMap.get(paletteId);
        Member member = memberMap.get(loginId);

        if (palette != null && member != null) {
            List<Integer> likes = member.getLikes();
            if (likes == null) {
                likes = new ArrayList<>();
                member.setLikes(likes);
            }

            if (likes.contains(paletteId)) {
                // 좋아요 취소
                likes.remove(Integer.valueOf(paletteId));
                palette.setLike(palette.getLike() - 1);
            } else {
                // 좋아요 추가
                likes.add(paletteId);
                palette.setLike(palette.getLike() + 1);
            }
        }
    }

    response.sendRedirect("myPaletteDetail.jsp?id=" + paletteId);
%>
