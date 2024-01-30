<%@ page import="SOAS.pojo.RegEvent" %>
<%@ page import="ch.qos.logback.core.net.SMTPAppenderBase" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<% response.setHeader("Pragma", "no-cache"); %>
<% response.setDateHeader("Expires", 0); %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Events</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        /* 在这里插入你的 CSS 代码 */
        .form-styles {
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .form-styles label, .form-styles input, .form-styles select {
            margin-right: 8px;
            margin-bottom: 5px;
        }

        .form-styles select {
            width: 80px;
        }
        .form-styles input{
            width: 70px;
        }
    </style>
</head>
<body>
<div class="container">
    <%@ include file="navMenu.jsp" %>
    <div id="main-view" >
          <div>
              <form  action="/event/search" method="get" style=""  class="form-styles" >

                  <label for="username">Username:</label>
                  <input type="text" id="username" name="username" /><br>
                  <label for="type">Comp Type:</label>
                  <select class="custom-select" id="type" name="type" required>
                      <option value="Electricity">Electricity</option>
                      <option value="Water">Water</option>
                      <option value="Recycle">Recycle</option>
                  </select>

                  <label for="month">Month/Year:</label>
                  <input type="number" id="month" name="month" required/><br>

                  <label for="begin">Begin:</label>
                  <input style="width: 100px" type="date" id="begin" name="begin" required/><br>

                  <label for="end">End:</label>
                  <input style="width: 100px" type="date" id="end" name="end" required/><br>

                  <input type="submit" value="Search">
              </form>
          </div>


        <table border="1" class="table-styles">
            <tr>
                <th></th>
                <th>ID</th>
                <th>Title</th>
                <th>Event Type</th>
                <th>User ID</th>
                <th>Username</th>
                <th>User Name</th>
                <th>Proof Image</th>
                <th>Sports</th>
                <th>Skills</th>
                <th>Party</th>
                <th>RegMonth</th>
                <th>Create Date</th>
                <th>
                    <a href="/" style="color: white">Delete</a>
                </th>
            </tr>
            <c:forEach var="regEvent" items="${regEventList}">
                <tr>
                        <%---------------check box-------------%>
                    <td><input type="checkbox" name="selectedEvent" value="${regEvent.id}"></td>
                    <td>${regEvent.id}</td>
                    <td>${regEvent.title}</td>
                    <td>${regEvent.type}</td>
                    <td>${regEvent.userId}</td>
                    <td>${regEvent.userUsername}</td>
                    <td>${regEvent.userName}</td>
                    <td>
                        <!-- 使用<img>标签显示Bill -->
                        <img src="${regEvent.proofImage}" alt="Profile Photo" style="max-width: 70px; max-height: 60px;">
                    </td>
                    <td>${regEvent.sport}</td>
                    <td>${regEvent.skill}</td>
                    <td>${regEvent.party}</td>
                    <td>${regEvent.regMonth}</td>
                    <td>${regEvent.createDate}</td>
                    <td>
                        <form method="post" action="/event/echo/${regEvent.id}" style="display:inline;">
                            <input type="hidden" name="_method" value="update">
                            <button type="submit">Edit</button>
                        </form>
                        <form method="post" action="/event/delete/regEvent/${regEvent.id}" style="display:inline;">
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


