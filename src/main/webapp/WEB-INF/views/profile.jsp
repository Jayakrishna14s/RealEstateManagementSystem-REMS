<%@ page import="com.realestate.ProfileDTO" %>
<%@ page import="com.realestate.PropertyDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.realestate.PropertyBoughtDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>ESTATE HUB</title>
  <style><%@include file="/WEB-INF/assets/css/commonX.css"%></style>
  <style><%@include file="/WEB-INF/assets/css/profile.css"%></style>
</head>
<body>
<nav class="navbar">
  <img id="logo" src="https://raw.githubusercontent.com/Jayakrishna14s/WT_IMAGES/8e0b98a7cc33d0435cd494acc02506e41a6e9034/jk/image_2024-11-23_194730766.svg" />
  <ul>
    <li><a href="/home">Home</a></li>
    <li><a href="/buy">Buy</a></li>
    <li><a href="/sell">Sell</a></li>
    <%
      String username = (String) session.getAttribute("username");
      if (username.equals("admin")) {
    %>
    <li><a href="/dashboard">Dashboard</a></li>
    <%
      }
    %>
  </ul>
  <img id="profile" src="https://raw.githubusercontent.com/Jayakrishna14s/WT_IMAGES/2c62d924a340262fef32afe93dfecdfc050839f2/jk/profile.svg" />
</nav>

<main>
  <%
    ProfileDTO profile = (ProfileDTO) request.getAttribute("profile");
    if(profile != null) {
  %>

  <div class="details">
    <h1><%=profile.getUname()%></h1>
    <p> <b>Email: </b> <%=profile.getEmail()%></p>
    <p><b>Phone: </b> <%=profile.getPhone()%></p>
    <p><b>Total Uploads: </b><%=profile.getTotalUploads()%></p>
    <p><b>Total Deals: </b><%=profile.getTotalDeals()%></p>
    <button onclick="window.location.href='/logout'">Logout</button>

    <br>
    <br>
    <h3><u>Buy History</u></h3>
    <%
      List<PropertyBoughtDTO> BoughtPropertyList = (List<PropertyBoughtDTO>) request.getAttribute("BoughtPropertyList");
      if(BoughtPropertyList == null || BoughtPropertyList.isEmpty()){
    %>
    <p>No history</p>
    <%
      } else {
    %>
    <ul>
      <%
        for(PropertyBoughtDTO property : BoughtPropertyList) {
      %>
      <li>
        Bought <%=property.getPropertytype()%> from <%=property.getSellerName()%>  <a href="/info?propertyId=<%=property.getID()%>"> <img style="width: 15px" src="https://raw.githubusercontent.com/Jayakrishna14s/WT_IMAGES/8060f910e41aea6771a65c6d75171fae60248946/jk/info.svg"/> </a>
      </li>
      <%
        }
      %>
    </ul>
    <%
      }
    %>
  </div>



  <div class="History">
    <h2  style="text-align: center"><u>Uploads</u></h2>

    <%
      List<PropertyDTO> propertyList = (List<PropertyDTO>) request.getAttribute("propertyList");
      if(propertyList == null || propertyList.isEmpty()) {
    %>
    <h3 style="text-align: center; font-weight: 100">
      No uploads yet
    </h3>
    <%
      } else {
    %>
    <ul>
      <%
        for(PropertyDTO property : propertyList) {
      %>
            <li class='<%=property.getStatus() == 1 ? "Sold" : "Available"%>' >
                <ul class="Property">
                  <li><img src = '<%=property.getLink()%>' onclick="window.location.href='/info?propertyId=<%=property.getId()%>'"/></li>
                  <li style="padding: 10px"><b>Location: </b><%=property.getLocation()%></li>

                  <li>
                    <input id="<%= "_" + property.getId()%>" placeholder="Buyer Username"/>
                    <img class="statusImage" src="https://raw.githubusercontent.com/Jayakrishna14s/WT_IMAGES/6c395d64311cb3573a4e5b7aea25fa0ce6744f4c/jk/tick.svg" />
                  </li>
                  <li><button id="<%= "__" + property.getId()%>">Sell</button></li>

                  <%
                    if(property.getStatus() == 1){
                  %>
                  <li class="buyer">
                    <p><b>Sold to: </b><%=property.getBuyer()%></p>
                    <p><b>Phone: </b> <%=property.getBuyerPhone()%></p>
                  </li>
                  <%
                    }
                  %>
                </ul>
            </li>
      <%
        }
      %>

    </ul>
    <%
      }
    %>
  </div>

  <%
    }
  %>
</main>



<script type="text/javascript"><%@include file="/WEB-INF/assets/js/commonX.js"%></script>
<script type="text/javascript"><%@include file="/WEB-INF/assets/js/profile.js"%></script>

</body>
</html>

<%
  String message = request.getParameter("message");
  if (message != null && !message.isEmpty()) {
%>
<script>
  window.onload = function() {
    setTimeout(function() {
      alert("<%= message %>");
      window.location.href = "/profile";
    }, 100);
  };
</script>
<%
  }
%>
