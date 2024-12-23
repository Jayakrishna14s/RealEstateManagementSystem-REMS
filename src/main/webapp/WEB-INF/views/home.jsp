<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>ESTATE HUB</title>
    <style><%@include file="/WEB-INF/assets/css/commonX.css"%></style>
    <style><%@include file="/WEB-INF/assets/css/home.css"%></style>
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

    <main class="content-container">
        <div class="info-text">
            <p>
                Looking to buy, sell, or rent? With our Real Estate Management System, your search just got easier. Buyers can explore detailed property listings, complete with high-resolution images, pricing, and location details, while sellers can attract potential clients by listing their properties with ease. Connect directly with interested parties and close deals faster than ever!
            </p>
        </div>

        <div class="property-options">
            <div class="card">
                <p>Buying a property is a milestone. Our platform offers a variety of homes, villas, and investment opportunities for all needs.</p>
                <button onclick="location.href='/buy'">BUY</button>
            </div>

            <div class="card">
                <p>Seize the opportunity to own a [land/house] in a prime location, perfect for building, investing, or enjoying.</p>
                <button onclick="location.href='/sell'">SELL</button>
            </div>
        </div>
    </main>



<script type="text/javascript"><%@include file="/WEB-INF/assets/js/commonX.js"%></script>
<script type="text/javascript"><%@include file="/WEB-INF/assets/js/home.js"%></script>

</body>
</html>










<%--<button id="logout">Log out</button>--%>
<%--<%--%>
<%--    String username = (String) session.getAttribute("username");--%>
<%--%>--%>

<%--<h2>Welcome, <%= username  %>!</h2>--%>



<%--<nav>--%>
<%--    <img src="https://raw.githubusercontent.com/Jayakrishna14s/WT_IMAGES/8e0b98a7cc33d0435cd494acc02506e41a6e9034/jk/image_2024-11-23_194730766.svg" />--%>
<%--    <ul>--%>
<%--        <li>Home</li>--%>
<%--        <li>Buy</li>--%>
<%--        <li>Sell</li>--%>
<%--    </ul>--%>
<%--    <img src="https://raw.githubusercontent.com/Jayakrishna14s/WT_IMAGES/2c62d924a340262fef32afe93dfecdfc050839f2/jk/profile.svg" />--%>
<%--</nav>--%>