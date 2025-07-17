<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User | Events</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            overflow-x: hidden;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1c1c2b, #1a1a40, #0f0f2e);
            background-size: 300% 300%;
            animation: bgAnimation 15s ease infinite;
        }

        @keyframes bgAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
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
            background: rgba(255, 255, 255, 0.05);
            box-shadow: 0 0 25px rgba(255, 255, 255, 0.08), 0 0 15px rgba(255, 255, 255, 0.04) inset;
            backdrop-filter: blur(5px);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .event-card:hover {
            transform: translateY(-5px) scale(1.03);
            box-shadow: 0 0 30px rgba(255, 255, 255, 0.2), 0 0 20px rgba(255, 255, 255, 0.1) inset;
        }

        .event-card h3 {
            margin-bottom: 10px;
            font-size: 1.6rem;
            color: #ffd700;
        }

        .event-card p {
            margin: 4px 0;
            font-size: 1rem;
        }

        .register-btn {
            margin-top: 15px;
            width: 100%;
            font-weight: bold;
            border: none;
            padding: 10px;
            border-radius: 10px;
            transition: background 0.3s;
            text-align: center;
            display: inline-block;
        }

        .register-btn:hover {
            background-color: #fff;
            color: #000;
        }

        .registered {
            background-color: #28a745;
            color: white;
            cursor: default;
            box-shadow: 0 0 10px #28a745;
        }

        .not-registered {
            background-color: #ffc107;
            color: black;
            box-shadow: 0 0 10px #ffc107;
        }

        .event-card::before {
            content: "";
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            z-index: -1;
            background: linear-gradient(45deg, #ff6ec4, #7873f5, #4ADEDE, #C850C0);
            background-size: 600% 600%;
            animation: glowing-border 8s ease infinite;
            border-radius: 20px;
            filter: blur(5px);
        }

        @keyframes glowing-border {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

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
    <h1 class="title">🌌 User Available Events</h1>

    <a href="/" class="btn btn-light back-btn">← Back to Home</a>

    <div class="event-container">
        <c:forEach var="event" items="${eventList}">
            <div class="event-card">
                <h3>${event.title}</h3>
                <p><strong>Date:</strong> ${event.date}</p>
                <p><strong>Time:</strong> ${event.time}</p>
                <p><strong>Place:</strong> ${event.place}</p>

                <c:choose>
                    <c:when test="${registeredEventIds.contains(event.id)}">
                        <button class="register-btn registered" disabled>✓ Registered</button>
                    </c:when>
                    <c:otherwise>
<a href="/register?eventId=${event.id}" class="btn btn-primary">Register</a>

                    </c:otherwise>
                </c:choose>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
