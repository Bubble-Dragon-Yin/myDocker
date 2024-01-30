<%@ page import="SOAS.pojo.RegEvent" %>
<%@ page import="ch.qos.logback.core.net.SMTPAppenderBase" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<% response.setHeader("Pragma", "no-cache"); %>
<% response.setDateHeader("Expires", 0); %>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Events</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <%@ include file="navMenu.jsp" %>
    <div id="main-view">
        <table border="1" class="table-styles">
            <tr>
                <th></th>
                <th>ID</th>
                <th>Title</th>
                <th>Event Type</th>
<%--                <th>Content</th>--%>
                <th>User ID</th>
                <th>Username</th>
                <th>User Name</th>
<%--                <th>User Pswd</th>--%>
<%--                <th>Family Members</th>--%>
<%--                <th>Proof Image</th>--%>
                <th>Recycle</th>
<%--                <th>Ele Quantity</th>--%>
<%--                <th>Wtr Quantity</th>--%>
                <th>Avg Ele Quantity</th>
                <th>Avg Wtr Quantity</th>
                <th>Month/Year</th>
                <th>Create Date</th>
<%--                <th>--%>
<%--                    <a href="/" style="color: white">Delete</a>--%>
<%--                </th>--%>
            </tr>
            <c:forEach var="regEvent" items="${regEventList}">
                <tr>
                        <%---------------check box-------------%>
                    <td><input type="checkbox" name="selectedEvent" value="${regEvent.id}"></td>
                    <td>${regEvent.id}</td>
                    <td>${regEvent.title}</td>
                    <td>${regEvent.type}</td>
<%--                    <td>${regEvent.content}</td>--%>
                    <td>${regEvent.userId}</td>
                    <td>${regEvent.userUsername}</td>
                    <td>${regEvent.userName}</td>
<%--                    <td>${regEvent.userPassword}</td>--%>
<%--                    <td>${regEvent.familyMembers}</td>--%>
<%--                    <td>--%>
<%--                        <!-- 使用<img>标签显示Bill -->--%>
<%--                        <img src="${regEvent.proofImage}" alt="Profile Photo" style="max-width: 70px; max-height: 60px;">--%>
<%--                    </td>--%>
                    <td>${regEvent.recycle}</td>
<%--                    <td>${regEvent.eleQuantity}</td>--%>
<%--                    <td>${regEvent.wtrQuantity}</td>--%>
                    <td>${regEvent.avgEleQuantity}</td>
                    <td>${regEvent.avgWtrQuantity}</td>
                    <td>${regEvent.regMonth}</td>
                    <td>${regEvent.createDate}</td>
<%--                    <td>--%>
<%--                        <form method="post" action="/event/echo/${regEvent.id}" style="display:inline;">--%>
<%--                            <input type="hidden" name="_method" value="update">--%>
<%--                            <button type="submit">Edit</button>--%>
<%--                        </form>--%>
<%--                        <form method="post" action="/event/delete/regEvent/${regEvent.id}" style="display:inline;">--%>
<%--                            <input type="hidden" name="_method" value="delete">--%>
<%--                            <button type="submit" onclick="return confirm('确认删除该记录吗?')">Delete</button>--%>
<%--                        </form>--%>
<%--                    </td>--%>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
