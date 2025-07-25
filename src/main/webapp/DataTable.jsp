<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Fuel.Payment" %>
<%@ page import="com.Fuel.FuelDButil" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fuel Payments</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s;
            margin: 2px;
        }

        .btn-edit {
            background-color: #FFC107;
            color: #212529;
        }

        .btn-delete {
            background-color: #DC3545;
            color: white;
        }

        .btn-pay {
            background-color: #28A745;
            color: white;
        }

        .btn:hover {
            opacity: 0.8;
            transform: translateY(-2px);
        }

        .action-buttons {
            display: flex;
            justify-content: center;
        }

        .back-btn {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            width: 150px;
            transition: all 0.3s;
        }

        .back-btn:hover {
            background-color: #5a6268;
            transform: translateY(-2px);
        }

        .dataTables_wrapper {
            margin-top: 20px;
        }

        table.dataTable thead th {
            background-color: #343a40;
            color: white;
        }
    </style>
</head>
<body>
 <%@ include file="header.jsp" %><br><br>
 
    <div class="container">
        <h1>Fuel Payment Records</h1>

        <table id="paymentsTable" class="display" style="width:100%">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Fuel Type</th>
                    <th>Volume (L)</th>
                    <th>Price (LKR)</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Payment> payments = FuelDButil.getAllPayments();
                    for (Payment payment : payments) {
                %>
                <tr>
                    <td><%= payment.getId() %></td>
                    <td><%= payment.getFullname() %></td>
                    <td><%= payment.getEmail() %></td>
                    <td><%= payment.getContact() %></td>
                    <td><%= payment.getAddress() %></td>
                    <td><%= payment.getFuelType() %></td>
                    <td><%= payment.getVolume() %></td>
                    <td><%= String.format("%.2f", Double.parseDouble(payment.getPrice())) %></td>
                    <td class="action-buttons">
                        <a href="EditForm.jsp?id=<%= payment.getId() %>" class="btn btn-edit">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <a href="DeletePayment?id=<%= payment.getId() %>" class="btn btn-delete" onclick="return confirm('Are you sure you want to delete this record?')">
                            <i class="fas fa-trash-alt"></i> Delete
                        </a>
                        <a href="Order.jsp" class="btn btn-pay">
                            <i class="fas fa-money-bill-wave"></i> Pay
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <a href="AddPay.jsp" class="back-btn">
            <i class="fas fa-arrow-left"></i> Back to Home
        </a>
    </div><br><br>
 <%@ include file="footer.jsp" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#paymentsTable').DataTable({
                responsive: true,
                "order": [[0, "desc"]]
            });
        });
    </script>
</body>
</html>
