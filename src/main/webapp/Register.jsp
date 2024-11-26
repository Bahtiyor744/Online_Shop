<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div style="height: 100vh; display: flex; align-items: center; justify-content: center;">
    <div class="card p-4 shadow" style="width: 100%; max-width: 400px;">
        <h2 class="text-center mb-4">Register</h2>
        <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
            <div class="mb-3">
                <label for="id" class="form-label">First name</label>
                <input type="text" class="form-control" id="id" name="firstName" placeholder="Enter your First name"
                       required>
            </div>
            <div class="mb-3">
                <label for="name" class="form-label">Last name</label>
                <input type="text" class="form-control" id="name" name="lastName" placeholder="Enter your Last name"
                       required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="text" class="form-control" id="email" name="email" placeholder="Enter your email"
                       required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password"
                       placeholder="Enter your password" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"
                       placeholder="Confirm your password" required>
            </div>
            <div class="d-flex justify-content-between">
                <a href="${pageContext.request.contextPath}/Login.jsp" class="btn btn-outline-secondary">
                    Back to Login
                </a>
                <button type="submit" class="btn btn-primary">Register</button>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
