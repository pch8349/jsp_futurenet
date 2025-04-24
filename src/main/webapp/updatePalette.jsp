<%@ page import="com.pch.paintfinder.palette.dao.Palette" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.io.File" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="java.util.List" %>

<%
    request.setCharacterEncoding("UTF-8");

    int id = -1;
    String action = null;
    String newName = null;
    FileItem uploadImage = null;

    Map<Integer, Palette> paletteMap = (Map<Integer, Palette>) application.getAttribute("paletteMap");

    // 1. Multipart 요청 처리 (사진 업로드 시)
    if (ServletFileUpload.isMultipartContent(request)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items) {
                if (item.isFormField()) {
                    if ("id".equals(item.getFieldName())) {
                        id = Integer.parseInt(item.getString("UTF-8"));
                    } else if ("action".equals(item.getFieldName())) {
                        action = item.getString("UTF-8");
                    } else if ("name".equals(item.getFieldName())) {
                        newName = item.getString("UTF-8");
                    }
                } else if ("image".equals(item.getFieldName())) {
                    uploadImage = item;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        // 2. 일반 요청 처리 (제목 수정, 이미지 삭제 등)
        id = Integer.parseInt(request.getParameter("id"));
        action = request.getParameter("action");
        newName = request.getParameter("name");
    }

    // 3. 요청 처리
    if (paletteMap != null && paletteMap.containsKey(id)) {
        Palette palette = paletteMap.get(id);

        if ("updateName".equals(action) && newName != null) {
            palette.setName(newName);

        } else if ("deleteImage".equals(action)) {
            palette.setImgUrl("");

        } else if ("uploadImage".equals(action) && uploadImage != null) {
            try {
                String uploadPath = application.getRealPath("/") + "assets/";
                String fileName = System.currentTimeMillis() + "_" + Paths.get(uploadImage.getName()).getFileName();
                File file = new File(uploadPath + fileName);
                uploadImage.write(file);
                palette.setImgUrl("assets/" + fileName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    response.sendRedirect("myPaletteEdit.jsp?id=" + id);
%>
