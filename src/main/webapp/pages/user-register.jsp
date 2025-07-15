<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f2f2f2;
            font-family: 'Segoe UI', sans-serif;
        }

        .form-container {
            max-width: 500px;
            margin: 40px auto;
            padding: 25px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .form-container h2 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .btn-primary {
            width: 100%;
        }

        .alert {
            margin-top: 15px;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Register User</h2>
    <form action="viewdetails" method="post">
        <input type="text" class="form-control" name="name" placeholder="Name" required>
        <input type="email" class="form-control" name="email" placeholder="Email" required>
        <input type="text" class="form-control" name="phone" placeholder="Phone" required>
        <input type="text" class="form-control" name="department" placeholder="Department" required>
        <input type="text" class="form-control" name="college" placeholder="College" required>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>

    <c:if test="${not empty message}">
        <div class="alert alert-danger text-center">${message}</div>
    </c:if>
</div>

</body>
</html>
