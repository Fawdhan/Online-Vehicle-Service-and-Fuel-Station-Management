<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>UPDATE FUEL ENTRY</title>
    <link rel="icon" href="imgs/fuel.jpg">
    <style>
       * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        background-image: url('imgs/fuel.jpg');
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        min-height: 100vh;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .container {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #form {
        width: 100%;
        max-width: 500px;
        background-color: rgba(0, 0, 0, 0.75);
        color: white;
        padding: 60px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
        margin: 20px;
    }

    h1 {
        text-align: center;
        margin-bottom: 24px;
        font-family: Georgia, serif;
        font-size: 28px;
    }

    .input-group {
        display: flex;
        flex-direction: column;
        margin-bottom: 20px;
    }

    .input-group label {
        margin-bottom: 8px;
        font-weight: bold;
    }

    input {
        width: 100%;
        font-size: 1.1em;
        border-radius: 5px;
        padding: 10px;
        border: none;
        background-color: #fbf3f3;
        font-family: 'Orbitron', sans-serif;
    }

    .button-group {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .but10 {
        width: 150px;
        height: 45px;
        background-color: #ec1d23;
        border: none;
        font-size: 16px;
        border-radius: 10px;
        color: white;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .but10:hover {
        background-color: black;
    }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<%
    String fuel_id = request.getParameter("fuel_id");
    String fuel_type = request.getParameter("fuel_type");
    String quantity = request.getParameter("quantity_liters");
    String price = request.getParameter("price_per_liter");
    String supplier_name = request.getParameter("supplier_name");
    String added_date = request.getParameter("added_date");
%>

<div class="container">
    <form action="UpdateServlet" method="post" id="form" onsubmit="return validateForm()">
        <h1>UPDATE FUEL ENTRY</h1>
        <hr style="width: 200px; height: 3px; background-color: #ec1d23; border: none; margin: 0 auto;">
        <br>

        <input type="hidden" name="fuel_id" value="<%= fuel_id %>">

        <div class="input-group">
            <label for="fuelType">FUEL TYPE:</label>
            <input type="text" id="fuelType" name="fuel_type" value="<%= fuel_type %>" required pattern="^[A-Za-z0-9\s\-]+$" title="Can contain letters, numbers, spaces, and hyphens">
        </div>

        <div class="input-group">
            <label for="quantity">QUANTITY (LITERS):</label>
            <input type="number" id="quantity" name="quantity_liters" value="<%= quantity %>" min="1" required>
        </div>

        <div class="input-group">
            <label for="price">PRICE PER LITER:</label>
            <input type="number" id="price" name="price_per_liter" value="<%= price %>" step="0.01" min="0.01" max="1500" required>
        </div>

        <div class="input-group">
            <label for="supplier">SUPPLIER NAME:</label>
            <input type="text" id="supplier" name="supplier_name" value="<%= supplier_name %>" required pattern="^[A-Za-z\s]+$" title="Only letters and spaces allowed">
        </div>

        <div class="input-group">
            <label for="addedDate">ADDED DATE:</label>
            <input type="date" id="addedDate" name="added_date" value="<%= added_date %>" required>
        </div>

        <div class="button-group">
            <input type="submit" value="Update Fuel" class="but10">
        </div>
    </form>
</div>

<%@ include file="footer.jsp" %>

<!-- ✅ SIMPLE VALIDATION SCRIPT WITH ALERT BOXES -->
<script>
function validateForm() {
    const fuelType = document.getElementById("fuelType").value.trim();
    const quantity = parseFloat(document.getElementById("quantity").value.trim());
    const price = parseFloat(document.getElementById("price").value.trim());
    const supplier = document.getElementById("supplier").value.trim();
    const addedDate = document.getElementById("addedDate").value;

    const today = new Date().toISOString().split('T')[0];

    if (fuelType === "") {
        alert("Please enter the fuel type.");
        return false;
    }

    if (isNaN(quantity) || quantity <= 0) {
        alert("Quantity must be greater than 0.");
        return false;
    }

    if (isNaN(price) || price <= 0 || price > 1500) {
        alert("Price must be between 0 and 1500.");
        return false;
    }

    if (supplier === "") {
        alert("Please enter the supplier name.");
        return false;
    }

    if (addedDate === "") {
        alert("Please select the added date.");
        return false;
    }

    if (addedDate > today) {
        alert("Added date cannot be in the future.");
        return false;
    }

    return true;
}
</script>

</body>
</html>
