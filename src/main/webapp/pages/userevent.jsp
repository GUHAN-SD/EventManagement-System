<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User | View Events</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background: #f0f8ff;
      font-family: 'Segoe UI', sans-serif;
    }

    .container-main {
      max-width: 1200px;
      margin: 40px auto;
      padding: 0 20px;
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      font-size: 2rem;
      animation: fadeInDown 1s ease;
    }

    .event-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
      gap: 20px;
    }

    .event-card {
      border-radius: 12px;
      padding: 20px;
      background: var(--card-bg, #ffffff);
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
      transition: transform 0.3s ease;
      animation: fadeInUp 0.6s ease;
    }

    .event-card:hover {
      transform: translateY(-5px);
    }

    .event-card h5 {
      margin-bottom: 12px;
      font-weight: 600;
    }

    .event-card p {
      margin: 6px 0;
      font-size: 0.95rem;
      color: #333;
    }

    .register-btn {
      display: block;
      margin: 20px auto;
      padding: 10px 25px;
      font-size: 1rem;
      background-color: #0d6efd;
      color: white;
      border: none;
      border-radius: 8px;
      transition: background 0.3s ease;
      text-align: center;
      text-decoration: none;
    }

    .register-btn:hover {
      background-color: #0b5ed7;
    }

    @keyframes fadeInDown {
      0% { transform: translateY(-20px); opacity: 0; }
      100% { transform: translateY(0); opacity: 1; }
    }

    @keyframes fadeInUp {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .bg1 { --card-bg: #fce4ec; }
    .bg2 { --card-bg: #e3f2fd; }
    .bg3 { --card-bg: #e8f5e9; }
    .bg4 { --card-bg: #fff8e1; }
    .bg5 { --card-bg: #f3e5f5; }
    .bg6 { --card-bg: #f9fbe7; }
  </style>
</head>
<body>

<div class="container-main">
  <h2>Upcoming Events</h2>
  <div class="event-grid">
    <c:forEach var="event" items="${eventList}">
      <div class="event-card ${event.bgClass}">
        <h5>${event.title}</h5>
        <p><strong>Date:</strong> ${event.date}</p>
        <p><strong>Time:</strong> ${event.time}</p>
        <p><strong>Place:</strong> ${event.place}</p>
      </div>
    </c:forEach>
  </div>

  <!-- Register Button -->
  <a href="/user/register" class="register-btn">Register</a>
</div>

</body>
</html>
