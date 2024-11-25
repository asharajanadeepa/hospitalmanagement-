<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.medicine"%>
<!-- Import the 'medicine' class -->
<%@ page import="dao.pharmacistDBUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Import the 'DBUtil' class -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Pharmacist Inventory | PINEWOODS</title>
<link rel="stylesheet" href="./assest/pharmacyDash.css" />
<!-- Font Awesome CDN Link -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
	rel="stylesheet" />
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap")
	;

* {
	margin: 0;
	padding: 0;
	border: none;
	outline: none;
	text-decoration: none;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

body {
	background: linear-gradient(108deg, #030303 50%, rgb(119, 118, 119) 100%);
}

/* Header Section */
.header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	height: 60px;
	padding: 20px;
	background: #6d6b6b;
}

.logo {
  display: flex;
  align-items: center;
  margin-left: -20px; /* Adjust this value as needed */
}

.logo i {
  color: rgb(201, 53, 53);
  font-size: 55px;
  margin-right: 3px;
}

.header-icons {
  display: flex;
  align-items: center;
}

.logout {
  position: absolute;
  bottom: 20px; /* Adjust this value as needed */
}

.header-icons i {
  margin-right: 2rem;
  cursor: pointer;
}

.header-icons .account {
  width: 130px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.header-icons .account img {
  width: 35px;
  height: 35px;
  cursor: pointer;
  border-radius: 50%;
  margin-right: 20px;
}

.header-icons .account h4 {
  font-size: 14px;
  font-weight: 600;
  color: #ffffff;
}

/* Container */
.container {
	display: flex;
	justify-content: space-between;
}

/* Sidebar Section */
nav {
	position: relative;
	height: 100vh;
	left: 0;
	background: #000000;
	width: 280px;
	box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
}

.logo {
	text-align: center;
	display: flex;
	margin: 10px 0;
}

.logo span {
	font-weight: bold;
	padding-left: 15px;
	font-size: 25px;
	text-transform: uppercase;
	color: #fff;
}

nav a {
	color: rgb(255, 255, 255);
	font-size: 14px;
	display: table;
	width: 100%;
	padding: 10px;
}

nav .fas {
	width: 70px;
	height: 40px;
	font-size: 20px;
	text-align: center;
}

.nav-item {
	margin-left: 10px;
}

nav a:hover {
	background: #535253;
}

.active {
	background: #5f5e5f;
}

/* Main Body Section */
.main-body {
	width: 100%;
	padding: 1rem;
}

.promo_card {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	color: #fff;
	margin-top: 10px;
	border-radius: 8px;
	padding: 1rem;
	background: rgb(37, 37, 37);
	position: relative;
}

.promo-content {
	flex: 1;
}

.promo_card img {
	width: 150px;
	height: auto;
	border-radius: 8px;
	margin-left: 15px;
}

.promo_card h1, .promo_card span, .promo_card button {
	margin: 10px;
}

.promo_card button {
	display: block;
	padding: 6px 12px;
	border-radius: 5px;
	cursor: pointer;
	background: transparent;
	color: #fff;
	border: 1px solid #fff;
}

.promo_card button:hover {
	background: #fff;
	color: #000;
	transition: 0.3s;
}

.divider {
	height: 100px;
	width: 2px;
	background-color: #fff;
	margin: 20px 20px;
	align-self: stretch;
}

.promo_card .promo-content {
	max-width: 60%;
}

.promo_card .status-selection {
	min-width: 200px;
}

.logout {
	position: absolute;
	bottom: 20px; /* Adjust this value as needed */
}

.history_lists {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 1rem 0;
}

/* Attendance List Section */
.attendance {
	margin-top: 20px;
	text-transform: capitalize;
}

.attendance-list {
	width: 100%;
	padding: 10px;
	margin-top: 10px;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
}

.control-panel {
	margin-top: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.search-box {
	display: flex;
	align-items: center;
}

.search-box input {
	padding: 10px;
	width: 250px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.search-btn {
	background-color: #000000;
	border: none;
	padding: 10px 15px;
	color: white;
	cursor: pointer;
	border-radius: 4px;
	margin-left: 10px;
}

.search-btn i {
	font-size: 1rem;
}

.search-btn:hover {
	background-color: #48484b;
}

.add-btn {
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 10px;
	border: 1px solid #2c2b2e;
	background: transparent;
	margin-right: 20%;
}

.add-btn:hover {
	background: #272728;
	color: #fff;
	transition: 0.5s;
}

.table {
	border-collapse: collapse;
	margin: 25px 0;
	font-size: 15px;
	min-width: 100%;
	overflow: hidden;
	border-radius: 5px 5px 0 0;
}

table thead tr {
	color: #fff;
	background: #383738;
	text-align: left;
	font-weight: bold;
}

.table th, .table td {
	padding: 12px 15px;
}

.table tbody tr {
	border-bottom: 1px solid #ddd;
}

.table tbody tr:nth-of-type(odd) {
	background: #f3f3f3;
}

.table tbody tr:last-of-type {
	border-bottom: 2px solid #000000;
}

.table button {
	padding: 6px 20px;
	border-radius: 10px;
	cursor: pointer;
	background: transparent;
	border: 1px solid #2c2b2e;
}

.table .update-btn:hover {
	background: #176407;
	color: #fff;
	transition: 0.5s;
}

.table .edit-btn:hover {
	background: #361e1e;
	color: #fff;
	transition: 0.5s;
}

.table .delete-btn:hover {
	background: #d30808;
	color: #fff;
	transition: 0.5s;
}

.table .delete-btn::before {
	content: "\f1f8";
	font-family: "Font Awesome 5 Free";
	font-weight: 900;
	margin-right: 5px;
}
/* Scrollbar styling */
::-webkit-scrollbar {
	width: 5px;
}

::-webkit-scrollbar-track {
	background: #161414;
}

::-webkit-scrollbar-thumb {
	background: linear-gradient(#333333, #979797);
}
</style>
</head>
<body>
	<c:choose>
		<c:when
			test="${not empty sessionScope.role && sessionScope.role == 'pharmacist'}">
		</c:when>
		<c:otherwise>
			<script>
                window.location.href = "Login.jsp";
            </script>
		</c:otherwise>
	</c:choose>
	<header class="header">
		<a href="#" class="logo"> <i class="ri-heart-pulse-fill"></i><span>PINEWOODS
				LAB</span>
		</a>
		<div class="header-icons">
			<div class="account">
				<img src="./assets/image/9.jpg" alt="User Profile Picture" />
				<h4>Pharmacist ${sessionScope.name}</h4>
			</div>
		</div>
	</header>
	<div class="container">
		<nav>
			<ul>
				<li><a href="#"> <i class="fas fa-home"></i> <span
						class="nav-item">Dashboard</span>
				</a></li>
				<li><a href="#"> <i class="fas fa-prescription-bottle-alt"></i>
						<span class="nav-item">Prescriptions</span>
				</a></li>
				<li><a href="#" class="active"> <i class="fas fa-pills"></i>
						<span class="nav-item">Inventory</span>
				</a></li>
				<li><a href="#"> <i class="fas fa-notes-medical"></i> <span
						class="nav-item">Orders</span>
				</a></li>
				<li><a href="#"> <i class="fas fa-file-alt"></i> <span
						class="nav-item">Reports</span>
				</a></li>
				<li><a href="#"> <i class="fas fa-cog"></i> <span
						class="nav-item">Settings</span>
				</a></li>
				<li><a href="#" class="logout" onclick="confirmLogout(event)"><i
						class="fas fa-sign-out-alt"></i><span class="nav-item">Log
							out</span></a></li>
			</ul>
		</nav>

		<div class="main-body">
			<div class="promo_card">
				<div class="promo-content">
					<h1>Welcome Pharmacist ${sessionScope.name}</h1>
					<span>Your next order review is scheduled for 11:00 AM.</span>
					<button>View Orders</button>
				</div>
				<div class="divider"></div>
				<img src="./assets/image/12.svg" alt="Promo Image"
					class="promo-image" />
			</div>
			<section class="attendance">
				<div class="attendance-list">
					<h1>medicines</h1>

					<div class="control-panel">
						<div class="search-box">
							<input type="text" id="searchInput"
								placeholder="Search for Medicines...."
								onkeyup="searchMedicine()" />
							<button class="search-btn" aria-label="Search Medicine">
								<i class="fas fa-search"></i>
							</button>
						</div>
						<button class="add-btn"
							onclick="window.location.href='medicineAdd.jsp'">Add
							Medicine</button>
					</div>

					<table class="table" id="medicineTable">
						<thead>
							<tr>
								<th>Medicine ID</th>
								<th>Medicine Name</th>
								<th>Medicine Description</th>
								<th>Medicine Quantity</th>
								<th>Medicine Price</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							// Fetch the list of medicines from the database
							List<medicine> medicines = pharmacistDBUtil.getMedicines();

							// Check if the list is not empty
							if (medicines != null && !medicines.isEmpty()) {
								// Iterate through the list and display each medicine's details
								for (medicine med : medicines) {

									int id = med.getId();
									String name = med.getMedName();
									String description = med.getMedDiscription();
									int Quantity = med.getMedQuantity();
									String price = med.getMedPrice();
							%>
							<tr>
								<td><%=id%></td>
								<td><%=name%></td>
								<td><%=description%></td>
								<td><%=Quantity%></td>
								<td><%=price%></td>
								<td>
									<%
									// Generate the URL for updating medicine details
									String medUpdateUrl = "updateMedicine.jsp?id=" + id + "&name=" + name + "&description=" + description + "&Quantity="
											+ Quantity + "&price=" + price;
									%> <a href="<%=medUpdateUrl%>">
										<button class="update-btn">Update</button>
								</a> 
								<%
 										String successMessage = (String) request.getAttribute("updateSuccess");
 										if (successMessage != null) {
 									%>
 										 <script>
                       						alert("<%=successMessage%>
										");
									</script> <%
 									}
 %>

									<form action="adelete" method="post" style="display: inline;">
										<input type="hidden" name="id" value="<%=id%>" />
										<button type="button" class="delete-btn" name="delete"
											onclick="confirmDelete(this.form)"></button>
									</form>

								</td>
							</tr>
							<%
							}
							} else {
							%>
							<tr>
								<td colspan="6">No medicines available.</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</section>
		</div>
	</div>

	<script>
		function confirmLogout(event) {
			event.preventDefault(); // Prevent the default action
			if (confirm("Are you sure you want to log out?")) {
				window.location.href = "Logout.jsp"; // Redirect to logout.jsp
			}
		}
		// Search function to filter table
		function searchMedicine() {
			const input = document.getElementById("searchInput").value
					.toLowerCase();
			const table = document.getElementById("medicineTable");
			const rows = table.getElementsByTagName("tr");
			let visibleCount = 0; // To count visible rows

			// If the input is empty, show the first 6 rows
			if (input === "") {
				for (let i = 1; i < rows.length; i++) {
					if (i <= 6) {
						rows[i].style.display = ""; // Show first 6 rows
					} else {
						rows[i].style.display = "none"; // Hide all other rows
					}
				}
				return; // Exit the function
			}

			// Loop through the rows and filter them based on the search input
			for (let i = 1; i < rows.length; i++) {
				let row = rows[i];
				let columns = row.getElementsByTagName("td");
				let matchFound = false;

				// Check each cell in the row for a match
				for (let j = 0; j < columns.length; j++) {
					const cellValue = columns[j].textContent
							|| columns[j].innerText;
					if (cellValue.toLowerCase().includes(input)) {
						matchFound = true;
						break;
					}
				}

				// Display the row if there's a match
				if (matchFound) {
					row.style.display = "";
					visibleCount++;
				} else {
					row.style.display = "none"; // Hide rows that do not match
				}
			}

			// Hide any additional rows beyond the 6th matching row
			for (let i = 1; i < rows.length; i++) {
				if (rows[i].style.display === "" && visibleCount > 6) {
					rows[i].style.display = "none"; // Hide rows beyond the 6th if they are visible
				}
			}
		}

		// Call this function on page load to hide rows beyond the 6th
		window.onload = function() {
			const table = document.getElementById("medicineTable");
			const rows = table.getElementsByTagName("tr");

			// Hide all rows after the 6th row
			for (let i = 7; i < rows.length; i++) {
				rows[i].style.display = "none";
			}
		}
		function confirmDelete(form) {
			if (confirm("Are you sure you want to delete this medicine?")) {
				form.submit(); // Submit the form if the user confirms
			}
		}
	</script>
</body>
</html>