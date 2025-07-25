<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fuel Table</title>
    <link rel="stylesheet" type="text/css" href="DisplayFuel.css">
    <style>
        body {
            background-image: url('imgs/fuel.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
            color: white;
        }

        #searchInput {
            display: block;
            margin: 20px auto;
            padding: 10px;
            width: 300px;
            border-radius: 5px;
            border: 1px solid #aaa;
            font-size: 14px;
        }

        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: white;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #333;
            color: white;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .action-buttons form,
        .action-buttons a {
            margin: 0;
        }

        .action-buttons button {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .action-buttons button:hover {
            opacity: 0.85;
        }

        .action-buttons button:last-child {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <header>
        <h1 style="text-align:center; color:white;">Fuel Station Management</h1>
    </header>

    <h2>Fuel Table</h2>

    <!-- 🔍 Search Bar -->
    <input type="text" id="searchInput" placeholder="Search..." onkeyup="filterTable()" />

    <table>
        <tr>
            <th>Fuel ID</th>
            <th>Fuel Type</th>
            <th>Quantity (Liters)</th>
            <th>Price per Liter</th>
            <th>Total Price</th>
            <th>Supplier Name</th>
            <th>Added Date</th>
            <th>Action</th>
        </tr>

        <c:forEach var="fuel" items="${allfuel}">
            <tr>
                <td>${fuel.fuel_id}</td>
                <td>${fuel.fuel_type}</td>
                <td>${fuel.quantity_liters}</td>
                <td>${fuel.price_per_liter}</td>
                <td>${fuel.total_price}</td>
                <td>${fuel.supplier_name}</td>
                <td>${fuel.added_date}</td>
                <td>
                    <div class="action-buttons">
                        <a href="Update.jsp?fuel_id=${fuel.fuel_id}&fuel_type=${fuel.fuel_type}&quantity_liters=${fuel.quantity_liters}&price_per_liter=${fuel.price_per_liter}&total_price=${fuel.total_price}&supplier_name=${fuel.supplier_name}&added_date=${fuel.added_date}">
                            <button type="button" style="background-color: #007bff; color: white;">Update</button>
                        </a>
                        <form action="DeleteServlet" method="post" style="display:inline;">
                            <input type="hidden" name="fuel_id" value="${fuel.fuel_id}" />
                            <button type="submit" onclick="return confirm('Are you sure you want to delete this fuel entry?');">Delete</button>
                        </form>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>

    <%@ include file="footer.jsp" %>

    <script>
        function filterTable() {
            var input = document.getElementById("searchInput");
            var filter = input.value.toUpperCase();
            var table = document.querySelector("table");
            var tr = table.getElementsByTagName("tr");

            for (var i = 1; i < tr.length; i++) {
                var td = tr[i].getElementsByTagName("td");
                var match = false;

                for (var j = 0; j < td.length; j++) {
                    if (td[j]) {
                        var txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            match = true;
                            break;
                        }
                    }
                }

                tr[i].style.display = match ? "" : "none";
            }
        }
    </script>
</body>
</html>
