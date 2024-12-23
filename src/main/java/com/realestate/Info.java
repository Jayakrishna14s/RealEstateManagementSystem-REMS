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


//@WebServlet("/info")
public class Info extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public Info() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("username") == null) {
            response.sendRedirect("/signin");
            return;
        }


        String propertyId = request.getParameter("propertyId");

        if (propertyId == null || propertyId.isEmpty()) {
            response.sendRedirect("/home");
            return;
        }

        try {
            // display details of propertyid = id;
            Connection con = DatabaseConnection.getConnection();
            String query = "select p.id as id, p.uname as uname, p.propertytype as propertytype, p.location as location, p.budget as budget, p.description as description, p.link as link, p.status as status, m.email, m.phone from property p, member m where p.uname = m.uname and p.id = ?";
//            PreparedStatement ps = con.prepareStatement("select * from property where id = ?");
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, propertyId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                PropertyDTO property = new PropertyDTO(
                        rs.getInt("id"),
                        rs.getString("uname"),
                        rs.getString("propertytype"),
                        rs.getString("location"),
                        rs.getString("budget"),
                        rs.getString("description"),
                        rs.getString("link"),
                        rs.getInt("status"),
                        rs.getString("email"),
                        rs.getString("phone")
                );
                request.setAttribute("property", property);
            }

            ps.close();
            con.close();
            request.getRequestDispatcher("/WEB-INF/views/info.jsp").forward(request, response);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
