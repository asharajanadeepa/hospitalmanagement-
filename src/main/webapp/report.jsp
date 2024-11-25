<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Fix the asset folder name to "assets" -->
    <link rel="stylesheet" href="./assets/css/home.css" />
    <link rel="stylesheet" href="./assets/css/report.css" />
    <link rel="stylesheet" href="./assets/css/headfoot.css" />

    <!-- Font Awesome for icons -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />

    <!-- Remixicon for additional icons -->
    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
      rel="stylesheet"
    />

    <!-- Boxicons for mobile menu icon -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/boxicons@latest/css/boxicons.min.css"
    />

    <title>Pinewoods Health Report</title>
    <!-- Page title -->
  </head>

  <body>
    <!-- Header section -->
    <header>
      <!-- Logo and title with icon -->
      <a href="#" class="logo">
        <i class="ri-heart-pulse-fill"></i><span>PINEWOODS</span>
      </a>

      <!-- Navigation bar -->
      <ul class="navbar">
        <li><a href="home.jsp">Home</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="appoinment.jsp">Appointments</a></li>
        <li><a href="report.jsp" class="active">Reports</a></li>
        <li><a href="#">Pharmacy</a></li>
        <li><a href="Login.jsp" class="sign-in">Sign In</a></li>
        <li><a href="Signup.jsp" class="sign-up">Sign Up</a></li>
      </ul>
      <div class="main">
        <div class="bx bx-menu" id="menu-icon"></div>
      </div>
    </header>

    <!-- Report Request Section -->
    <section class="report-request-section" id="report-request">
      <h2>Request Lab Report</h2>
      <p>
        Request your lab report securely and get it delivered via email or
        download.
      </p>

      <!-- Report Request Form -->
      <div class="report-request-form">
        <form action="#" method="post">
          <!-- Personal Information Section -->
          <div class="personal-info-container">
            <input
              type="text"
              name="patient_id"
              class="patient-id"
              placeholder="Lab Reference Number"
              required
            />
            <!-- Change "first_name" to "passcode" for clarity -->
            <input
              type="text"
              name="passcode"
              class="passcode"
              placeholder="Passcode (printed on the bill)"
              required
            />
          </div>

          <!-- Button to get lab report -->
          <button type="button" class="send-otp-button">Get lab report</button>
        </form>
      </div>
    </section>

    <!-- Footer section with various links -->
    <footer class="footer">
      <div class="container">
        <div class="frow">
          <!-- First column with hospital information -->
          <div class="footer-col">
            <h4>Hospital</h4>
            <ul>
              <li><a href="#">About Us</a></li>
              <li><a href="#">Consumer Brands</a></li>
              <li><a href="#">Health Care</a></li>
              <li><a href="#">Mobility</a></li>
            </ul>
          </div>

          <!-- Second column with help-related links -->
          <div class="footer-col">
            <h4>Get Help</h4>
            <ul>
              <li><a href="#">FAQ</a></li>
              <li><a href="#">Contact Us</a></li>
              <li><a href="#">Terms of Use</a></li>
              <li><a href="#">Privacy and Cookies</a></li>
            </ul>
          </div>

          <!-- Third column with social media icons -->
          <div class="footer-col">
            <h4>Follow Us</h4>
            <div class="social-links">
              <a href="#"><i class="fab fa-facebook-f"></i></a>
              <a href="#"><i class="fab fa-twitter"></i></a>
              <a href="#"><i class="fab fa-instagram"></i></a>
              <a href="#"><i class="fab fa-whatsapp"></i></a>
            </div>
          </div>

          <!-- Fourth column with brief description paragraph -->
          <div class="footer-col paragraph-col">
            <p>
              At Pinewoods Health, we’re here to support you. Find information
              about our services, get help, or connect with us on social media.
              We’re dedicated to making your healthcare experience better.
            </p>
          </div>
        </div>
      </div>
    </footer>

    <!-- Mobile menu toggle script -->
    <script>
      let menu = document.querySelector("#menu-icon");
      let navbar = document.querySelector(".navbar");

      // Toggle the menu open/close and change icon on click
      menu.onclick = () => {
        menu.classList.toggle("bx-x");
        navbar.classList.toggle("open");
      };
    </script>
  </body>
</html>
