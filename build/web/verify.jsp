<%-- 
    Document   : verify
    Created on : May 19, 2021, 4:54:13 PM
    Author     : Quoc Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Page</title>
    </head>
    <body>
        <font color="red"> ${requestScope.NotiUserNotActive}</font><br>
        <font color="red"> ${requestScope.NOTI}</font><br>
        <span>We already send a verification code to your email.</span>
        <form action="VerifyCodeController" method="POST">
            <input type="text" name="authcodeverify"/>
            <input type="submit" value="verify"/><br>
            <a href="LogoutController"> Back to login </a>
        </form>
    </body>
</html>
