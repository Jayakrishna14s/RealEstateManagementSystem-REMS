<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ESTATE HUB</title>
    <style><%@include file="/WEB-INF/assets/css/commonX.css"%></style>
    <style><%@include file="/WEB-INF/assets/css/sell.css"%></style>
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
    <form action="/uploadProperty" method="POST">
    <table>
        <tr>
            <th>Property Type: </th>
            <td>
                <ul>
                    <li><label><input type="radio" name="propertytype" value="Land" required/> Land</label></li>
                    <li><label><input type="radio" name="propertytype" value="Home" required/> Home</label></li>
                </ul>
            </td>
        </tr>
        <tr>
            <th>Location: </th>
            <td>
                <ul>
                    <li><label><input type="radio" name="location" value="Telangana" required/> Telangana</label></li>
                    <li><label><input type="radio" name="location" value="AndhraPradesh" required/> Andhra Pradesh</label></li>
                    <li><label><input type="radio" name="location" value="Karnataka" required/> Karnataka</label></li>
                    <li><label><input type="radio" name="location" value="Tamilnadu" required/> Tamilnadu</label></li>
                </ul>

            </td>
        </tr>

        <tr>
            <th>Budget Range: </th>
            <td>
                <ul>
                    <li><label><input type="radio" name="budgetRange" value="0-500000" required> Upto 5,00,000</label></li>
                    <li><label><input type="radio" name="budgetRange" value="500000-1000000" required> 5,00,000 - 10,00,000</label></li>
                    <li><label><input type="radio" name="budgetRange" value="1000000-2000000" required> 10,00,000 - 20,00,000</label></li>
                    <li><label><input type="radio" name="budgetRange" value="2000000+" required> Above 20,00,000</label></li>
                </ul>
            </td>
        </tr>


        <tr>
            <th>Add Description</th>
            <td>
                <textarea name="description" rows="5" cols="60" placeholder="Describe the property details " required></textarea>
            </td>
        </tr>

        <tr>
            <th>Image link (jpg/png)</th>
            <td>
                <input type="text" name="link" placeholder="Drop the link of image (From cloud)" required />
            </td>
        </tr>

        <tr>
            <th></th>
            <td>
                <input type="submit" value="UPLOAD"/>
            </td>
        </tr>
    </table>
    </form>
</main>



<script type="text/javascript"><%@include file="/WEB-INF/assets/js/commonX.js"%></script>
<script type="text/javascript"><%@include file="/WEB-INF/assets/js/sell.js"%></script>

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
            window.location.href = "/sell";
        }, 100);
    };
</script>
<%
    }
%>
