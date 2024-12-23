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

//@WebServlet("/signup")
public class Signup extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public Signup() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("username") != null) {
            response.sendRedirect("/home");
        } else {
            response.sendRedirect("/signin");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        try {
            Connection con = DatabaseConnection.getConnection();
            String query = "select * from member where uname = ?;" ;
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                rs.close();
                con.close();
                response.sendRedirect("/signin?message=Username%20already%20exists");
            } else {
                rs.close();
                con.close();
                Member member = new Member(uname, password, email, phone);
                String result = DatabaseConnection.insert(member);
                response.getWriter().println(result);

                if("Success".equals(result)){
                    response.sendRedirect("/?message=Account%20created%20successfully");
                }
            }

        } catch(SQLException e){
            e.printStackTrace();
        }
    }
}

//        else {
//            response.getWriter().append("Served at: ").append(request.getContextPath());
//        }
//        response.getWriter().append("Served at: ").append(request.getContextPath());
