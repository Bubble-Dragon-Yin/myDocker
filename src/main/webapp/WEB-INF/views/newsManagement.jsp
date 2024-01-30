<!-- products.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>News</title>
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
                <th>Title</th>
                <th>Cover</th>
                <th>Content</th>
                <th>Create Date</th>
                <th>
                    <a href="/news/add" style="color: white"> Add </a>
                </th>
            </tr>
            <c:forEach var="news" items="${newsList}">
                <tr>
                    <%---------------check box-------------%>
                    <td><input type="checkbox" name="selectedNews" value="${news.id}"></td>
                    <td>${news.id}</td>
                    <td>${news.title}</td>
                    <td>
                        <img src="${news.coverImage}" alt="Cover image" style="max-width: 70px; max-height: 60px;">
                    </td>

                    <td>${news.content}</td>
                    <td>${news.createDate}</td>
                    <td>
                        <a href="/update?id=${news.id}">Edit</a>
                        <!-- 删除按钮 -->
                        <form method="post" action="/news/delete/${news.id}" style="display:inline;">
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
