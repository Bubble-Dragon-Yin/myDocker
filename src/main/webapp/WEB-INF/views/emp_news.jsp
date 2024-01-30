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
    <title>News</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
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
        }

        .news-section {
            padding: 20px;
        }

        .news-article {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .news-article a {
            text-decoration: none;
            color: #000;
        }

        .news-article img {
            width: 30%; /* Adjust image size to 30% of container width */
            height: auto; /* Height adjusts automatically to maintain aspect ratio */
            border-radius: 5px;
            margin-top: 10px;
            display: block; /* Ensure the image is centered */
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
<header>
    <div class="logo-container">

    </div>
    <div class="user-controls">
        <a href="profile.html">Profile</a>
        <a href="logout.html">Logout</a>
    </div>
</header>
<nav>
        <ul>
            <li><a href="/user_home.html">Home</a></li>
            <li><a href="/user/news/list">News</a></li>
            <li><a href="/user/competition/list">Join event</a></li>
        </ul>
</nav>
<div class="news-section">
    <h2>Latest News</h2>

    <c:forEach var="news" items="${newsList}">
        <div class="news-article">
            <h3><a href="news-detail${news.id}.html">${news.title}</a></h3>
            <p>${news.content}</p>
            <img src="${news.coverImage}" alt="Profile Photo" style="max-width: 70px; max-height: 60px;">
        </div>
    </c:forEach>

    <!-- More news articles can be added here -->
</div>
</body>
</html>
