<%@ page import="java.sql.*, db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dao.LabTestDao"%>
<%@ page import="model.LabTest"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Lab Technician Dashboard | PINEWOODS</title>
<link rel="stylesheet" href="./assets/css/laboDash.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
	rel="stylesheet" />
</head>
<style>
        .alert {
            padding: 15px;
            margin: 10px 0;
            border: 1px solid transparent;
            border-radius: 4px;
            display: none; /* Initially hidden */
        }
        .alert.success {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }
        .alert.error {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }
    </style>
<body>
	<c:choose>
		<c:when
			test="${not empty sessionScope.role && sessionScope.role == 'lab_technician'}">
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
				<h4>Lab ${sessionScope.name}</h4>
			</div>
		</div>
	</header>

	<div class="container">
		<nav>
			<ul>
				<li><a href="#"><i class="fas fa-home"></i><span
						class="nav-item">Dashboard</span></a></li>
				<li class="active"><a href="#"><i class="fas fa-vials"></i><span
						class="nav-item">Lab Tests</span></a></li>
				<li><a href="#"><i class="fas fa-chart-bar"></i><span
						class="nav-item">Test Results</span></a></li>
				<li><a href="#"><i class="fas fa-file-medical-alt"></i><span
						class="nav-item">Lab Reports</span></a></li>
				<li><a href="#"><i class="fas fa-calendar-alt"></i><span
						class="nav-item">Test Scheduling</span></a></li>
				<li><a href="#"><i class="fas fa-cog"></i><span
						class="nav-item">Settings</span></a></li>
				<li><a href="#" class="logout" onclick="confirmLogout(event)"><i
						class="fas fa-sign-out-alt"></i><span class="nav-item">Log
							out</span></a></li>
			</ul>
		</nav>

		<div class="main-body">
			<div class="promo_card">
				<div class="promo-content">
					<h1>Welcome Lab Technician ${sessionScope.name}</h1>
					<span>Your next scheduled test is at 10:00 AM.</span>
					<button>View Test Schedule</button>
				</div>
				<div class="divider"></div>
				<img src="./assets/image/11.svg" alt="Promo Image"
					class="promo-image" />
			</div>

			<section class="attendance">
				<div class="attendance-list">
					<h1>Lab Test Queue</h1>
					 <% 
        				String errorMessage = (String) request.getAttribute("errorMessage");
        				String successMessage = (String) request.getAttribute("successMessage");
    				%>
					<!-- Display success or error message -->
                    <c:if test="${not empty successMessage}">
                        <div class="alert success" style="display: block;">
                            ${successMessage}
                        </div>
                    </c:if>
                    <c:if test="${not empty errorMessage}">
                        <div class="alert error" style="display: block;">
                            ${errorMessage}
                        </div>
                    </c:if>
					<div class="control-panel">
						<div class="search-box">
							<input type="text" id="searchInput"
								placeholder="Search for tests..." onkeyup="searchTests()" />
							<button class="search-btn" aria-label="Search Lab Tests">
								<i class="fas fa-search"></i>
							</button>
						</div>
						<button class="add-btn"
							onclick="window.location.href='addLabReport.jsp'">Add
							Test</button>
					</div>

					<table class="table" id="labTestTable">
						<thead>
							<tr>
								<th>TID</th>
								<th>Name</th>
								<th>Lab Test</th>
								<th>Test Date</th>
								<th>Report Status</th>
								<th>Payment Status</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							LabTestDao labTestDao = new LabTestDao();
							List<LabTest> labTests = labTestDao.getAllLabTests(); // Fetch the list of lab tests

							if (labTests.isEmpty()) { // Check if the list is empty
							%>
							<tr>
								<td colspan="7">No lab tests are available.</td>
							</tr>
							<%
							} else {
							// Iterate through the list of lab tests
							for (LabTest labTest : labTests) {
								int tid = labTest.getTid();
								String name = labTest.getName();
								String labTestName = labTest.getLabTest();
								String testDate = labTest.getTestDate().toString(); // Convert LocalDate to String
								String reportStatus = labTest.getReportStatus();
								String paymentStatus = labTest.getPaymentStatus();
							%>
							<tr>
								<td><%=tid%></td>
								<td><%=name%></td>
								<td><%=labTestName%></td>
								<td><%=testDate%></td>
								<td><%=reportStatus%></td>
								<td><%=paymentStatus%></td>
								
								
								<td>
								
									<button class="update-btn"
										onclick="window.location.href='updateLabTest.jsp?tid=<%=tid%>'">Update</button>
										
										
									<form action="deleteLabTest" method="post"
										style="display: inline;">
										<input type="hidden" name="tid" value="<%=tid%>" />
										<button type="button" class="delete-btn"
											onclick="confirmDelete(this.form)"
											aria-label="Delete Lab Test">
											<i class="fas fa-trash-alt"></i>
										</button>
									</form>
									
									
								</td>
							</tr>
							<%
							}
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
		function confirmDelete(form) {
			if (confirm("Are you sure you want to delete this lab test?")) {
				form.submit(); // Submit the form to the servlet if confirmed
			}
		}

		// Search function to filter the lab test table
		function searchTests() {
			const input = document.getElementById("searchInput").value
					.toLowerCase();
			const table = document.getElementById("labTestTable");
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
			const table = document.getElementById("labTestTable");
			const rows = table.getElementsByTagName("tr");

			// Hide all rows after the 6th row
			for (let i = 7; i < rows.length; i++) {
				rows[i].style.display = "none";
			}
		};
		// Automatically hide alerts after a few seconds
        setTimeout(function() {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                alert.style.display = 'none';
            });
        }, 5000); // Hide after 5 seconds
	</script>
</body>
</html>
