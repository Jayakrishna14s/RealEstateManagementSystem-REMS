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
import java.util.ArrayList;
import java.util.List;

//@WebServlet("/buy")
public class Buy extends HttpServlet  {
    public Buy() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("username") == null) {
            response.sendRedirect("/signin");
            return;
        }

        String username = session.getAttribute("username").toString();

        try {
            Connection con = DatabaseConnection.getConnection();
            String query = "select * from property where uname != ? and status = false";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            List<PropertyDTO> propertyList = new ArrayList<PropertyDTO>();
            while(rs.next()) {
                PropertyDTO property = new PropertyDTO(
                        rs.getInt("id"),
                        rs.getString("uname"),
                        rs.getString("propertytype"),
                        rs.getString("location"),
                        rs.getString("budget"),
                        rs.getString("description"),
                        rs.getString("link")
                );
                propertyList.add(property);
            }

            request.setAttribute("propertyList", propertyList);
            request.getRequestDispatcher("/WEB-INF/views/buy.jsp").forward(request, response);
            rs.close();
            con.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }
}
