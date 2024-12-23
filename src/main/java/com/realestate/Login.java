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

//@WebServlet("/login")
public class Login extends HttpServlet {
    public Login() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("username") != null) {
            response.sendRedirect("/home");
        }

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");


        if("admin".equals(username) && "admin".equals(password)){
            HttpSession session = request.getSession();
            session.setAttribute("username", "admin");
            response.sendRedirect("/home");
        } else {
            try {
                Connection connection = DatabaseConnection.getConnection();
                String query = "select * from member where uname=? and password=?";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                ResultSet resultSet = preparedStatement.executeQuery();
                if(resultSet.next()){
                    HttpSession session1 = request.getSession();
                    session1.setAttribute("username", username);
                    response.sendRedirect("/home");
                } else {
                    response.sendRedirect("/signin?message=Invalid%20Credentials");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
}


//        else {
//            response.getWriter().append("Served at: ").append(request.getContextPath());
//        }