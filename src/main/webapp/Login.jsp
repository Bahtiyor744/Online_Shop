<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div style="height: 100vh; display: flex; align-items: center; justify-content: center;">
    <div class="card p-4 shadow" style="width: 100%; max-width: 360px;">
        <h2 class="text-center mb-3">Login</h2>
        <form action="${pageContext.request.contextPath}/LoginServlet" method="Post">
            <div class="mb-3">
                <input type="text" class="form-control" placeholder="First Name" name="name" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" placeholder="Password" name="password" required>
            </div>
            <div class="d-flex justify-content-between align-items-center">
                <a href="${pageContext.request.contextPath}/Register.jsp" >
                    Register
                </a>
                <button type="submit" class="btn btn-primary">
                    Sign in
                </button>
            </div>
        </form>
    </div>
</div>

</body>
</html>