<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>REAL ESTATE</title>
    <style><%@include file="/WEB-INF/assets/css/common.css"%></style>
    <style><%@include file="/WEB-INF/assets/css/signin.css"%></style>
</head>
<body>

<header class="navbar">
    <div class="logo">ESTATE<span>HUB</span></div>
</header>

<section class="hero">
    <div class="form-container">
        <div class="form-toggle">
            <button id="login-btn" onclick="showLogin()">Login</button>
            <button id="signup-btn" onclick="showSignup()">Signup</button>
        </div>

        <div class="form-content">
            <!-- Login Form -->
            <form id="login-form" class="form active" action="/login" method="POST">
                <h2>Login</h2>
                <input type="text" name="username" placeholder="Username" required />
                <input type="password" name="password" placeholder="Password" required />
                <button type="submit">Login</button>
            </form>

            <!-- Signup Form -->
            <form id="signup-form" class="form" action="/signup" method="POST">
                <h2>Signup</h2>
                <input type="text" name="uname" placeholder="Username" required />
                <input type="email" name="email" placeholder="Email" required />
                <input type="password" name="password" placeholder="Password" required />
                <input type="text" name="phone" placeholder="Phone" required />
                <button type="submit">Signup</button>
            </form>
        </div>
    </div>
</section>

<script type="text/javascript"><%@include file="/WEB-INF/assets/js/signin.js"%> </script>

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
            window.location.href = "/signin";
        }, 100);
    };
</script>
<%
    }
%>
