<%@ page import="com.realestate.PropertyDTO" %><%--
  Created by IntelliJ IDEA.
  User: Jayakrishna
  Date: 26-11-2024
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ESTATE HUB</title>
    <style><%@include file="/WEB-INF/assets/css/commonX.css"%></style>
    <style><%@include file="/WEB-INF/assets/css/info.css"%></style>
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

<%
    PropertyDTO property = (PropertyDTO) request.getAttribute("property");
    if(property == null) {
%>
<h1>Such property doesn't exist</h1>
<%
} else {
%>
<main class="content-container">

    <img src="<%=property.getLink()%>" />
    <div class="description">
        <div>
            <h3><u>Description</u></h3>
            <p>
                <%=property.getDescription()%>
            </p>
            <p id="status">
                <b>Status:</b> <span><%=(property.getStatus() == 1? "Sold" : "Available")%></span>
            </p>
        </div>
    </div>

    <div class="primarydetails">
        <div>
            <p><%=property.getPropertytype()%></p>
            <p><%=property.getLocation()%></p>
            <p>Budget Range: <%=property.getBudget()%></p>
        </div>
    </div>

    <div class="contactdetails">
        <div>
            <h3><u>Contact details:</u> </h3>
            <p><%=property.getUname()%></p>
            <p><%=property.getPhone()%></p>
            <p><%=property.getEmail()%></p>
        </div>
    </div>

</main>

<%
    }
%>

<script type="text/javascript"><%@include file="/WEB-INF/assets/js/commonX.js"%></script>
<script type="text/javascript"><%@include file="/WEB-INF/assets/js/info.js"%></script>
</body>
</html>
