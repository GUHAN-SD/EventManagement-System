<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(120deg, #89f7fe, #66a6ff);
            font-family: 'Segoe UI', sans-serif;
        }

        .form-container {
            max-width: 500px;
            margin: 60px auto;
            padding: 30px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            animation: fadeIn 0.8s ease-in-out;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
            font-weight: bold;
        }

        .form-control {
            border-radius: 8px;
            font-size: 0.95rem;
        }

        .btn-primary {
            width: 100%;
            border-radius: 8px;
            font-weight: 600;
            background-color: #007bff;
            letter-spacing: 0.5px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .alert {
            margin-top: 15px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>User Registration</h2>

    <!-- Registration Form -->
    <form:form method="post" modelAttribute="user" action="/register">
        <form:hidden path="id" />

        <!-- Hidden Inputs: Pass eventId and userId to controller -->
        <input type="hidden" name="eventId" value="${eventId}" />
        <input type="hidden" name="userId" value="${userId}" />

        <div class="mb-3">
            <label>Full Name</label>
            <form:input path="name" cssClass="form-control" placeholder="Full Name" required="required"/>
        </div>

        <div class="mb-3">
            <label>Email Address</label>
            <form:input path="email" type="email" cssClass="form-control" placeholder="Email Address" required="required"/>
        </div>

        <div class="mb-3">
            <label>Phone Number</label>
            <form:input path="phone" cssClass="form-control" placeholder="Phone Number" required="required"/>
        </div>

        <div class="mb-3">
            <label>Department</label>
            <form:input path="department" cssClass="form-control" placeholder="Department" required="required"/>
        </div>

        <div class="mb-3">
            <label>College Name</label>
            <form:input path="college" cssClass="form-control" placeholder="College Name" required="required"/>
        </div>

        <button type="submit" class="btn btn-primary">Register</button>
    </form:form>

    <!-- Feedback Message -->
    <c:if test="${not empty message}">
        <div class="alert ${messageType == 'warning' ? 'alert-warning' : 'alert-success'} text-center">
            ${message}
        </div>
    </c:if>
</div>

</body>
</html>
