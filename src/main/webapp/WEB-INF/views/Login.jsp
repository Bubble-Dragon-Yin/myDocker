<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("Content-Language", "en");
%>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<% response.setHeader("Pragma", "no-cache"); %>
<% response.setDateHeader("Expires", 0); %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ccffcc; /* Light green background */
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .header {
            position: absolute;
            top: 0;
            left: 10px; /* Adjusted to move header left */
        }

        .header img {
            height: 50px;
        }

        .header h1 {
            display: inline;
            font-size: 24px;
            color: #000;
            margin-left: 10px;
        }

        #login-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 340px; /* Adjusted width to accommodate wider buttons */
            margin-top: 60px; /* To avoid overlapping with the header */
        }

        .input-container {
            margin-bottom: 15px;
        }

        .input-container label {
            display: block;
            margin-bottom: 5px;
        }

        .input-container input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box; /* Ensures padding doesn't affect width */
        }

        .remember-me-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .remember-me-container input {
            margin-right: 5px;
        }

        button, .button-link {
            width: 100%;
            padding: 10px 0;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            display: block; /* Allows width to be 100% */
            box-sizing: border-box; /* Ensures padding doesn't affect width */
        }

        #login-button {
            background-color: #ff8c00;
            color: white;
            margin-bottom: 10px; /* Space between buttons */
        }

        .button-link {
            background-color: #f44336;
            color: white;
            padding: 10px 0; /* Same padding as the button for equal size */
        }

        .button-link:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
<div class="header">

</div>
<div id="login-container">
    <form id="login-form" action="/login" method="post">
        <div class="input-container">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="input-container">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="remember-me-container">
            <input type="checkbox" id="remember-me">
            <label for="remember-me">Remember Me</label>
        </div>
        <button type="submit" id="login-button">Log in</button>
    </form>
    <a href="/user/register" class="button-link">Register</a>
</div>
</body>
</html>
