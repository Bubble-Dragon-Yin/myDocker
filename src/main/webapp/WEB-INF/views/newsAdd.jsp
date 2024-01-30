<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
    <style>
        .custom-select {
            height: 35px; width: 90px; font-size: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <div id="main-form-view">
        <h2> Add News </h2>
        <form id="newsForm" action="/news/add" method="post" style="height: auto" class="form-styles">

            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required/><br>

            <div style="border: #212222 solid 1px; background-color: darkgray">
                <label for="coverImage">Profile Photo</label>
                <input  type="file" id="coverImage" name="coverImage" onchange="uploadImage()"/>
                <!-- 修改隐藏域的 ID 为唯一值，例如：profilePhotoUrl -->
                <input type="hidden" id="profilePhotoUrl" name="coverImage" required/><br>

                <img id="previewImage" src="#" alt="Preview Image" style="max-width: 190px; height: 175px; border: 1px solid black; display: none;"/>
            </div>

            <label for="content">Content:</label>
            <input style="height: 60px"  type="text" id="content" name="content" required/><br>
            <%--        <textarea  style="width: 349px" name="content" rows="4" cols="50" ></textarea>--%>

            <label for="publisher">Publisher:</label>
            <select class="custom-select" id="publisher" name="publisher" required>
                <option value="Laurence">Laurence</option>
                <option value="Lucy">Lucy</option>
                <option value="Lucy">Ted</option>
            </select>
            <br>
            <br>
            <label for="createDate">Create Date:</label>
            <input type="date" step="0.01" id="createDate" name="createDate" required/><br>
            <br>
            <input type="submit" value="Publish"/>
            <br>
            <br>

        </form>
    </div>

</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    function uploadImage() {
        var formData = new FormData($('#newsForm')[0]);
        formData.set('image', $('#coverImage')[0].files[0]);

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
