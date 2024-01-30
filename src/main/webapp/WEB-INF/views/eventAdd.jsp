<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Add Product</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
    <style>
        .custom-select { height: 35px; width: 90px; font-size: 15px; }
    </style>
</head>
<body>
<div class="container">
    <div id="main-form-view">
        <h2 style="text-align: center;">Create An Event</h2>
        <form action="/event/add" method="post" style="height: auto" class="form-styles">



            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required/><br>

            <label for="type">Type:</label>
            <select class="custom-select" id="type" name="type" required>
                <option value="Sport">Sport</option>
                <option value="Party">Party</option>
                <option value="OfficeSkill">Office Skills</option>
            </select>
            <br>
            <br>
            <label for="title">Content:</label>
            <input style="height: 60px" type="text" id="content" name="content" required/><br>

            <label for="createDate">Create Date:</label>
            <input type="date" step="0.01" id="createDate" name="createDate" required/><br>
            <br>
            <input type="submit" value="Publish"/>
            <br>
            <br>
        </form>

    </div>

</div>



</body>
</html>
