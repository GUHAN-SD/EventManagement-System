<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registered Users</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(-45deg, #1e3c72, #2a5298, #1e3c72);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            color: #fff;
        }

        @keyframes gradientBG {
            0% {background-position: 0% 50%;}
            50% {background-position: 100% 50%;}
            100% {background-position: 0% 50%;}
        }

        h1 {
            text-align: center;
            margin: 40px 0 20px;
            font-size: 2.5rem;
            color: #ffea00;
            text-shadow: 0 0 10px rgba(0,0,0,0.5);
        }

        .btn-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .back-btn {
            background-color: #6c757d;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            font-weight: bold;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #5a6268;
        }

        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
        }

        th, td {
            padding: 15px;
            text-align: center;
        }

        th {
            background-color: rgba(0, 123, 255, 0.9);
            color: white;
            font-size: 0.9rem;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.05);
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.15);
        }

        .btn {
            padding: 6px 14px;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 0.85rem;
        }

        .update-btn {
            background: #ffc107;
            color: #000;
        }

        .update-btn:hover {
            background: #e0a800;
        }

        .delete-btn {
            background: #dc3545;
            color: white;
        }

        .delete-btn:hover {
            background: #c82333;
        }
    </style>
</head>
<body>

<h1>Registered Users for Event: <c:out value="${event.title}" /></h1>

<div class="btn-container">
    <a href="<c:url value='/admin' />" class="back-btn">⟵ Back to Admin</a>
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
                    <form action="deleteUser" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this user?');">
                        <input type="hidden" name="id" value="${user.id}"/>
                        <input type="submit" class="btn delete-btn" value="Delete"/>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
