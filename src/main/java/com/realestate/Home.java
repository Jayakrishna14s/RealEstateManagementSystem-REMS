package com.realestate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//@WebServlet("/home")
public class Home extends HttpServlet  {
    public Home() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("username") == null) {
            response.sendRedirect("/signin");
            return;
        }
//        response.getWriter().write(session.getAttribute("username").toString());
        request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
    }
}
