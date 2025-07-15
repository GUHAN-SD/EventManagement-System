<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <style>
        table { width: 90%; margin: auto; border-collapse: collapse; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        th { background-color: #007bff; color: white; }
        .btn { padding: 6px 12px; border: none; border-radius: 4px; cursor: pointer; }
        .update-btn { background: #ffc107; color: white; }
        .delete-btn { background: #dc3545; color: white; }
        .back-btn { background-color: #6c757d; color: white; }
    </style>
</head>
<body>

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

</body>
</html>
