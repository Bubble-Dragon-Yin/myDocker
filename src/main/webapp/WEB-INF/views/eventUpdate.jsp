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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="container">
    <div id="main-form-view">
        <h2> Update Event </h2>
        <form id="eventUpdate" action="/event/update/${eventId}" method="post" style="height: auto" class="form-styles">

            <label for="eventId">Event ID:</label>
            <input type="text" id="eventId" name="eventId" value="${eventId}" required/><br>
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="${title}" required/><br>

            <label for="type">Event Type:</label>
            <input type="text" id="type" name="type" value="${type}" required/><br>

            <label for="content">Content:</label>
            <input type="text" id="content" name="content" value="${content}" required/><br>

            <label for="userId">User ID:</label>
            <input type="text" id="userId" name="userId" value="${userId}" required/><br>

            <label for="userUsername">Username:</label>

            <input type="text" id="userUsername" name="userUsername" value="${userUsername}" required/><br>

            <label for="userName">Name:</label>
            <input type="text" id="userName" name="userName" value="${userName}" required/><br>

            <label for="userPassword">Password:</label>
            <input type="text" id="userPassword" name="userPassword" value="${userPassword}" /><br>


<%--            <label for="proofImage">Proof Image</label>--%>
<%--            <input type="text" id="proofImage" name="proofImage" value="${proofImage}" required/><br>--%>
            <label for="proofImage">Proof Image</label>
            <img src="${proofImage}" alt="Current Profile Photo" id="previewImage" style="max-width: 190px; max-height: 175px;"/><br>
            <input type="file" id="proofImage" name="image" onchange="uploadImage()"/>
            <input type="hidden" id="profilePhotoUrl" name="proofImage" value="${proofImage}" required/><br>

            <img id="previewImage" src="#" alt="Preview Image" style="max-width: 190px; height: 175px; border: 1px solid black; display: none;"/>
            <br>
            <br>

            <label for="sport">Sports:</label>
            <select class="custom-select" id="sport" name="sport">
                <option value="Swim" ${sport == 'Swim' ? 'selected' : ''}>Swim</option>
                <option value="Marathon" ${sport == 'Marathon' ? 'selected' : ''}>Marathon</option>
                <option value="Soccer" ${sport == 'Soccer' ? 'selected' : ''}>Soccer</option>
            </select>
            <br>

            <label for="skill">Skills:</label>
            <select class="custom-select" id="skill" name="skill" value="${skill}" >
                <option value="Excel" ${skill == 'Excel' ? 'selected' : ''}>Excel</option>
                <option value="Word" ${skill == 'Word' ? 'selected' : ''}>Word</option>
                <option value="Canva" ${skill == 'Canva' ? 'selected' : ''}>Canva</option>
            </select>
            <br>

            <label for="party">Party:</label>
            <select class="custom-select" id="party" name="party">
                <option value="Mini" ${party== 'Mini' ? 'selected' : ''}>Mini</option>
                <option value="Annual" ${party== 'Annual' ? 'selected' : ''}>Annual</option>

            </select>

            <br>



            <label for="regMonth">Reg Month</label>
            <input type="text" id="regMonth" name="regMonth" value="${regMonth}" required/><br>
            <br>
            <br>
            <label for="createDate">Create Date:</label>
            <input type="date" step="0.01" id="createDate" name="createDate" value="${createDate}" required/><br>
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
        var profilePhotoInput = $('#proofImage')[0];

        // 检查用户是否选择了新的图片
        if (profilePhotoInput.files.length > 0) {
            var formData = new FormData($('#eventUpdate')[0]);
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
