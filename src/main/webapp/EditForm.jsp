<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.Fuel.FuelDButil, com.Fuel.Payment" %>
<%
    Payment payment = null;
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        payment = FuelDButil.getPaymentById(id);

        if (payment == null) {
            out.println("<h2 style='color:red; text-align:center;'>No payment found for ID: " + id + "</h2>");
            return;
        }
    } catch (Exception e) {
        out.println("<h2 style='color:red; text-align:center;'>Error: " + e.getMessage() + "</h2>");
        e.printStackTrace();
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Fuel Payment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            max-width: 700px;
            margin: auto;
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        textarea {
            resize: vertical;
        }
        .fuels {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
            flex-wrap: wrap;
        }
        .fuels img {
            width: 150px;
            height: 150px;
            border: 2px solid black;
            border-radius: 8px;
            transition: transform 0.3s, border-color 0.3s;
            cursor: pointer;
        }
        .fuels img:hover {
            transform: scale(1.05);
            border-color: #007bff;
        }
        input[type="submit"] {
            margin-top: 20px;
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .back-btn {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 15px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            text-align: center;
        }
        .back-btn:hover {
            background-color: #5a6268;
        }
        @media (max-width: 600px) {
            .fuels {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>
 <%@ include file="header.jsp" %><br><br>

    <h2>Edit Fuel Payment</h2>
    <form action="UpdatePayment" method="post" id="fuelForm" onsubmit="return validateForm()">
        <input type="hidden" name="id" value="<%= payment.getId() %>">

        <label for="fullname">Full Name:</label>
        <input type="text" id="fullname" name="fullname" value="<%= payment.getFullname() %>" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= payment.getEmail() %>" required>

        <label for="contact">Contact Number:</label>
        <input type="tel" id="contact" name="contact" value="<%= payment.getContact() %>" required>

        <label for="address">Address:</label>
        <textarea id="address" name="address" rows="4" required><%= payment.getAddress() %></textarea>

        <label>Fuel Type:</label>
        <div class="fuels">
            <img src="${pageContext.request.contextPath}/imgs/Petrol92.png" alt="Lanka Petrol Octane 92" onclick="selectFuel(this)" <%= payment.getFuelType().equals("Lanka Petrol Octane 92") ? "style=\"border-color: #007bff; transform: scale(1.05);\"" : "" %>>
            <img src="${pageContext.request.contextPath}/imgs/Petrol95.png" alt="Lanka Petrol Octane 95" onclick="selectFuel(this)" <%= payment.getFuelType().equals("Lanka Petrol Octane 95") ? "style=\"border-color: #007bff; transform: scale(1.05);\"" : "" %>>
            <img src="${pageContext.request.contextPath}/imgs/AutoDiesel.png" alt="Lanka Auto Diesel" onclick="selectFuel(this)" <%= payment.getFuelType().equals("Lanka Auto Diesel") ? "style=\"border-color: #007bff; transform: scale(1.05);\"" : "" %>>
            <img src="${pageContext.request.contextPath}/imgs/SuperDiesel.png" alt="Lanka Super Diesel" onclick="selectFuel(this)" <%= payment.getFuelType().equals("Lanka Super Diesel") ? "style=\"border-color: #007bff; transform: scale(1.05);\"" : "" %>>
        </div>

        <input type="hidden" id="fuelType" name="fuelType" value="<%= payment.getFuelType() %>">

        <label for="volume">Fuel Volume (Liters):</label>
        <input type="number" id="volume" name="volume" step="0.01" min="0" value="<%= payment.getVolume() %>" required oninput="calculatePrice()">

        <label for="price">Total Price (LKR):</label>
        <input type="text" id="price" name="price" value="<%= payment.getPrice() %>" readonly>

        <input type="submit" value="Update Payment">
        <a href="DataTable.jsp" class="back-btn">Cancel</a>
    </form><br><br>
 <%@ include file="footer.jsp" %>
    <script>
        const fuelPrices = {
            "Lanka Petrol Octane 92": 293,
            "Lanka Petrol Octane 95": 341,
            "Lanka Auto Diesel": 274,
            "Lanka Super Diesel": 325
        };

        let selectedFuelPrice = fuelPrices["<%= payment.getFuelType() %>"];

        function selectFuel(img) {
            const fuelType = img.alt;
            document.getElementById('fuelType').value = fuelType;
            selectedFuelPrice = fuelPrices[fuelType];

            const images = document.querySelectorAll('.fuels img');
            images.forEach(image => {
                image.style.borderColor = 'black';
                image.style.transform = 'scale(1)';
            });

            img.style.borderColor = '#007bff';
            img.style.transform = 'scale(1.05)';
            calculatePrice();
        }

        function calculatePrice() {
            const volume = parseFloat(document.getElementById('volume').value);
            if (!isNaN(volume) && selectedFuelPrice > 0) {
                const total = volume * selectedFuelPrice;
                document.getElementById('price').value = total.toFixed(2);
            } else {
                document.getElementById('price').value = '';
            }
        }

        function validateForm() {
            const email = document.getElementById('email').value;
            const contact = document.getElementById('contact').value;
            const fuelType = document.getElementById('fuelType').value;

            const emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
            const contactPattern = /^07\d{8}$/;

            if (!emailPattern.test(email)) {
                alert("Please enter a valid Gmail address.");
                return false;
            }

            if (!contactPattern.test(contact)) {
                alert("Contact number must be 10 digits and start with 07.");
                return false;
            }

            if (!fuelType) {
                alert("Please select a fuel type by clicking on an image.");
                return false;
            }

            return confirm('Are you sure you want to update this payment?');
        }
    </script>
</body>
</html>
