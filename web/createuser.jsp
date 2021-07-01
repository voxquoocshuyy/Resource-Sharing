<%-- 
    Document   : createuser
    Created on : May 15, 2021, 4:01:48 PM
    Author     : Quoc Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
        <title>Create Account</title>
    </head>
    <body class="container">
        <form action="MainController" method="POST"> 
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">User ID(*) :</label> 
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="userID"  size="10" value="${param.userID}"/>*</br>
                    <font color="red">${requestScope.ERROR.userIDError}</font></br>
                </div>             
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Password(*) :</label> 
                <div class="col-sm-10">
                    <input class="form-control" type="password" name="password"/>*</br>
                    <font color="red">${requestScope.ERROR.passwordError}</font></br>
                </div>             
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Confirm(*) :</label> 
                <div class="col-sm-10">
                    <input class="form-control" type="password" name="confirm"/>*</br>
                    <font color="red">${requestScope.ERROR.confirmPassword}</font></br>
                </div>             
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Name(*) :</label> 
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="name" size="15"  value="${param.name}"/>*</br>
                    <font color="red">${requestScope.ERROR.nameError}</font></br>
                </div>             
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Email(*) :</label> 
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="email"  value="${param.email}"/>*</br>
                    <font color="red">${requestScope.ERROR.emailError}</font></br>
                </div>             
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Phone(*) :</label> 
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="phone" size="10" value="${param.phone}"/>*</br>       
                    <font color="red">${requestScope.ERROR.phoneError}</font></br>
                </div>             
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Address(*) :</label> 
                <div class="col-sm-10">      
                    <input type="text" name="address" value="${param.address}"/>*</br>
                    <font color="red">${requestScope.ERROR.addressError}</font></br>
                </div>             
            </div>
            <input class="btn btn-dark" class="form-control" type="submit" name="action" value="Create">
            <input class="btn btn-dark" type="reset" value="Reset"> 
        </form>
    </body>
</html>
