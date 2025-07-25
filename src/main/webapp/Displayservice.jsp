<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Service Table</title>
    <link rel="icon" href="imgs/admin1.jpg">
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        background-image: url('imgs/home10.jpg');
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        min-height: 100vh;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .table-container {
            width: 90%;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 32px;
            font-weight: 600;
        }

        #searchInput {
            display: block;
            margin: 0 auto 20px auto;
            padding: 10px;
            width: 300px;
            border-radius: 5px;
            border: 1px solid #aaa;
            font-size: 14px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #ec1d23;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .btn-update {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-update:hover {
            background-color: #218838;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        form {
            display: inline;
        }

        .footer {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 10px;
            text-align: center;
            width: 100%;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="main-content">
    <div class="table-container">
        <h2>Service Records</h2>

        <!-- Search Bar -->
        <input type="text" id="searchInput" placeholder="Search..." onkeyup="filterTable()" />

        <table>
            <tr>
                <th>Service ID</th>
                <th>Service Type</th>
                <th>Description</th>
                <th>Date</th>
                <th>Cost</th>
                <th>Center</th>
                <th>Actions</th>
            </tr>

            <c:forEach var="service" items="${allservice}">
                <tr>
                    <td>${service.service_id}</td>
                    <td>${service.service_type}</td>
                    <td>${service.service_description}</td>
                    <td>${service.service_date}</td>
                    <td>${service.service_cost}</td>
                    <td>${service.service_center}</td>
                    <td>
                        <div class="action-buttons">
                            <a href="Updateservice.jsp?service_id=${service.service_id}&service_type=${service.service_type}&service_description=${service.service_description}&service_date=${service.service_date}&service_cost=${service.service_cost}&service_center=${service.service_center}">
                                <button type="button" class="btn-update">Update</button>
                            </a>
                            <form action="DeleteServlet1" method="post">
                                <input type="hidden" name="service_id" value="${service.service_id}" />
                                <button type="submit" class="btn-delete" onclick="return confirm('Are you sure you want to delete this entry?');">Delete</button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script>
    function filterTable() {
        var input, filter, table, tr, td, i, j, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.querySelector("table");
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td");
            let match = false;
            for (j = 0; j < td.length; j++) {
                if (td[j]) {
                    txtValue = td[j].textContent || td[j].innerText;
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
