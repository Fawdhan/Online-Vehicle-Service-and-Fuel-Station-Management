<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        min-height: 100vh;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    nav {
        padding: 20px 60px;
        background: rgba(255, 255, 255, 0.95);
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        position: sticky;
        top: 0;
        z-index: 1000;
        border-bottom: 2px solid #ec1d23;
    }

    .img1 {
        width: 180px;
        height: auto;
    }

    .nav-links {
        display: flex;
        gap: 25px;
        list-style: none;
        font-weight: 600;
        font-size: 18px;
    }

    .nav-links li {
        cursor: pointer;
        transition: color 0.3s ease, transform 0.3s ease;
        position: relative;
    }

    .nav-links li:hover {
        color: #ec1d23;
        transform: translateY(-2px);
    }

    .nav-links li::after {
        content: '';
        display: block;
        width: 0;
        height: 2px;
        background: #ec1d23;
        transition: width 0.3s;
        margin-top: 4px;
    }

    .nav-links li:hover::after {
        width: 100%;
    }

    .but1 {
        background-color: #ec1d23;
        border: none;
        padding: 12px 28px;
        font-size: 16px;
        border-radius: 30px;
        font-weight: 600;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
        box-shadow: 0 4px 12px rgba(236, 29, 35, 0.4);
    }

    .but1:hover {
        background-color: black;
        transform: scale(1.05);
    }

    @media (max-width: 768px) {
        nav {
            flex-direction: column;
            align-items: flex-start;
            padding: 15px 30px;
        }

        .nav-links {
            flex-direction: column;
            width: 100%;
            gap: 15px;
            margin-top: 15px;
        }

        .but1 {
            align-self: center;
            margin-top: 10px;
        }
    }
</style>
</head>
<body>

    <div class="header">
        <nav>
            <img src="imgs/home7.png" alt="Logo" class="img1">
            <ul class="nav-links">
                <li onclick= "location.href='home.jsp'">HOME</li>
                <li>ABOUT US</li>
                <li>SERVICES</li>
                <li>CONTACT US</li>
            </ul>
            <button onclick="location.href='PaymentAdminLogin.jsp'" class="but1">SIGN IN ></button>
        </nav>
    </div>

</body>
</html>
