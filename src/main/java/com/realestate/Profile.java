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

//@WebServlet("/profile")
public class Profile extends HttpServlet  {
    public Profile() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("username") == null) {
            response.sendRedirect("/signin");
            return;
        }

            String username = (String) session.getAttribute("username");
            try {
                Connection con = DatabaseConnection.getConnection();
                String query = "SELECT m.uname, m.email, m.phone, " +
                        "COUNT(p.ID) AS totalUploads, " +
                        "SUM(CASE WHEN p.status = 1 THEN 1 ELSE 0 END) AS totalDeals " +
                        "FROM member m " +
                        "LEFT JOIN property p ON m.uname = p.uname " +
                        "WHERE m.uname = ? " +
                        "GROUP BY m.uname, m.email, m.phone;";

                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, username);
                ResultSet rs = ps.executeQuery();

                if(rs.next()) {
                    ProfileDTO profile = new ProfileDTO(
                            rs.getString("uname"),
                            rs.getString("email"),
                            rs.getString("phone"),
                            rs.getInt("totalUploads"),
                            rs.getInt("totalDeals")
                    );
                    request.setAttribute("profile", profile);
                }


//                String propertyListQuery = "select * from property where uname = ?";
//                String propertyListQuery = "SELECT p.ID as id, p.uname as uname, p.propertytype as propertytype, p.location as location, p.budget as budget, p.description as description, p.link as link, p.status as status, pd.buyer as buyer "
//                        + "FROM property p "
//                        + "LEFT JOIN propertydeals pd ON p.ID = pd.ID "
//                        + "WHERE p.uname = ? AND (p.status = 1 OR p.status = 0);";

                String propertyListQuery = "SELECT p.ID as id, p.uname as uname, p.propertytype as propertytype, p.location as location, p.budget as budget, p.description as description, p.link as link, p.status as status, pd.buyer as buyer, m.phone as buyerPhone "
                        + "FROM property p "
                        + "LEFT JOIN propertydeals pd ON p.ID = pd.ID "
                        + "LEFT JOIN member m ON pd.buyer = m.uname "
                        + "WHERE p.uname = ? AND (p.status = 1 OR p.status = 0);";

                PreparedStatement ps1 = con.prepareStatement(propertyListQuery);
                ps1.setString(1, username);
                ResultSet rs1 = ps1.executeQuery();
                List<PropertyDTO> propertyList = new ArrayList<PropertyDTO>();
                while(rs1.next()) {
                    PropertyDTO property = new PropertyDTO(
                            rs1.getInt("id"),
                            rs1.getString("uname"),
                            rs1.getString("propertytype"),
                            rs1.getString("location"),
                            rs1.getString("budget"),
                            rs1.getString("description"),
                            rs1.getString("link"),
                            rs1.getString("buyer"),
                            rs1.getString("buyerPhone"),
                            rs1.getInt("status")
                    );
                    propertyList.add(property);
                }
                request.setAttribute("propertyList", propertyList);
                for(PropertyDTO property : propertyList) {
                    System.out.println(property.getId());
                }


                String qq = "SELECT p.id as ID, "
                        + "p.propertytype as asset, "
                        + "p.uname as sellername, "
                        + "pd.buyer as buyername "
                        + "FROM property p "
                        + "JOIN propertydeals pd ON p.id = pd.id "
                        + "WHERE pd.buyer = ?";

                PreparedStatement ps2 = con.prepareStatement(qq);
                ps2.setString(1, username);
                ResultSet rs2 = ps2.executeQuery();

                List<PropertyBoughtDTO> BoughtPropertyList =  new ArrayList<PropertyBoughtDTO>();
                while(rs2.next()) {
                    PropertyBoughtDTO property = new PropertyBoughtDTO(
                            rs2.getInt("ID"),
                            rs2.getString("asset"),
                            rs2.getString("sellername")
                    );
                    BoughtPropertyList.add(property);
                }

                request.setAttribute("BoughtPropertyList", BoughtPropertyList);
                for(PropertyBoughtDTO property : BoughtPropertyList) {
                    System.out.println(property.getID());
                    System.out.println(property.getPropertytype());
                    System.out.println(property.getSellerName());
                }

                request.getRequestDispatcher("/WEB-INF/views/profile.jsp").forward(request, response);
                System.out.println("Setttt");
            } catch (SQLException e){
                e.printStackTrace();
            }
    }
}



