<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<% response.setHeader("Pragma", "no-cache"); %>
<% response.setDateHeader("Expires", 0); %>
<html>
<head>
    <title>Register Office Skills Competition</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
    <style>
        .custom-select {
            height: 35px; width: 80px; font-size: 15px;
        }
    </style>
</head>
<body>

<div class="container">
    <div id="main-form-view">
        <h2> Register Office Skills Competition </h2>
        <form id="eventForm" action="/user/add/regEvent" method="post" style="height: auto" class="form-styles">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="${title}" required/><br>

            <label for="type">Event Type:</label>
            <input type="text" id="type" name="type" value="${type}" required/><br>


            <label for="content">Content:</label>
            <input type="text" id="content" name="content" value="${content}" required/><br>
            <label for="userUsername">Username:</label>
            <input type="text" id="userUsername" name="userUsername" value="" required/><br>

            <%--            <label for="userName">Name:</label>--%>
            <%--            <input type="text" id="userName" name="userName" value="" /><br>--%>

            <label for="userPassword">Password:</label>
            <input type="password" id="userPassword" name="userPassword" value="" required/><br>

            <label for="skill">Skills:</label>
            <select class="custom-select" id="skill" name="skill" value="${skill}" >
                <option value="Excel">Excel</option>
                <option value="Word">Word</option>
                <option value="Canva">Canva</option>
            </select>
            <br>
            <br>

            <label for="regMonth">Reg Month</label>
            <select class="custom-select" id="regMonth" name="regMonth" value="" required>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="9">11</option>
                <option value="10">12</option>
                <option value="9">2023</option>
                <option value="10">2024</option>
            </select>
            <br>
            <br>


            <div style="border: #212222 solid 1px; background-color: darkgray">
                <label for="proofImage">Proof Image</label>
                <input  type="file" id="proofImage" name="image" onchange="uploadImage()" />
                <!-- 修改隐藏域的 ID 为唯一值，例如：profilePhotoUrl -->
                <input type="hidden" id="profilePhotoUrl" name="proofImage" required/><br>

                <img id="previewImage" src="#" alt="Preview Image" style="max-width: 190px; height: 175px; display: none;"/>
            </div>
            <br>

            <br>

            <%--            <label for="createDate">Create Date:</label>--%>
            <%--            <input type="date" step="0.01" id="createDate" name="createDate" value="${createDate}" /><br>--%>
            <%--            <br>--%>
            <input type="submit" value="Submit"/>
            <br>
            <br>
        </form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    function uploadImage() {
        var formData = new FormData($('#eventForm')[0]);
        formData.set('image', $('#proofImage')[0].files[0]);

        $.ajax({
            url: 'http://localhost:8080/upload',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(result) {
                $('#previewImage').attr('src', result.data);
                $('#profilePhotoUrl').val(result.data); // 设置隐藏域的值
                $('#previewImage').show();
            },
            error: function(xhr, status, error) {
                console.error('Error uploading image:', error);
            }
        });
    }
</script>
</body>
</html>
