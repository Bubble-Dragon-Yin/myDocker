<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("Content-Language", "en");
%>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<% response.setHeader("Pragma", "no-cache"); %>
<% response.setDateHeader("Expires", 0); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f8f8f8;
        }

        header {
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
            background-color: #ccffcc;
        }

        .logo-container img {
            height: 50px;
        }

        .logo-container span {
            margin-left: 10px;
            font-size: 24px;
        }

        .user-controls a {
            margin: 0 10px;
            text-decoration: none;
            color: #000;
            transition: color 0.3s ease;
        }

        .user-controls a:hover {
            color: #333;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
            background-color: #ddd;
            margin: 0;
            display: flex;
        }

        nav ul li {
            padding: 10px 20px;
        }

        nav ul li a {
            text-decoration: none;
            color: #000;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: #333;
            background-color: #ccc;
        }

        .competition-section {
            padding: 20px;
        }

        .competition-article {
            margin-bottom: 20px;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }

        .competition-article:hover {
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
            transform: translateY(-2px);
        }

        .competition-article h3 a {
            text-decoration: none;
            color: #000;
            transition: color 0.3s ease;
        }

        .competition-article h3 a:hover {
            color: #333;
        }

        .competition-article p {
            margin-top: 10px;
            color: #666;
        }

        /* Responsive adjustments can be made here */
        @media (max-width: 768px) {
            .competition-article {
                padding: 10px;
            }

            nav ul li {
                padding: 10px 10px;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="logo-container">
        <img src="MBIP.png" alt="MBIP Logo" />
        <span>MBIP</span>
    </div>
    <div class="user-controls">
        <a href="profile.html">Profile</a>
        <a href="/logout">Logout</a>
    </div>
</header>
<nav>
    <ul>
        <li><a href="/user_home.html">Home</a></li>
        <li><a href="/user/news/list">News</a></li>
        <li><a href="/user/competition/list">Join event</a></li>
    </ul>
</nav>
<div class="competition-section">
    <h2>Latest Competitions</h2>
    <c:forEach var="event" items="${eventList}">
        <div class="competition-article">
            <h3>
                <a href="../../Downloads/project%20progress的副本/water.html">${event.title}</a>
            </h3>
            <p>${event.content}</p>
            <c:choose>
                <c:when test="${event.type eq 'Sport'}">
                    <form method="post" action="/user/join/sport/event/echo/${event.id}" style="display:inline;">
                        <input type="hidden" name="_method" value="update">
                        <button type="submit">Join now</button>
                    </form>
                </c:when>

                <c:when test="${event.type eq 'Party'}">
                    <form method="post" action="/user/join/party/event/echo/${event.id}" style="display:inline;">
                        <input type="hidden" name="_method" value="update">
                        <button type="submit">Join now</button>
                    </form>
                </c:when>

                <c:when test="${event.type eq 'OfficeSkill'}">
                    <form method="post" action="/user/join/skill/comp/event/echo/${event.id}" style="display:inline;">
                        <input type="hidden" name="_method" value="update">
                        <button type="submit">Join now</button>
                    </form>
                </c:when>

                <c:when test="${event.type eq 'Water'}">
                    <form method="post" action="/user/compWater/echo/${event.id}" style="display:inline;">
                        <input type="hidden" name="_method" value="update">
                        <button type="submit">Join now</button>
                    </form>
                </c:when>
                <c:when test="${event.type eq 'Electricity'}">
                    <form method="post" action="/user/compEle/echo/${event.id}" style="display:inline;">
                        <input type="hidden" name="_method" value="update">
                        <button type="submit">Join now</button>
                    </form>
                </c:when>
                <c:when test="${event.type eq 'Recycle'}">
                    <form method="post" action="/user/compRecycle/echo/${event.id}" style="display:inline;">
                        <input type="hidden" name="_method" value="update">
                        <button type="submit">Join now</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <!-- Handle the default case or add more conditions if needed -->
                </c:otherwise>
            </c:choose>
        </div>
    </c:forEach>

</div>
</body>
</html>
