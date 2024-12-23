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
import java.sql.SQLException;


//@WebServlet("/uploadProperty")
public class UploadProperty extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public UploadProperty() {
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("username") == null) {
            response.sendRedirect("/signin");
            return;
        }

        String username = session.getAttribute("username").toString();

        String propertytype = request.getParameter("propertytype");
        String location = request.getParameter("location");
        String budgetRange = request.getParameter("budgetRange");
        String description = request.getParameter("description");
        String link = request.getParameter("link");

        System.out.println("Username: " + username);
        System.out.println("propertytype: " + propertytype);
        System.out.println("location: " + location);
        System.out.println("budgetRange: " + budgetRange);
        System.out.println("description: " + description);
        System.out.println("link: " + link);

        try{
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("insert into property(uname, propertytype, location, budget, description, link) values(?,?,?,?,?,?)");
            ps.setString(1, username);
            ps.setString(2, propertytype);
            ps.setString(3, location);
            ps.setString(4, budgetRange);
            ps.setString(5, description);
            ps.setString(6, link);
            ps.executeUpdate();

            ps.close();
            con.close();

            System.out.println("inserted into property values");
            response.sendRedirect("/sell?message=Property%20Uploaded");
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
