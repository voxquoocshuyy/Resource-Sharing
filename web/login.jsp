<%-- 
    Document   : login
    Created on : May 14, 2021, 3:36:50 PM
    Author     : Quoc Huy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
        <title>Login</title>
        <script src='https://www.google.com/recaptcha/api.js?hl=en'></script>
    </head>
    <body class="container">
        <c:if test="${not empty requestScope.NOTI}">
            <h2><font color="red">${requestScope.NOTI}</font></h2>
            </c:if>
            <div style="margin-top: 50px; margin-left: 400px" >
        <form action="MainController" method="POST">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">User ID</label> 
                <div class="col-sm-10">
                    <input type="text" name="userID"/><br>
                </div>             
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Password</label> 
                <div class="col-sm-10">
                    <input type="password" name="password"/><br>
                </div>             
            </div>
            <div class="g-recaptcha"
                 data-sitekey="6Ldg4tgaAAAAAPLUNZUahIgO-6QnjbYVRL5-eOVZ"></div>
            <font color="red"> ${requestScope.NotiRecapcha}</font><br>
            <input class="btn btn-dark" type="submit" name="action" value="Login"/>
            <input class="btn btn-dark" type="reset" value="reset"/></br>
            <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/J3.L.P0016/LoginGGController&response_type=code&client_id=90143917858-re702dcb15dnachmtabt2nsrskik1roe.apps.googleusercontent.com&approval_prompt=force">Login With Google</a><br>
            <a href="createuser.jsp">Create new account </a>
            </div>
        </form>
    </body>
</html>
