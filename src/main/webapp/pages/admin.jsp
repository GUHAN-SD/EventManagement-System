<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin | Event Manager</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    body {
      background: linear-gradient(135deg, #8e2de2, #4a00e0, #00c9ff, #92fe9d);
      background-size: 400% 400%;
      animation: gradientMove 15s ease infinite;
      font-family: 'Segoe UI', sans-serif;
    }

    @keyframes gradientMove {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    .container-main {
      max-width: 1200px;
      margin: 40px auto;
      padding: 0 20px;
      color: #fff;
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      font-size: 2rem;
      animation: fadeInDown 1s ease;
      color: #ffeb3b;
      text-shadow: 1px 1px 8px rgba(0,0,0,0.3);
    }

    .event-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
      gap: 20px;
    }

    .event-card {
      border-radius: 15px;
      padding: 20px;
      background-color: rgba(255, 255, 255, 0.9);
      color: #333;
      box-shadow: 0 5px 20px rgba(0,0,0,0.2);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      animation: fadeInUp 0.5s ease;
    }

    .event-card:hover {
      transform: translateY(-6px);
      box-shadow: 0 8px 24px rgba(0,0,0,0.3);
    }

    .event-card h5 {
      margin-bottom: 12px;
      font-weight: bold;
      font-size: 1.2rem;
    }

    .event-card p {
      margin: 6px 0;
      font-size: 0.95rem;
    }

    .btn-row {
      margin-top: 15px;
    }

    .btn {
      padding: 6px 15px;
      font-size: 0.85rem;
      border-radius: 6px;
      margin-right: 10px;
    }

    .btn-delete { background-color: #dc3545; color: white; border: none; }
    .btn-update { background-color: #198754; color: white; border: none; }
    .btn-view   { background-color: #0d6efd; color: white; border: none; }

    .add-event-card {
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 2rem;
      color: #0d6efd;
      border: 2px dashed #0d6efd;
      cursor: pointer;
      transition: background 0.3s ease;
      background-color: rgba(255,255,255,0.6);
    }

    .add-event-card:hover {
      background-color: rgba(13,110,253,0.15);
    }

    .input-group {
      margin-bottom: 10px;
    }

    .form-control {
      font-size: 0.9rem;
    }

    #addEventForm {
      flex-direction: column;
      justify-content: center;
    }

    @keyframes fadeInDown {
      0% { transform: translateY(-20px); opacity: 0; }
      100% { transform: translateY(0); opacity: 1; }
    }

    @keyframes fadeInUp {
      from { opacity: 0; transform: translateY(20px); }
      to   { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>
<div class="container-main">
  <h2>Admin Event Manager</h2>

  <div class="event-grid" id="eventGrid">
    <c:forEach var="event" items="${eventList}">
      <div class="event-card">
        <h5>${event.title}</h5>
        <p><strong>Date:</strong> ${event.date}</p>
        <p><strong>Time:</strong> ${event.time}</p>
        <p><strong>Place:</strong> ${event.place}</p>

        <div class="btn-row">
          <form action="/admin/delete" method="post" style="display:inline;">
            <input type="hidden" name="id" value="${event.id}" />
            <button type="submit" class="btn btn-delete">Delete</button>
          </form>

          <button class="btn btn-update" onclick="startEdit(this)">Update</button>
          <button class="btn btn-view" onclick="viewRegistered(${event.id})">View</button>
        </div>
      </div>
    </c:forEach>

    <!-- Add Event Card -->
    <div class="event-card add-event-card" id="plusCard">
      <i class="fas fa-plus"></i>
    </div>

    <!-- Hidden Event Form -->
    <div class="event-card" id="addEventForm" style="display: none;">
      <form id="eventForm" action="/admin/add" method="post">
        <input type="hidden" name="id" id="eventId" />
        <div class="input-group">
          <input type="text" class="form-control" id="eventTitle" name="title" placeholder="Event Title" required>
        </div>
        <div class="input-group d-flex gap-2">
          <input type="date" class="form-control" id="eventDate" name="date" required>
          <input type="time" class="form-control" id="eventTime" name="time" required>
        </div>
        <div class="input-group">
          <input type="text" class="form-control" id="eventPlace" name="place" placeholder="Event Place" required>
        </div>
        <div class="btn-row">
          <button type="submit" class="btn btn-update" id="submitBtn">Add</button>
          <button type="button" class="btn btn-delete" onclick="cancelAdd()">Cancel</button>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
  const plusCard = document.getElementById('plusCard');
  const addForm = document.getElementById('addEventForm');
  const eventForm = document.getElementById('eventForm');
  const submitBtn = document.getElementById('submitBtn');

  plusCard.addEventListener('click', () => {
    resetForm();
    plusCard.style.display = 'none';
    addForm.style.display = 'flex';
  });

  function cancelAdd() {
    resetForm();
    addForm.style.display = 'none';
    plusCard.style.display = 'flex';
  }

  function resetForm() {
    eventForm.reset();
    document.getElementById('eventId').value = '';
    eventForm.action = '/admin/add';
    submitBtn.innerText = 'Add';
  }

  function startEdit(button) {
    const card = button.closest('.event-card');
    const id = card.querySelector('input[name="id"]')?.value || card.dataset.id;
    const title = card.querySelector('h5').innerText;
    const date = card.querySelector('p:nth-of-type(1)').innerText.split(': ')[1];
    const time = card.querySelector('p:nth-of-type(2)').innerText.split(': ')[1];
    const place = card.querySelector('p:nth-of-type(3)').innerText.split(': ')[1];

    document.getElementById('eventId').value = id;
    document.getElementById('eventTitle').value = title;
    document.getElementById('eventDate').value = date;
    document.getElementById('eventTime').value = time;
    document.getElementById('eventPlace').value = place;

    eventForm.action = '/admin/update';
    submitBtn.innerText = 'Update';
    addForm.style.display = 'flex';
    plusCard.style.display = 'none';
  }

  function viewRegistered(eventId) {
    window.location.href = '/admin/registered?eventId=' + eventId;
  }
</script>
</body>
</html>
