<%-- 
    Document   : viewrequest
    Created on : May 21, 2021, 11:03:29 PM
    Author     : Quoc Huy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
        <title>User View Request</title>
    </head>
    <body class="container">
        <form action="MainController" method="POST">
            <h1>Hello user ${sessionScope.LOGIN_USER.name}</h1>
            <a href="ViewResourceController"> Back to search </a><br>
            <input class="form-control"  type="text" name="content" value="${param.content}">
            <input class="btn btn-dark"  type="submit" name ="action" value="Search Request">
        </form>
        <font color="red"> ${requestScope.NOTI}</font><br>
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
                <c:if test="${empty requestScope.LIST_USER_REQUEST}">
                    No Record
                </c:if>
                <c:forEach var="dto" items="${requestScope.LIST_USER_REQUEST}" varStatus="counter">
                <form action="MainController" method="POST">
                    <tr>
                        <td>${counter.count}</td>
                    <input type="hidden" name="requestID" value="${dto.requestID}" />
                    <input type="hidden" name="resourceID" value="${dto.resourceID}" />
                    <input type="hidden" name="content" value="${param.content}" />
                    <input type="hidden" name="status" value="${dto.statusreqName}" />
                    <td>${dto.resourceName}</td>
                    <td>${dto.userID}</td>
                    <td>${dto.dateBook}</td>
                    <td> ${dto.statusreqName}</td>
                    <td><c:if test="${dto.statusreqName eq 'New'}">
                            <input class="btn btn-dark" type="submit" value="Cancel Request" name="action" />
                        </c:if>
                    </td>
                    </tr>
                </form>    
            </c:forEach>
        </tbody>
    </table>
    <c:if test="${not empty requestScope.total}">     
        <c:set var="maxPage" value="${(total / 20) + 1 }"></c:set>
        <%--<fmt:parseNumber var="maxPage" type="number" value="${(total / 20) + 1 } integerOnly = "true"  />--%>
        <c:forEach begin="1" end="${maxPage}" step="1" var="page">
            <a href="<c:url value="MainController">
                   <c:param name="action" value="Search Request"></c:param>
                   <c:param name="page" value="${page - 1}"></c:param>
                   <c:param name="content" value="${param.content}"></c:param>                  
               </c:url>">${page}</a>
        </c:forEach> 
    </c:if>     
</body>
</html>
