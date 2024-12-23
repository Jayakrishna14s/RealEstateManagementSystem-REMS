<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>ESTATE HUB</title>
  <style><%@include file="/WEB-INF/assets/css/commonX.css"%></style>
  <style><%@include file="/WEB-INF/assets/css/dashboard.css"%></style>
</head>
<body>
<nav class="navbar">
  <img id="logo" src="https://raw.githubusercontent.com/Jayakrishna14s/WT_IMAGES/8e0b98a7cc33d0435cd494acc02506e41a6e9034/jk/image_2024-11-23_194730766.svg" />
  <ul>
    <li><a href="/home">Home</a></li>
    <li><a href="/buy">Buy</a></li>
    <li><a href="/sell">Sell</a></li>
    <li><a href="/dashboard">Dashboard</a></li>
  </ul>
  <img id="profile" src="https://raw.githubusercontent.com/Jayakrishna14s/WT_IMAGES/2c62d924a340262fef32afe93dfecdfc050839f2/jk/profile.svg" />
</nav>


<main>
  <h1>Basic Metrics</h1>
  <div>
    <div>
      <p>Total Uploads</p>
      <p><%=(int) request.getAttribute("total")%></p>
    </div>
    <div>
      <p>Total Deals</p>
      <p><%=(int) request.getAttribute("deals")%></p>
    </div>
  </div>

  <ul>

  </ul>
</main>


<script type="text/javascript"><%@include file="/WEB-INF/assets/js/commonX.js"%></script>
<script type="text/javascript"><%@include file="/WEB-INF/assets/js/dashboard.js"%></script>

</body>
</html>