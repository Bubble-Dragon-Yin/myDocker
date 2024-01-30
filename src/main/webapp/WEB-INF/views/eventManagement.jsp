<!-- products.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Events</title>
<%--    <link rel="stylesheet" href="/css/style.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>
<body>
<div class="container">
    <%@ include file="navMenu.jsp" %>
    <div id="main-view" >
        <table border="1" class="table-styles">
            <thead>
            <tr>
                <th></th>
                <th>ID</th>
                <th>Title</th>
                <th>Event Type</th>
                <th>Content</th>
                <th>Create Date</th>
                <th>
                    <a href="/event/add" style="color: white"> Add Events</a>
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="event" items="${eventList}">
                <tr>
                        <%---------------check box-------------%>
                    <td><input type="checkbox" name="selectedEvent" value="${event.id}"></td>
                    <td>${event.id}</td>
                    <td>${event.title}</td>
                    <td>${event.type}</td>
                    <td>${event.content}</td>
                    <td>${event.createDate}</td>
                    <td>
                        <form method="post" action="/event/delete/${event.id}" style="display:inline;">
                            <input type="hidden" name="_method" value="delete">
                            <button type="submit" onclick="return confirm('确认删除该记录吗?')">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>

</html>
