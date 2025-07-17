<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register | Event Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            background: #0f0c29; /* updated background */
            background: linear-gradient(to right, #24243e, #302b63, #0f0c29);
            color: white;
        }

        .register-form-container {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 30px;
            border-radius: 15px;
            max-width: 500px;
            margin: 100px auto;
            box-shadow: 0 0 20px rgba(0,255,255,0.3);
        }

        .form-control, .btn {
            border-radius: 10px;
        }

        .form-label {
            color: #a3e4ff;
        }

        .btn-success {
            background-color: #00c9a7;
            border-color: #00c9a7;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="register-form-container">
        <h2 class="text-center mb-4">Register for Event</h2>

        <form action="/register" method="post" autocomplete="off">
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" name="name" class="form-control" required placeholder="Enter your name" value="">
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" required placeholder="Enter your email" value="">
            </div>

            <div class="mb-3">
                <label class="form-label">Phone</label>
                <input type="text" name="phone" class="form-control" required placeholder="Enter your phone number" value="">
            </div>

            <div class="mb-3">
                <label class="form-label">Department</label>
                <input type="text" name="department" class="form-control" required placeholder="Enter your department" value="">
            </div>

            <div class="mb-3">
                <label class="form-label">College</label>
                <input type="text" name="college" class="form-control" required placeholder="Enter your college" value="">
            </div>

            <!-- Hidden field for Event ID -->
            <input type="hidden" name="eventIds" value="${eventId}"/>

            <div class="d-grid">
                <button type="submit" class="btn btn-success">Register</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
