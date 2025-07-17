<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User | Events</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #1f1c2c, #928dab);
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .event-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            padding: 40px;
        }

        .event-card {
            border-radius: 20px;
            padding: 20px;
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .event-card:hover {
            transform: scale(1.05);
            box-shadow: 0 0 25px rgba(255, 255, 255, 0.4);
        }

        .event-card h3 {
            margin-bottom: 10px;
            font-size: 1.6rem;
            color: #fff;
        }

        .event-card p {
            margin: 4px 0;
            font-size: 1rem;
        }

        .btn {
            margin-top: 10px;
            width: 100%;
            font-weight: bold;
            padding: 10px;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .bg1 { background: linear-gradient(135deg, #667eea, #764ba2); }
        .bg2 { background: linear-gradient(135deg, #ff9966, #ff5e62); }
        .bg3 { background: linear-gradient(135deg, #56ab2f, #a8e063); }
        .bg4 { background: linear-gradient(135deg, #2193b0, #6dd5ed); }
        .bg5 { background: linear-gradient(135deg, #f7971e, #ffd200); }
        .bg6 { background: linear-gradient(135deg, #43cea2, #185a9d); }

        .title {
            text-align: center;
            margin-top: 30px;
            font-size: 2.5rem;
            font-weight: bold;
            color: #f1f1f1;
            text-shadow: 0 0 10px #000;
        }

        .back-btn {
            display: block;
            margin: 0 auto 20px auto;
            width: fit-content;
            padding: 10px 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="title">Available Events</h1>

    <a href="/" class="btn btn-light back-btn">&larr; Back to Home</a>

    <div class="event-container">
        <c:forEach var="event" items="${eventList}">
            <div class="event-card ${event.bgClass}">
                <h3>${event.name}</h3>
                <p>${event.description}</p>
                <p><strong>Date:</strong> ${event.date}</p>

                <c:choose>
                    <c:when test="${registeredEventIds.contains(event.id)}">
                        <button disabled class="btn btn-success">Registered</button>
                    </c:when>
                    <c:otherwise>
                        <a href="/register?eventId=${event.id}&userId=${userId}" class="btn btn-primary">Register</a>
                    </c:otherwise>
                </c:choose>

<a href="/viewdetails?eventId=${event.id}&userId=1" class="btn btn-outline-secondary">View</a>

            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
