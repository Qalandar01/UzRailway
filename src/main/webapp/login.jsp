<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(135deg, #6b73ff, #000dff);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: Arial, sans-serif;
    }
    .login-card {
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      padding: 2rem;
      width: 100%;
      max-width: 400px;
    }
    .login-card h1 {
      font-size: 1.8rem;
      margin-bottom: 1.5rem;
      text-align: center;
      color: #333;
    }
    .form-control {
      border-radius: 30px;
    }
    .btn-primary {
      border-radius: 30px;
    }
  </style>
</head>
<body>
<div class="login-card">
  <h1>Login</h1>
  <form action="/user/login" method="post">
    <div class="mb-3">
      <label for="username" class="form-label">Phone</label>
      <input type="text" class="form-control" id="username" name="phone" required>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <div class="d-grid">
      <button type="submit" class="btn btn-primary">Login</button>
    </div>
  </form>
  <div class="text-center mt-3">
    <p class="mb-0">Don't have an account? <a href="register.jsp" class="text-primary">Sign Up</a></p>
  </div>
</div>

<!-- Bootstrap JS (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
