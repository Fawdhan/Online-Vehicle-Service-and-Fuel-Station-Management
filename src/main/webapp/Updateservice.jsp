<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>UPDATE SERVICE</title>
    <link rel="icon" href="imgs/admin1.jpg">
    <style>
     

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
            margin:20px;
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

        input, textarea {
            width: 100%;
            font-size: 1.1em;
            border-radius: 5px;
            padding: 10px;
            border: none;
            background-color: #fbf3f3;
            font-family: 'Orbitron', sans-serif;
        }

        textarea {
            resize: none;
        }

        

        .input-group .error {
            color: rgb(242, 18, 18);
            font-size: 14px;
            margin-top: 4px;
        }

        .button-group {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .but10 {
            width: 150px;
            height: 45px;
            background-color: #28a745;
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
    </style>
</head>
<body>
     <%@ include file="header.jsp" %>
    <div class="container">
        <form action="UpdateServlet1" method="post" id="form">
            <h1>UPDATE SERVICE</h1>
            <hr style="width: 200px; height: 3px; background-color: #ec1d23; border: none; margin: 0 auto;">
            <br>

            <input type="hidden" name="service_id" value="${param.service_id}">

            <div class="input-group">
                <label>SERVICE TYPE:</label>
                <input type="text" name="service_type" id="sname" value="${param.service_type}">
                <div class="error"></div>
            </div>

            <div class="input-group">
                <label>SERVICE DESCRIPTION:</label>
                <textarea name="service_description" rows="4" required>${param.service_description}</textarea>
                <div class="error"></div>
            </div>

            <div class="input-group">
                <label>SERVICE DATE:</label>
                <input type="date" name="service_date" id="sdate" value="${param.service_date}">
                <div class="error"></div>
            </div>

            <div class="input-group">
                <label>SERVICE COST:</label>
                <input type="number" name="service_cost" id="price" value="${param.service_cost}" step="0.01">
                <div class="error"></div>
            </div>

            <div class="input-group">
                <label>SERVICE CENTER:</label>
                <input type="text" name="service_center" value="${param.service_center}">
                <div class="error"></div>
            </div>

            <div class="button-group">
                <input type="submit" value="Update" class="but10">
            </div>
        </form>
    </div>

        <%@ include file="footer.jsp" %>
   

  
  
    <script>
    function alert2() {
        alert("Try again");
    }

    const form = document.getElementById('form');
    const sname = document.getElementById('sname');
    const price = document.getElementById('price');
    const sdate = document.getElementById('sdate');

    
    sname.addEventListener('input', validateName);
    price.addEventListener('input', validatePrice);
    sdate.addEventListener('input', validateDate);

    
    form.addEventListener('submit', function (e) {
        e.preventDefault();

        
        const isNameValid = validateName();
        const isPriceValid = validatePrice();
        const isDateValid = validateDate();

        
        if (isNameValid && isPriceValid && isDateValid) {
            form.submit();
        }
    });

    
    function validateName() {
        const name = sname.value.trim();
        if (name === '') {
            showError(sname, 'Service name is required');
            return false;
        } else {
            clearError(sname);
            return true;
        }
    }

    function validatePrice() {
        const value = price.value.trim();
        const number = parseFloat(value);
        if (value === '') {
            showError(price, 'Price is required');
            return false;
        } else if (isNaN(number) || number < 0) {
            showError(price, 'Price cannot be negative');
            return false;
        } else {
            clearError(price);
            return true;
        }
    }

    function validateDate() {
        const date = sdate.value.trim();
        const today = new Date().toISOString().split('T')[0];
        if (date === '') {
            showError(sdate, 'Date is required');
            return false;
        } else if (date < today) {
            showError(sdate, 'Date cannot be in the past');
            return false;
        } else {
            clearError(sdate);
            return true;
        }
    }

   
    function showError(input, message) {
        const errorBox = input.nextElementSibling;
        errorBox.innerText = message;
        input.classList.add('error');
    }

    function clearError(input) {
        const errorBox = input.nextElementSibling;
        errorBox.innerText = '';
        input.classList.remove('error');
    }
    </script>

   
</body>
</html>
