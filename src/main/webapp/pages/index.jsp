<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User & Admin</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      margin: 0;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(-45deg, #9d50bb, #6e48aa, #b79891, #8e44ad);
      background-size: 400% 400%;
      animation: violetGradient 12s ease infinite;
    }

    @keyframes violetGradient {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    .box-container {
      display: flex;
      gap: 40px;
      flex-wrap: wrap;
      justify-content: center;
    }

    .box {
      width: 250px;
      height: 250px;
      border-radius: 20px;
      color: white;
      font-size: 2rem;
      font-weight: bold;
      display: flex;
      justify-content: center;
      align-items: center;
      cursor: pointer;
      text-decoration: none;
      transition: transform 0.4s ease, box-shadow 0.4s ease;
      backdrop-filter: blur(12px);
      background: rgba(255, 255, 255, 0.08);
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    }

    .box:hover {
      transform: translateY(-8px) scale(1.04);
    }

    .box-user {
      border: 2px solid #a29bfe;
    }

    .box-user:hover {
      box-shadow: 0 0 30px #a29bfe;
    }

    .box-admin {
      border: 2px solid #e84393;
    }

    .box-admin:hover {
      box-shadow: 0 0 30px #e84393;
    }
  </style>
</head>
<body>
  <div class="box-container">

    <a href="/userview" class="box box-user">User</a>
    <a href="/admin" class="box box-admin">Admin</a>
  

  </div>
</body>
</html>
