<%@ page import="com.realestate.PropertyDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ESTATE HUB</title>
    <style><%@include file="/WEB-INF/assets/css/commonX.css"%></style>
    <style><%@include file="/WEB-INF/assets/css/buy.css"%></style>
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
    <div class="filter">
        <form id="filterForm" method="GET">
            <div class="form-group">
                <label>Property Type:</label>
                <div>
                    <label><input type="radio" name="assetType" value="Land"> Land</label>
                    <label><input type="radio" name="assetType" value="Home"> Home</label>
                </div>
            </div>

            <div class="form-group">
                <label>Budget:</label>
                <div>
                    <label><input type="radio" name="budgetRange" value="0-500000"> Up to 5,00,000</label>
                    <label><input type="radio" name="budgetRange" value="500000-1000000"> 5,00,000 - 10,00,000</label>
                    <label><input type="radio" name="budgetRange" value="1000000-2000000"> 10,00,000 - 20,00,000</label>
                    <label><input type="radio" name="budgetRange" value="2000000+"> Above 20,00,000</label>
                </div>
            </div>

            <div class="form-group">
                <label>State:</label>
                <div id="states">
                    <label><input type="radio" name="state" value="Telangana"> Telangana</label>
                    <label><input type="radio" name="state" value="AndhraPradesh"> Andhra Pradesh</label>
                    <label><input type="radio" name="state" value="Karnataka"> Karnataka</label>
                    <label><input type="radio" name="state" value="Tamilnadu"> Tamil Nadu</label>
                </div>
            </div>

        </form>
    </div>

    <div class="network">
        <%
            List<PropertyDTO> propertyList = (List<PropertyDTO>) request.getAttribute("propertyList");
            if (propertyList == null || propertyList.isEmpty()) {
        %>
        <h1 style="text-align: center">No properties available</h1>
        <%
            } else {
        %>
        <ul class="results">
            <%
                for (PropertyDTO property : propertyList) {
            %>
            <li class="HideAndSeek <%=property.getPropertytype()%> <%=property.getBudget()%> <%=property.getLocation()%>">
                <ul class="result">
                    <li><img src="<%= property.getLink()%>"/></li>
                    <li>PropertyType: <%= property.getPropertytype() %></li>
                    <li>Location: <%= property.getLocation()%></li>
                    <li>Budget: <%=property.getBudget()%></li>
                    <li><button onclick="getInfo(<%=property.getId()%>)">More info</button></li>
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
</main>


<script type="text/javascript"><%@include file="/WEB-INF/assets/js/commonX.js"%></script>
<script type="text/javascript"><%@include file="/WEB-INF/assets/js/buy.js"%></script>

</body>
</html>