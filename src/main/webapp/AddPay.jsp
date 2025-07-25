<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Fuel</title>
<style>
        /* Container for the image */
        .fuel {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 50px;
        }

        /* Responsive image */
        .fuel img {
            max-width: 100%;
            height: 400px;
            border: 2px solid #ccc;
            border-radius: 8px;
        }

        /* Container for the buttons */
        .buttons {
            display: flex;
            justify-content: center;
            margin-top: 30px;
            gap: 20px;
            flex-wrap: wrap;
        }

        /* Styled buttons */
        .buttons button {
            background-color: red;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            min-width: 200px;
        }

        /* View Payments button style */
        .buttons button.view-payments {
            background-color: #4CAF50;
        }

        /* Hover effect for the buttons */
        .buttons button:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .buttons button.add-payment:hover {
            background-color: darkred;
        }

        .buttons button.view-payments:hover {
            background-color: #45a049;
        }

        /* Responsive adjustments */
        @media (max-width: 600px) {
            .fuel img {
                width: 80%;
            }

            .buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .buttons button {
                width: 80%;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
 <%@ include file="header.jsp" %>
 <br><br>
	<div class="fuel">
		<img src="${pageContext.request.contextPath}/imgs/Fuel.jpeg" alt="Fuel">
	</div>
	<div class="buttons">
		<button class="add-payment" onclick="window.location.href='AddFuelPay.jsp'">Add Your Payment</button>
		<button class="view-payments" onclick="window.location.href='DataTable.jsp'">View Payments</button>
	</div>
	 <br><br>
	 <%@ include file="footer.jsp" %>
</body>
</html>