<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    footer {
        width: 100%;
        background: linear-gradient(to right, #f0f0f0, #e0e0e0);
        color: #333;
        padding: 30px 0 15px;
        font-size: 14px;
        border-top-left-radius: 60px;
        box-shadow: 0 -2px 10px rgba(0,0,0,0.1);
    }

    .row1 {
        width: 90%;
        margin: auto;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .col1 {
        flex: 1 1 200px;
        margin: 10px;
    }

    .logo {
        width: 50px;
        margin-bottom: 10px;
    }

    .col1 h1 {
        font-size: 20px;
        color: #222;
        margin: 10px 0;
    }

    .col1 h3 {
        margin-bottom: 15px;
        color: #555;
    }

    .col1 p,
    .col1 h4 {
        margin: 6px 0;
        color: #666;
    }

    ul {
        padding: 0;
    }

    ul li {
        list-style: none;
        margin-bottom: 8px;
    }

    ul li a {
        text-decoration: none;
        color: #444;
        transition: all 0.3s;
    }

    ul li a:hover {
        color: #ec1d23;
        text-decoration: underline;
    }

    .social-icons img {
        margin-right: 10px;
        transition: transform 0.3s ease, filter 0.3s ease;
        filter: grayscale(100%);
    }

    .social-icons img:hover {
        transform: scale(1.1);
        filter: grayscale(0%);
    }

    @media (max-width: 768px) {
        .row1 {
            flex-direction: column;
            align-items: center;
        }

        .col1 {
            text-align: center;
        }

        .social-icons img {
            margin: 5px;
        }
        img{
        height:180px;
        width:auto;
        }
    }
</style>
</head>
<body>
<footer>
    <div class="row1">
        <div class="col1">
            <img src="imgs/home7.png" class="logo" alt="Logo">
            <h1>Colombo</h1>
        </div>
        <div class="col1">
            <h3>Office</h3>
            <p>The SFM Center, Colombo</p>
            <p>No.64, Lotus Road, Colombo 01</p>
            <p>Sri Lanka</p>
            <p>Email: <strong>SFM@gmail.com</strong></p>
            <h4>Phone: +94-753585268</h4>
        </div>
        <div class="col1">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="#">🏠 Home</a></li>
                <li><a href="#">ℹ️ About</a></li>
                <li><a href="#">🛠 Services</a></li>
                <li><a href="#">📞 Contact Us</a></li>
            </ul>
        </div>
        <div class="col1">
            <h3>Follow Us</h3>
            <div class="social-icons">
                <img src="imgs/fa.png" alt="Facebook" width="30" height="30">
                <img src="imgs/yo.png" alt="YouTube" width="30" height="30">
                <img src="imgs/twit.png" alt="Twitter" width="30" height="30">
                <img src="imgs/link.png" alt="LinkedIn" width="30" height="30">
                <img src="imgs/web.png" alt="Web" width="30" height="30">
            </div>
        </div>
    </div>
</footer>
</body>
</html>
