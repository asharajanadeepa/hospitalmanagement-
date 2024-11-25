<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up</title>
    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./assets/css/Signup.css">
</head>
<body>
    <div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <!-- Signup Form -->
    <form>
        <div class="form-section">
            <!-- Title Section -->
            <div class="container">
                <i class="ri-heart-pulse-fill"></i><span>PINEWOODS</span>
            </div>
            
            <!-- Name and Username in the same row -->
            <div class="row">
                <div class="half">
                    <label for="name">Name</label>
                    <input type="text" placeholder="Name" id="name">
                </div>
                <div class="half">
                    <label for="username">Username</label>
                    <input type="text" placeholder="Username" id="username">
                </div>
            </div>

            <!-- Email in the next row -->
            <label for="email">Email</label>
            <input type="email" placeholder="Email" id="email">

            <!-- Phone Number in the next row -->
            <label for="phone">Phone Number</label>
            <input type="tel" placeholder="Phone Number" id="phone">

            <!-- Password and Confirm Password in the same row -->
            <div class="row">
                <div class="half">
                    <label for="password">Password</label>
                    <input type="password" placeholder="Password" id="password">
                </div>
                <div class="half">
                    <label for="confirm-password">Confirm Password</label>
                    <input type="password" placeholder="Confirm Password" id="confirm-password">
                </div>
            </div>

            <!-- Address in the next row -->
            <label for="address">Address</label>
            <input type="text" placeholder="Address" id="address">

            <!-- Birth Date in the next row -->
            <label for="birthdate">Birth Date</label>
            <input type="date" id="birthdate">

            <!-- NIC and Photo Upload in the same row -->
            <div class="row">
                <div class="half">
                    <label for="nic">NIC Number</label>
                    <input type="text" placeholder="NIC Number" id="nic">
                </div>
                <div class="half">
                    <label for="photo">Upload Photo</label>
                    <input type="file" id="photo" accept="image/*">
                </div>
            </div>

            <button type="submit">Sign Up</button>
        </div>
    </form>
</body>
</html>
