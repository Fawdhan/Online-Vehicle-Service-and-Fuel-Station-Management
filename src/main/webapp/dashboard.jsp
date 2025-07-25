<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Vehicle Management System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('images/Car.jpg'); /* Background image */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
        }

        .wrapper {
            display: flex;
        }

        /* Sidebar styling */
        .sidebar {
            min-height: 100vh;
            width: 250px;
            background-color: rgba(255, 255, 255, 0.9); /* White with transparency */
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar h2 {
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .sidebar a {
            display: block;
            padding: 10px;
            margin-bottom: 10px;
            font-size: 16px;
            color: #333;
            text-decoration: none;
            border-radius: 5px;
        }

        .sidebar a:hover {
            background-color: #f0f0f0;
        }

        /* Main content styling */
        .content {
            flex-grow: 1;
            padding: 40px;
            color: white;
        }

        .content h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .footer {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 10px;
            text-align: center;
            position: relative;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>

<div class="wrapper">
    <!-- Sidebar for navigation -->
    <div class="sidebar">
        <h2>Admin Dashboard</h2>
        <a href="InsertService.jsp">Manage Services</a>
        <a href="AddFuel.jsp">Manage Fuel</a>
        <a href="AddFuelPay.jsp">Manage Payments</a>
        <a href="dashboard.jsp">Dashboard</a>
    </div>

    <!-- Main content area -->
    <div class="content">
        <h1>Welcome, Admin</h1>
        <p>This is your dashboard where you can manage vehicle services, fuel, payments, and feedback.</p>
        <p>Select an option from the sidebar to manage various sections of the Vehicle Management System.</p>
    </div>
</div>

<div class="footer">
    <p>&copy; 2024 Vehicle Management System. All rights reserved.</p>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>