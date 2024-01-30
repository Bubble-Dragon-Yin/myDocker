<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<% response.setHeader("Pragma", "no-cache"); %>
<% response.setDateHeader("Expires", 0); %>
<html>
<head>
    <title>Error Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
</head>
<body>
<h1>Error Page</h1>

<c:if test="${not empty errorMessage}">
    <div style="color: red;">${errorMessage}</div>
</c:if>

<script>
    // Wrap the redirection script in a function
    function redirectToPage() {
        window.history.back();
    }

    // Set a timeout for the redirection
    setTimeout(redirectToPage, 2000);  // 5000 milliseconds (5 seconds)
</script>
</body>
</html>

