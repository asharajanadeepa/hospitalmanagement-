<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="./assets/css/home.css" />

    <link rel="stylesheet" href="./assets/css/headfoot.css" />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />

    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
      rel="stylesheet"
    />

    <link
      rel="stylesheet"
      href="https://unpkg.com/boxicons@latest/css/boxicons.min.css"
    />

    <title>Pinewoods Health</title>
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
        <li><a href="home.jsp" class="active">Home</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="appoinment.jsp">Appointments</a></li>
        <li><a href="report.jsp">Reports</a></li>
        <li><a href="#">Pharmacy</a></li>
        <!-- New Sign In and Sign Up Links -->
        <li><a href="Login.jsp" class="sign-in">Sign In</a></li>
        <li><a href="Signup.jsp" class="sign-up">Sign Up</a></li>
      </ul>

      <div class="main">
        <div class="bx bx-menu" id="menu-icon"></div>
      </div>
    </header>

    <!-- Home section with hero image and text -->
    <section id="home" class="home">
      <div class="row">
        <div class="images">
          <img src=".\assets\image\1.jpg" alt="Home Image" />
          <!-- Hero image -->
        </div>
        <div class="content">
          <h1><span>Stay</span> Safe, <span>Stay</span> Healthy.</h1>
          <!-- Heading with emphasis -->
          <p>
            Our Online Hospital Management System makes healthcare easier and
            more efficient. From booking appointments and managing patient
            records to handling prescriptions, it’s designed to streamline your
            experience. Enjoy a hassle-free way to manage your health with just
            a few clicks
          </p>
          <a href="#"><button class="button">Read More</button></a>
          <!-- Call-to-action button -->
        </div>
      </div>
    </section>

    <!-- About section with different facility features -->
    <section id="about" class="about">
      <h1 class="heading">About Our Facility</h1>
      <h3 class="title">Learn and Explore Our Facility</h3>

      <div class="box-container">
        <!-- Each box represents a different feature -->

        <!-- More boxes with similar structure for other features -->
        <div class="box">
          <div class="images">
            <img src=".\assets\image\3.jpg" alt="Online Appointment" />
          </div>
          <div class="content">
            <h3>Online Appointment</h3>
            <p>
              "Easily schedule your medical appointments online with our
              user-friendly system. Enjoy the convenience of booking
              consultations at your preferred time without the need for phone
              calls."
            </p>
            <a href="#"><button class="button">Learn More</button></a>
          </div>
        </div>

        <div class="box">
          <div class="images">
            <img src=".\assets\image\4.jpg" alt="Lab Report" />
          </div>
          <div class="content">
            <h3>Lab Report</h3>
            <p>
              "Access your lab results quickly and securely through our online
              portal. Stay informed about your health status with timely and
              accurate reports, accessible anytime."
            </p>
            <a href="#"><button class="button">Learn More</button></a>
          </div>
        </div>

        <div class="box">
          <div class="images">
            <img src=".\assets\image\5.jpg" alt="Online Pharmacy" />
          </div>
          <div class="content">
            <h3>Online Pharmacy</h3>
            <p>
              "Order your medications from the comfort of your home with our
              online pharmacy. We offer a wide range of pharmaceutical products
              delivered directly to your doorstep."
            </p>
            <a href="#"><button class="button">Learn More</button></a>
          </div>
        </div>

        <div class="box">
          <div class="images">
            <img src=".\assets\image\6.jpg" alt="Services" />
          </div>
          <div class="content">
            <h3>Services</h3>
            <p>
              "Explore our comprehensive range of healthcare services designed
              to meet all your medical needs. From routine check-ups to
              specialized treatments, we are here to support your health
              journey."
            </p>
            <a href="#"><button class="button">Learn More</button></a>
          </div>
        </div>

        <div class="box">
          <div class="images">
            <img src=".\assets\image\2.jpg" alt="Our Mission" />
          </div>
          <div class="content">
            <h3>Our Mission</h3>
            <p>
              "Our mission is to provide exceptional healthcare services with
              compassion and commitment. We aim to improve the well-being of our
              community through advanced medical practices and personalized
              care."
            </p>
            <a href="#"><button class="button">Learn More</button></a>
          </div>
        </div>
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

    <!-- JavaScript for menu toggle -->
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
