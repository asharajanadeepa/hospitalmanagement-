<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign In</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet" />
    <style>
    *,
*:before,
*:after {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

body {
    background: linear-gradient(135deg, #0d0325, #1a0a3f);
    font-family: 'Poppins', sans-serif;
    color: #ffffff;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    overflow: hidden;
}

.ri-heart-pulse-fill {
    margin-right: 10px;
    color: #ff2d55;
}

.background {
    width: 650px;
    height: 400px;
    position: absolute;
    transform: translate(-50%, -50%);
    left: 50%;
    top: 50%;
}

.background .shape {
    height: 200px;
    width: 200px;
    position: absolute;
    border-radius: 50%;
    filter: blur(30px);
}

.shape:first-child {
    background: linear-gradient(135deg, #651675, #6d23f6);
    left: -80px;
    top: -80px;
}

.shape:nth-child(2) {
    background: linear-gradient(135deg, #6d2011, #ff9500);
    right: -60px;
    bottom: -100px;
}

i, span {
    color: #ffffff;
    font-size: 45px;
    display: flex;
    justify-content: center;
    font-weight: 500;
    align-items: center;
}

.container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px;
}

form {
    width: 600px;
    height: auto;
    background: rgba(255, 255, 255, 0.1);
    position: absolute;
    transform: translate(-50%, -50%);
    top: 50%;
    left: 50%;
    border-radius: 15px;
    backdrop-filter: blur(15px);
    border: 2px solid rgba(255, 255, 255, 0.2);
    box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
    padding: 30px;
    display: flex;
    flex-direction: column;
    animation: fadeIn 1s ease-in-out;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translate(-50%, -60%);
    }
    to {
        opacity: 1;
        transform: translate(-50%, -50%);
    }
}

form * {
    font-family: 'Poppins', sans-serif;
    color: #ffffff;
    letter-spacing: 0.5px;
    outline: none;
    border: none;
}


label {
    display: block;
    margin-top: 10px;
    font-size: 16px;
    font-weight: 500;
}

input {
    display: block;
    height: 40px;
    width: 100%;
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 5px;
    padding: 0 10px;
    margin-top: 8px;
    font-size: 14px;
    font-weight: 300;
    transition: background-color 0.3s ease;
}

input:focus {
    background-color: rgba(255, 255, 255, 0.2);
}

::placeholder {
    color: #e5e5e5;
}

button {
    margin-top: 20px;
    width: 100%;
    background: linear-gradient(135deg, #6d23f6, #ff9500);
    color: #ffffff;
    padding: 10px 0;
    font-size: 18px;
    font-weight: 600;
    border-radius: 5px;
    cursor: pointer;
    transition: transform 0.3s ease, background 0.3s ease;
}

button:hover {
    background: linear-gradient(135deg, #ff9500, #6d23f6);
    transform: scale(1.05);
}

/* Forgot Password link styling */
.forgot-password {
    margin-top: 15px;
    text-align: center;
}

.forgot-password a {
    color: #acaaaa; /* Link color */
    text-decoration: none; /* Remove underline */
    font-size: 14px;
}

.forgot-password a:hover {
    color: #ffffff; /* Darker shade on hover */
}
.message {
	text-align: center;
	color: white;
	margin-bottom: 20px;
	padding: 10px;
	border-radius: 6px;
}

.error-message {
	background-color: #dc3545; /* Red background for error messages */
}

</style>
</head>
<body>
    <div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <form id="loginForm" action="login" method="post">
        <div class="container">
            <i class="ri-heart-pulse-fill"></i><span>PINEWOODS</span>
        </div>

        <!-- Display error messages -->
        <c:if test="${not empty sessionScope.errorMessage}">
            <div class="message error-message">${sessionScope.errorMessage}</div>
            <c:remove var="errorMessage" scope="session" />
        </c:if>

        <label for="username">Username</label>
        <input type="text" placeholder="Username or Email" id="username" name="username" required>

        <label for="password">Password</label>
        <input type="password" placeholder="Password" id="password" name="password" required>

        <button type="submit">Log In</button>
        <div class="forgot-password">
            <a href="#">Forgot Password?</a>
        </div>
    </form>
</body>
</html>
