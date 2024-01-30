<!-- products.jsp -->
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<% response.setHeader("Pragma", "no-cache"); %>
<% response.setDateHeader("Expires", 0); %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>
<body>
<div class="container">
    <%@ include file="navMenu.jsp" %>
    <div id="main-view" >

        <table border="1" class="table-styles">
            <tr>
                <th></th>
                <th>ID</th>
                <th>User Name</th>
                <th>Name</th>
                <th>Image</th>
                <th>Gender</th>
                <th>Work Status</th>
                <th>Salary</th>
                <th>Attns</th>
                <th>Sports</th>
                <th>Party</th>
                <th>Skill Comp</th>
                <th>Register Date</th>
                <th>
                    <a href="/admin/user_add" style="color: white"> Add </a>

                </th>
            </tr>
            <c:forEach var="user" items="${userList}">
                <tr>
                        <%---------------check box-------------%>
                    <td><input type="checkbox" name="selectedUser" value="${user.id}"></td>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.name}</td>
                    <td>
                        <!-- 使用<img>标签显示用户头像 -->
                        <img src="${user.profilePhoto}" alt="Profile Photo" style="max-width: 70px; max-height: 60px;">
                    </td>
                    <td>${user.gender}</td>
                    <td>${user.workStatus}</td>
                    <td>${user.salary}</td>
                    <td>${user.attendance}</td>
                    <td>${user.sportStatus}</td>
                    <td>${user.partyStatus}</td>
                    <td>${user.skillCompStatus}</td>
                    <td>${user.registerDate}</td>
                    <td>
                            <%--                            <a href="/user/update"> Edit</a>--%>
                            <%--                        <a href="/update?id=${user.id}">Edit</a>--%>

                                <form method="post" action="/admin/user_echo/${user.id}" style="display:inline;">
                                    <input type="hidden" name="_method" value="update">
                                    <button type="submit">Edit</button>
                                </form>
                        <!-- 删除按钮 -->
                        <form method="post" action="/admin/user_delete/${user.id}" style="display:inline;">
                            <input type="hidden" name="_method" value="delete">
                            <button type="submit" onclick="return confirm('确认删除该记录吗?')">Delete</button>
                        </form>

                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>

