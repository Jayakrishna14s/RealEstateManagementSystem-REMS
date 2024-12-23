package com.realestate;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//@WebServlet("/containsUsername")
public class ContainsUsername extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public ContainsUsername() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("username") == null) {
            response.sendRedirect("/signin");
            return;
        }

        String username = session.getAttribute("username").toString();


        String buyername = request.getParameter("usr");
        String pid = request.getParameter("propertyID");

        if (buyername == null || buyername.trim().isEmpty() || pid == null || pid.trim().isEmpty()) {
            response.sendRedirect("/profile?message=ERROR%20_404");
            return;
        }

        try{
            Connection con = DatabaseConnection.getConnection();
            String query = "Select * from member where uname = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, buyername);

            ResultSet rs = ps.executeQuery();
            if(!rs.next()){
                ps.close();
                con.close();
                response.sendRedirect("/profile?message=Enter%20Valid%20Username");
            } else {
                response.getWriter().println("veedaite unnad bro");
                String querrry = "select * from property where id=? and uname=?";
                PreparedStatement pq = con.prepareStatement(querrry);
                pq.setString(1, pid);
                pq.setString(2, username);
                ResultSet rq = pq.executeQuery();
                
                if(!rq.next()){
                    pq.close();
                    con.close();
                    response.sendRedirect("/profile?message=Enter%20Valid%20Username");
                    return;
                }

                String query2 = "Select * from property where id=? and status = 0";
                PreparedStatement pq2 = con.prepareStatement(query2);
                pq2.setString(1, pid);
                ResultSet rq2 = pq2.executeQuery();
                if(!rq2.next()){
                    pq2.close();
                    con.close();
                    response.sendRedirect("/profile?message=ERROR%20_404");
                }


                String qry = "insert into propertydeals values (? , ?)";
                PreparedStatement pst = con.prepareStatement(qry);
                pst.setString(1, pid);
                pst.setString(2, buyername);
                pst.executeUpdate();

                String q = "update property set status = 1 where id = ?";
                PreparedStatement pst1 = con.prepareStatement(q);
                pst1.setString(1, pid);
                pst1.executeUpdate();

                ps.close();
                pst.close();
                pst1.close();
                con.close();

                response.sendRedirect("/profile?message=Successfully%20Sold%20to%20" + buyername);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }

    }
}
