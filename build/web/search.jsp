<%-- 
    Document   : index
    Created on : May 15, 2021, 3:36:49 PM
    Author     : Quoc Huy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
        <title>Search</title>
        <c:if test="${empty sessionScope.LOGIN_USER}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
    </head>
    <body class="container">
        <h1>Welcome ${sessionScope.LOGIN_USER.name}</h1>
        <c:url var="logout" value="MainController">
            <c:param name="action" value="Logout"></c:param>
        </c:url>
        <a href="${logout}">Logout</a>
        <form action="MainController" method="POST">
            Search By Name <input type="text" name="name" value="${param.name}"/>
            Search By Category <input type="text" name="categoryId" value="${param.categoryId}"/>
            Search By Date Booking <input type="date" name="date" value="${param.dateBook}"/>
            <input class="btn btn-dark" type="submit" name="action" value="Search"><br>
            <input class="btn btn-dark" type="submit" name="action" value="View Request">
        </form>
        <font color="red"> ${requestScope.NOTI}</font><br>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">Resource ID</th>
                    <th scope="col">Category ID</th>
                    <th scope="col">Resource Name</th>
                    <th scope="col">Category Name</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty requestScope.LIST_RESOURCE}">
                    No Record
                </c:if>
                <c:forEach var="dto" items="${requestScope.LIST_RESOURCE}" varStatus="counter">
                <form action="MainController" method="POST">
                    <tr>
                        <td>${counter.count}</td>
                        <td>${dto.resourceID}
                            <input type="hidden" name="resourceID" value="${dto.resourceID}" />
                        </td>
                        <td>${dto.categoryID}</td>
                        <td>${dto.name}</th>
                        <td>${dto.categoryName}</td>
                        <td>${dto.quantity}</th>
                        <td><input class="btn btn-dark" type="submit" name="action" value="Request"</td>
                    </tr>
                </form>
            </c:forEach>
        </tbody>
    </table>
    <c:if test="${not empty requestScope.total}">
        <c:set var="maxPage" value="${(total / 20) + 1 }"></c:set>
        <c:forEach begin="1" end="${maxPage}" step="1" var="page">
            <a href="<c:url value="MainController">
                   <c:param name="action" value="Search"></c:param>
                   <c:param name="page" value="${page - 1}"></c:param>
                   <c:param name="name" value="${param.name}"></c:param>
                   <c:param name="categoryId" value="${param.categoryId}"></c:param>
               </c:url>">${page}</a>
        </c:forEach> 
    </c:if>
</body>
</html>
