package com.pch.jsp;

import java.io.IOException;
//import jakarta.annotation.PostConstruct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LifeCycle.do")
public class LifeCycleServlet extends HttpServlet {
    private static final long serialVersionUID = 6428755239794528396L;

//    @PostConstruct
//    public void bizConstruct() {
//        System.out.println("LifeCycleServlet.bizConstruct()");
//    }

    @Override
    public void init() throws ServletException {
        System.out.println("LifeCycleServlet.init()");
    }

    @Override // 클라이언트 요청 처리
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("\nLifeCycleServlet.service()");
        super.service(req, resp);
    }

    @Override
    public void destroy() {
        System.out.println("LifeCycleServlet.destroy()");
    }

    @Override // 클라이언트 요청 처리
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("LifeCycleServlet.doGet()");

        // 시작 화면으로 이동
        req.getRequestDispatcher("/04-21/lifecycle.jsp").forward(req, resp);
    }

    @Override // 클라이언트 요청 처리
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("LifeCycleServlet.doPost()");

        // 시작 화면으로 이동
        req.getRequestDispatcher("/04-21/lifecycle.jsp").forward(req, resp);
    }

}
