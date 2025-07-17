<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
    <title>Admin Panel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #1e3c72, #2a5298);
            color: white;
            padding: 20px;
        }

        table {
            width: 95%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            color: black;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        .btn {
            padding: 6px 12px;
            border-radius: 4px;
            font-weight: 600;
            text-decoration: none;
        }

        .update-btn {
            background-color: #ffc107;
            color: white;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
        }

        .back-btn {
            background-color: #6c757d;
            color: white;
            margin-bottom: 20px;
        }

        .container {
            background: white;
            color: black;
            max-width: 700px;
            margin: auto;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
        }

        .success-message {
            text-align: center;
            font-size: 1.1rem;
            margin-bottom: 20px;
            color: green;
        }

        h1, h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .actions form {
            display: inline;
        }

        @media (max-width: 768px) {
            table {
                font-size: 0.9rem;
            }
        }
=======
    <title>User List</title>
    <style>
        table { width: 90%; margin: auto; border-collapse: collapse; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        th { background-color: #007bff; color: white; }
        .btn { padding: 6px 12px; border: none; border-radius: 4px; cursor: pointer; }
        .update-btn { background: #ffc107; color: white; }
        .delete-btn { background: #dc3545; color: white; }
        .back-btn { background-color: #6c757d; color: white; }
>>>>>>> 95fba36c798bdc48cef0d2b4941b5114f6134d2d
    </style>
</head>
<body>

<<<<<<< HEAD
<h1>Admin Panel</h1>

<div style="text-align: center;">
    <a href="/" class="btn back-btn">&larr; Back to Home</a>
</div>

<!-- User List -->
<c:if test="${showUserList}">
    <h2>Registered Users</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Department</th><th>College</th><th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.phone}</td>
                    <td>${user.department}</td>
                    <td>${user.college}</td>
                    <td class="actions">
                        <form action="/register" method="get">
                            <input type="hidden" name="userId" value="${user.id}"/>
                            <input type="submit" class="btn update-btn" value="Update"/>
                        </form>
                        <form action="/deleteUser" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
                            <input type="hidden" name="id" value="${user.id}"/>
                            <input type="submit" class="btn delete-btn" value="Delete"/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<!-- Registration Confirmation -->
<c:if test="${showConfirmation}">
    <div class="container mt-5">
        <h2>Registration Successful</h2>

        <div class="success-message">
            Thank you for registering! Your registration has been recorded.
        </div>

        <c:if test="${not empty event}">
            <p><strong>Event Title:</strong> ${event.name}</p>
            <p><strong>Date:</strong> ${event.date}</p>
            <p><strong>Time:</strong> ${event.time}</p>
            <p><strong>Place:</strong> ${event.place}</p>
        </c:if>

        <hr>

        <c:if test="${not empty user}">
            <p><strong>Name:</strong> ${user.name}</p>
            <p><strong>Email:</strong> ${user.email}</p>
            <p><strong>Phone:</strong> ${user.phone}</p>
            <p><strong>Department:</strong> ${user.department}</p>
            <p><strong>College:</strong> ${user.college}</p>
        </c:if>

        <div style="text-align:center; margin-top:20px;">
            <a href="/userview?userId=${user.id}" class="btn back-btn">Back to Events</a>
        </div>
    </div>
</c:if>
=======
<h1 style="text-align: center;">User List</h1>

<!-- Back Button -->
<div style="text-align: center; margin-bottom: 15px;">
    <a href="<c:url value='/' />" class="btn back-btn">Back</a>
</div>

<table>
    <thead>
        <tr>
            <th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Department</th><th>College</th><th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td>${user.department}</td>
                <td>${user.college}</td>
                <td>
                    <form action="register" method="get" style="display:inline;">
                        <input type="hidden" name="id" value="${user.id}"/>
                        <input type="submit" class="btn update-btn" value="Update"/>
                    </form>
                    <form action="deleteUser" method="post" style="display:inline;" onsubmit="return confirm('Are you sure?');">
                        <input type="hidden" name="id" value="${user.id}"/>
                        <input type="submit" class="btn delete-btn" value="Delete"/>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
>>>>>>> 95fba36c798bdc48cef0d2b4941b5114f6134d2d

</body>
</html>
