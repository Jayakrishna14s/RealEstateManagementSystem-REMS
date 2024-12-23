<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REAL ESTATE</title>
    <style><%@include file="/WEB-INF/assets/css/common.css"%></style>
    <style><%@include file="/WEB-INF/assets/css/index.css"%></style>
</head>

<body>
<header class="navbar">
        <div class="logo">ESTATE<span>HUB</span></div>
        <div class="right-actions">
            <a href="/signin" class="signin">SIGN IN</a>
        </div>
</header>


<section class="hero">
        <div class="info-text">
            <h3>Real estate management made easy with our custom software</h3>
            <p style="padding: 0 20% 0 20%">
                Engage owners, buyers, and prospective tenants from a single location using our real estate management
                software.
                Round up properties to showcase, put owners in touch with likely buyers or tenants, and make profitable
                deals.
            </p>
        </div>

        <div class="properties">
            <div class="property-grid">
                <!-- Property 1 -->
                <div class="property">
                    <img src="https://raw.githubusercontent.com/Jayakrishna14s/WT_IMAGES/refs/heads/main/jk/image1.jpg" alt="House 1">
                    <h3>Modern Family Home</h3>
                    <p>Price: $350,000</p>
                    <p>Location: Springfield</p>
                    <p>4 Beds | 3 Baths | 2,500 sqft</p>
                </div>

                <!-- Property 2 -->
                <div class="property">
                    <img src="https://raw.githubusercontent.com/Jayakrishna14s/WT_IMAGES/refs/heads/main/jk/image2.jpg" alt="House 2">
                    <h3>Luxury Villa</h3>
                    <p>Price: $850,000</p>
                    <p>Location: Beverly Hills</p>
                    <p>6 Beds | 5 Baths | 5,000 sqft</p>
                </div>

                <!-- Property 3 -->
                <div class="property">
                    <img src="https://raw.githubusercontent.com/Jayakrishna14s/WT_IMAGES/refs/heads/main/jk/image3.jpg" alt="House 3">
                    <h3>Cozy Cottage</h3>
                    <p>Price: $200,000</p>
                    <p>Location: Maple Town</p>
                    <p>3 Beds | 2 Baths | 1,800 sqft</p>
                </div>
            </div>
        </div>
</section>

<%
    String message = request.getParameter("message");
    if (message != null && !message.isEmpty()) {
        %>
            <script>
                window.onload = function() {
                    setTimeout(function() {
                        alert("<%= message %>");
                        window.location.href="/";
                    }, 100);
                };
            </script>
        <%
    }
%>

</body>
</html>

