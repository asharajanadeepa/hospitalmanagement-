<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Font Awesome for icons -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
    <!-- Custom CSS files -->
    <link rel="stylesheet" href="./assets/css/home.css" />
    <link rel="stylesheet" href="./assets/css/appoinment.css" />
    <link rel="stylesheet" href="./assets/css/headfoot.css" />
    <!-- Remixicon for icons -->
    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://unpkg.com/boxicons@latest/css/boxicons.min.css"
    />
    <title>Pinewoods Health Appointment</title>
  </head>
  <body>
    <!-- Fixed header section -->
    <header>
      <!-- Logo with an icon -->
      <a href="#" class="logo">
        <i class="ri-heart-pulse-fill"></i>
        <span>PINEWOODS</span>
      </a>
      <!-- Navigation bar -->
      <ul class="navbar">
        <li><a href="home.jsp">Home</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="appoinment.jsp" class="active">Appointments</a></li>
        <li><a href="report.jsp">Reports</a></li>
        <li><a href="#">Pharmacy</a></li>
        <li><a href="Login.jsp" class="sign-in">Sign In</a></li>
        <li><a href="Signup.jsp" class="sign-up">Sign Up</a></li>
      </ul>
      <div class="main">
        <div class="bx bx-menu" id="menu-icon"></div>
      </div>
    </header>

    <!-- Appointment booking section -->
    <section class="appointment-section" id="appointment">
      <h2>Book an Appointment</h2>
      <p>
        Schedule an appointment with one of our experienced doctors or
        specialists.
      </p>

      <!-- Appointment booking form -->
      <div class="appointment-form">
        <form action="#" method="post">
          <!-- Title and Name Section -->
          <div class="title-name-container">
            <select name="title" class="title-select" required>
              <option value="" disabled selected>Title</option>
              <option value="mr">Mr.</option>
              <option value="mrs">Mrs.</option>
              <option value="ms">Ms.</option>
            </select>
            <input
              type="text"
              name="name"
              class="name"
              placeholder="Name"
              required
            />
          </div>
          <input type="email" name="email" placeholder="Your Email" required />
          <input type="tel" name="phone" placeholder="Your Phone" required />
          <input
            type="date"
            name="date"
            placeholder="Preferred Date"
            required
          />

          <!-- Dropdown menu for department selection -->
          <select name="department" id="department" required>
            <option value="" disabled selected>Select Department</option>
            <option value="cardiology">Cardiology</option>
            <option value="neurology">Neurology</option>
            <option value="orthopedics">Orthopedics</option>
            <option value="pediatrics">Pediatrics</option>
          </select>

          <!-- Dropdown menu for doctor selection based on department -->
          <select name="doctor" id="doctor" required>
            <option value="" disabled selected>Select Doctor</option>
          </select>

          <!-- Textarea for additional messages -->
          <textarea
            name="message"
            placeholder="Any specific concerns or message"
          ></textarea>
          <!-- Submit button -->
          <button type="submit" class="appointment-button">Submit</button>
        </form>
      </div>
    </section>

    <!-- Footer section -->
    <footer class="footer">
      <div class="container">
        <div class="frow">
          <!-- Column 1: About the hospital -->
          <div class="footer-col">
            <h4>Hospital</h4>
            <ul>
              <li><a href="#">About Us</a></li>
              <li><a href="#">Consumer Brands</a></li>
              <li><a href="#">Health Care</a></li>
              <li><a href="#">Mobility</a></li>
            </ul>
          </div>
          <!-- Column 2: Help and contact information -->
          <div class="footer-col">
            <h4>Get Help</h4>
            <ul>
              <li><a href="#">FAQ</a></li>
              <li><a href="#">Contact Us</a></li>
              <li><a href="#">Terms of Use</a></li>
              <li><a href="#">Privac and Cookies</a></li>
            </ul>
          </div>
          <!-- Column 3: Social media links -->
          <div class="footer-col">
            <h4>Follow Us</h4>
            <div class="social-links">
              <a href="#"><i class="fab fa-facebook-f"></i></a>
              <a href="#"><i class="fab fa-twitter"></i></a>
              <a href="#"><i class="fab fa-instagram"></i></a>
              <a href="#"><i class="fab fa-whatsapp"></i></a>
            </div>
          </div>
          <!-- Column 4: Description paragraph -->
          <div class="footer-col paragraph-col">
            <p>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam
              eget turpis vel lectus dictum aliquet. Vivamus a urna ut ante
              euismod consequat. Integer convallis mi non nisl iaculis, et
              commodo metus sodales.
            </p>
          </div>
        </div>
      </div>
    </footer>

    <!-- Script to handle mobile menu toggle -->
    <script>
      let menu = document.querySelector("#menu-icon");
      let navbar = document.querySelector(".navbar");

      menu.onclick = () => {
        menu.classList.toggle("bx-x"); // Change icon to 'x' when menu is open
        navbar.classList.toggle("open"); // Open/close the navbar
      };
    </script>
  </body>
</html>
