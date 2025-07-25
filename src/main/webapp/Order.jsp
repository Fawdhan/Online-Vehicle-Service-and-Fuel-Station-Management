<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Fuel Payment</title>
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta charset="UTF-8">
        <style>
            *{
                margin: 0px;
                padding: 0px;
                box-sizing: border-box;
                cursor: auto;
            }
            body{
                width: 100%;
                height: 100vh;
                background-color: rgb(32, 31, 31);
            }
            .heading{
                text-align: center;
                color: aliceblue;
            }
            .credit_card{
                height:280px;
                width:450px;
                background-color: black;
                justify-content: center;
                align-items: center;
                margin: auto;
                padding:15px;
                border-radius: 20px;
                border-radius: 0 0 5px rgb(229, 209, 209);
                color: aliceblue;
            }
            .header{
                display: flex;
                justify-content: space-between;
            }
            .master_card{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            img{
                height: 40px;
                border-radius: 7px;
                margin: 10px;
            }
            .content{
                margin: 10px;
            }
            .content input[type="text"]{
                letter-spacing: 3px;
            }
            input[type="text"], input[type="number"]{
                background-color: black;
                color: aliceblue;
                border: none;
                font-size: 20px;
                font-weight: bold;
                width: 100%;
            }
            .footer{
                display: flex;
                justify-content: space-between;
                margin:10px;
            }
            .but button{
                background-color: black;
                color: aliceblue;
                justify-content: center;
                align-items: center;
                margin: auto;
                padding:15px;
                border-radius: 20px;
                border-radius: 0 0 5px rgb(229, 209, 209);
                border: none;
                width:450px;
                display: block;
                font-size: 15px;
                margin-top: 5px;
                cursor: pointer;
            }
            .but button:hover{
                background-color: aliceblue;
                color: black;
            }
            .validity {
                display: flex;
                gap: 10px;
            }
            .validity input {
                width: 50px;
            }
        </style>
    </head>
    <body>
        <br>
        <br>
        <br>
        <br>
        <div class="heading"><h1>Pay Your Amount</h1></div>
        <br>
        <br>
        <div class="credit_card">
            <br>
            <div class="header">
                <div class="master_card">
                    <img src="${pageContext.request.contextPath}/imgs/symbol.jpg" alt="symbol">
                    <h2>Master Card</h2>
                </div>
                <img src="${pageContext.request.contextPath}/imgs/chip.jpg" alt="chip">
            </div>
            <br>
            <div class="content">
                <h3>Card Number</h3>
                <input type="text" id="cardNumber" placeholder="8050 5040 2030 3020" 
                       maxlength="16" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
            </div>
            <br>
            <div class="footer">
                <div class="chips_code">
                    <h3>CVV Code</h3>
                    <input type="number" id="cvv" placeholder="714" maxlength="3">
                </div>
                <div class="validity">
                    <h3>Validity</h3>
                </div>
            </div>
        </div>
        <div class="but">
            <button onclick="validatePayment()">Proceed Your Payment</button>
        </div>

        <script>
            function validatePayment() {
                const cardNumber = document.getElementById('cardNumber').value;
                const cvv = document.getElementById('cvv').value;
                
                // Check if card number has 16 digits and CVV has 3 digits
                if (cardNumber.length === 16 && cvv.length === 3) {
                    alert("Your Payment is Successful!");
                    window.location.href = "AddPay.jsp";
                } else {
                    alert("Please enter a valid 16-digit card number and 3-digit CVV");
                }
            }
        </script>
    </body>
</html>