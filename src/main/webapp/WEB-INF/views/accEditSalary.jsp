<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<% response.setHeader("Pragma", "no-cache"); %>
<% response.setDateHeader("Expires", 0); %>
<html>
<head>
    <title>Add Product</title>
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
        <h2>  User Update </h2>
        <form action="/acc/user_update/${userId}" method="post" style="height: auto" class="form-styles" id="userForm">

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="${username}" required/><br>

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${name}" required/><br>

            <label for="salary">Salary:</label>
            <input type="number" id="salary" name="salary" value="${salary}" required/><br>

            <label for="attendance">Attendance:</label>
            <input type="number" id="attendance" name="attendance" value="${attendance}" required/><br>

            <label for="workStatus">Work Status:</label>
            <select class="custom-select" id="workStatus" name="workStatus" value="${workStatus}" >
                <option value="On Job">On Job</option>
                <option value="Business Trip">Business Trip</option>
                <option value="On Vacation">On Vacation</option>
                <option value="Resigning">Resigning</option>
            </select>

           <label for="sportStatus">Sports:</label>
            <select class="custom-select" id="sportStatus" name="sportStatus" required>
                <option value="NO" ${sportStatus == 'NO' ? 'selected' : ''}>NO</option>
                <option value="YES" ${wsportStatus == 'YES' ? 'selected' : ''}>YES</option>
            </select>

            <label for="partyStatus">Party:</label>
            <select class="custom-select" id="partyStatus" name="partyStatus" required>
                <option value="NO" ${partyStatus == 'NO' ? 'selected' : ''}>NO</option>
                <option value="YES" ${partyStatus == 'YES' ? 'selected' : ''}>YES</option>
            </select>

            <label for="skillCompStatus">Skill:</label>
            <select class="custom-select" id="skillCompStatus" name="skillCompStatus" required>
                <option value="NO" ${skillCompStatus == 'NO' ? 'selected' : ''}>NO</option>
                <option value="YES" ${skillCompStatus == 'YES' ? 'selected' : ''}>YES</option>
            </select>

            <label for="profilePhoto">Profile Photo</label>
            <input type="file" id="profilePhoto" name="image" onchange="uploadImage()"/>
            <input type="hidden" id="profilePhotoUrl" name="profilePhoto" value="${profilePhoto}"/><br>
            <img src="${profilePhoto}" alt="Current Profile Photo" id="previewImage" style="max-width: 190px; max-height: 175px;"/><br>
            <img id="previewImage" src="#" alt="Preview Image" style="max-width: 190px; height: 175px; border: 1px solid black; display: none;"/>
            <br>

            <label for="registerDate">Register Date:</label>
            <input type="date" step="0.01" id="registerDate" name="registerDate" value="${registerDate}" required/><br>
            <br>

            <br>
            <input type="submit" value="Submit"/>
            <br>
            <br>

        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    function uploadImage() {
        var profilePhotoInput = $('#profilePhoto')[0];

        // 检查用户是否选择了新的图片
        if (profilePhotoInput.files.length > 0) {
            var formData = new FormData($('#userForm')[0]);
            formData.set('image', profilePhotoInput.files[0]);

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
        } else {
            // 用户没有选择新的图片，使用原始图片URL
            var originalImageUrl = $('#previewImage').attr('src');
            $('#profilePhotoUrl').val(originalImageUrl);
        }
    }
</script>

</body>

</html>
