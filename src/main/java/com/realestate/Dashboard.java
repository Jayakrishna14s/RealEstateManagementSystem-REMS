package com.realestate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//@WebServlet("/dashboard")
public class Dashboard extends HttpServlet  {
    public Dashboard() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("username") == null || !session.getAttribute("username").toString().equals("admin") ) {
            response.sendRedirect("/home");
            return;
        }


        try{
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select count(id) as total, SUM(status) as deals from property; ");
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                int total = rs.getInt(1);
                int deals = rs.getInt(2);
                request.setAttribute("total", total);
                request.setAttribute("deals", deals);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

//        List<>
        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp").forward(request, response);

    }
}
