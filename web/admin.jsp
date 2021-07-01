<%-- 
    Document   : viewRequest
    Created on : May 17, 2021, 2:06:22 PM
    Author     : Quoc Huy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
        <title>View Request</title>
        <c:if test="${sessionScope.LOGIN_USER.roleID ne 1}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
    </head>
    <body class="container">
        <form action="MainController" method="POST">
            <h1>Hello Manager ${sessionScope.LOGIN_USER.name}</h1>
            <c:url var="logout" value="MainController">
                <c:param name="action" value="Logout"></c:param>
            </c:url>
            <a href="${logout}">Logout</a>
            <font color="red"> ${requestScope.NOTI}</font><br>
            <input type="text" name="content" value="${param.content}">
            <input class="btn btn-dark" type="submit" name ="action" value="SearchReq">
        </form>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">Resource Name</th>
                    <th scope="col">User ID</th>
                    <th scope="col">Date Book</th>
                    <th scope="col">Status request</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty requestScope.LIST_REQUEST}">
                    No Record
                </c:if>
                <c:forEach var="dto" items="${requestScope.LIST_REQUEST}" varStatus="counter">
                <form action="MainController" method="POST">
                    <tr>
                        <td>${counter.count}</td>
                    <input type="hidden" name="requestID" value="${dto.requestID}" />
                    <input type="hidden" name="resourceID" value="${dto.resourceID}" />
                    <td>${dto.resourceName}</td>
                    <td>${dto.userID}</td>
                    <td>${dto.dateBook}</td>
                    <td>${dto.statusreqName}</td>
                    <td><c:if test="${dto.statusreqName eq 'New'}">
                            <input class="btn btn-dark" type="submit" value="Accept" name="action" />
                            <input class="btn btn-dark" type="submit" value="Delete" name="action" />
                        </c:if>
                    </td>
                    </tr>
                </form>    
            </c:forEach>
        </tbody>
    </table>
    <c:if test="${not empty requestScope.total}">
        <c:set var="maxPage" value="${(total / 20) + 1 }"></c:set>
        <c:forEach begin="1" end="${maxPage}" step="1" var="page">
            <a href="<c:url value="MainController">
                   <c:param name="action" value="SearchReq"></c:param>
                   <c:param name="page" value="${page - 1}"></c:param>
                   <c:param name="content" value="${param.content}"></c:param>                  
               </c:url>">${page}</a>
        </c:forEach> 
    </c:if>

</body>
</html>
