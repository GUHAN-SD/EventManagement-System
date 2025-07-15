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
            margin: 0;
            padding: 0;
        }

        .form-container {
            max-width: 500px;
            margin: 60px auto;
            padding: 30px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            animation: fadeIn 1s ease-in-out;
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
            background: #007bff;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .alert {
            margin-top: 15px;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>User Registration</h2>

    <!-- Spring form binding to model attribute "user" -->
    <form:form method="post" modelAttribute="user" action="/register">
        <form:hidden path="id" />

        <div class="mb-3">
            <form:input path="name" cssClass="form-control" placeholder="Name" required="true"/>
        </div>

        <div class="mb-3">
            <form:input path="email" type="email" cssClass="form-control" placeholder="Email" required="true"/>
        </div>

        <div class="mb-3">
            <form:input path="phone" cssClass="form-control" placeholder="Phone" required="true"/>
        </div>

        <div class="mb-3">
            <form:input path="department" cssClass="form-control" placeholder="Department" required="true"/>
        </div>

        <div class="mb-3">
            <form:input path="college" cssClass="form-control" placeholder="College" required="true"/>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form:form>

    <c:if test="${not empty message}">
        <div class="alert alert-danger text-center">${message}</div>
    </c:if>
</div>

</body>
</html>
