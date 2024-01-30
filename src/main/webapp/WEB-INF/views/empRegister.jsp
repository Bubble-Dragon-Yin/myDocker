<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<% response.setHeader("Pragma", "no-cache"); %>
<% response.setDateHeader("Expires", 0); %>
<html>
<head>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
    <style>
        .custom-select {
            height: 35px; width: 80px; font-size: 15px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<div class="container">
    <div id="main-form-view">
        <h2> Add User </h2>
        <form id="userForm" action="/user/registerUser" method="post" style="height: auto" class="form-styles">

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="" required/><br>

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value=""  required/><br>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value=""  required/><br>

            <label for="profilePhoto">Profile Photo</label>
            <input  type="file" id="profilePhoto" name="image" onchange="uploadImage()"/>
            <!-- 修改隐藏域的 ID 为唯一值，例如：profilePhotoUrl -->
            <input type="hidden" id="profilePhotoUrl" name="profilePhoto" required/><br>

            <img id="previewImage" src="#" alt="Preview Image" style="max-width: 190px; height: 175px; border: 1px solid black; display: none;"/>
            <br>
            <br>
            <br>

            <label for="gender">Gender:</label>
            <select class="custom-select" id="gender" name="gender" required>
                <option value="M">Male</option>
                <option value="F">Female</option>
            </select>
            <br>
            <br>
            <label for="registerDate">Create Date:</label>
            <input type="date" step="0.01" id="registerDate" name="registerDate" required/><br>
            <br>
            <input type="submit" value="Add User"/>
            <%--            <input type="button" value="Upload" onclick="uploadImage()"/>--%>
            <br>
            <br>

        </form>
    </div>
</div>
<script>
    function uploadImage() {
        var formData = new FormData($('#userForm')[0]);
        formData.set('image', $('#profilePhoto')[0].files[0]);

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
