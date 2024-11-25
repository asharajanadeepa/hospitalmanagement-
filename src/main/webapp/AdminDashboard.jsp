<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="model.Doctor"%>
<!-- Import the 'medicine' class -->
<%@ page import="dao.DoctorDBUtil"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard | PINEWOODS</title>
<link rel="stylesheet" href="./assets/css/adminDash.css" />
<!-- Font Awesome CDN Link -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
	rel="stylesheet" />
</head>
<body>
	<c:choose>
		<c:when
			test="${not empty sessionScope.role && sessionScope.role == 'admin'}">
		</c:when>
		<c:otherwise>
			<script>
				window.location.href = "Login.jsp";
			</script>
		</c:otherwise>
	</c:choose>
	<header class="header">
		<a href="#" class="logo"> <i class="ri-heart-pulse-fill"></i><span>PINEWOODS
				Admin</span>
		</a>

		<div class="header-icons">
			<div class="account">
				<img src="./assets/image/9.jpg" alt="User Profile Picture" />
				<h4>Admin ${sessionScope.name}</h4>
			</div>
		</div>
	</header>
	<div class="container">
		<nav>
			<ul>
				<li><a href="#"> <i class="fas fa-home"></i> <span
						class="nav-item">Dashboard</span>
				</a></li>
				<li class="active"><a href="#"> <i class="fas fa-user-md"></i>
						<span class="nav-item">Doctor</span>
				</a></li>
				<li><a href="#"> <i class="fas fa-prescription-bottle-alt"></i>
						<span class="nav-item">Pharmacist</span>
				</a></li>
				<li><a href="#"> <i class="fas fa-vials"></i> <span
						class="nav-item">Laboratorian</span>
				</a></li>
				<li><a href="#"> <i class="fas fa-calendar-alt"></i> <span
						class="nav-item">Appointments</span>
				</a></li>
				<li><a href="#"> <i class="fas fa-file-medical"></i> <span
						class="nav-item">Medical Reports</span>
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
					<h1>Welcome admin ${sessionScope.name}</h1>
					<span>Manage your system</span>
					<button>Manage</button>
				</div>
				<img src="./assets/image/13.svg" alt="Promo Image"
					class="promo-image" />
			</div>

			<section class="attendance">
				<div class="attendance-list">
					<h1>Doctor Management</h1>

					<div class="control-panel">
						<div class="search-box">
							<input type="text" id="searchInput"
								placeholder="Search for Doctor..." onkeyup="searchDoctors()" />
							<button class="search-btn" aria-label="Search Lab Tests">
								<i class="fas fa-search"></i>
							</button>
						</div>
						<button class="add-btn"
							onclick="window.location.href='DoctorInsert.jsp'">Add
							Doctor</button>
					</div>

					<table class="table" id="doctorTable">
						<thead>
							<tr>
								<th>Doctor ID</th>
								<th>Name</th>
								<th>Specialization</th>
								<th>Gender</th>
								<th>Date of birth</th>
								<th>Phone</th>
								<th>Email</th>
								<th>Address</th>
								<th>Joining Date</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<%
							// Fetch the list of doctors from the database
							List<Doctor> doctorList = DoctorDBUtil.getDoctorDetails();

							// Check if the list is not empty
							if (doctorList != null && !doctorList.isEmpty()) {
								// Iterate through the list and display each doctor's details
								for (Doctor doc : doctorList) {

									int id = doc.getId();
									String name = doc.getName();
									String specialization = doc.getSpecialization();
									String gender = doc.getGender();
									String dob = doc.getDob();
									String phone = doc.getPhone();
									String email = doc.getEmail();
									String address = doc.getAddress();
									String joiningDate = doc.getJoiningDate();
							%>
							<tr>

								<td><%=id%></td>
								<td><%=name%></td>
								<td><%=specialization%></td>
								<td><%=gender%></td>
								<td><%=dob%></td>
								<td><%=phone%></td>
								<td><%=email%></td>
								<td><%=address%></td>
								<td><%=joiningDate%></td>

								<td>
									<%
									// Generate the URL for updating doctor details
									String docUpdateUrl = "updateDoctor.jsp?id=" + id + "&name=" + name + "&specialization=" + specialization + "&gender="
											+ gender + "&dob=" + dob + "&phone=" + phone + "&email=" + email + "&address=" + address + "&joiningDate="
											+ joiningDate;
									%> <a href="<%=docUpdateUrl%>">
										<button class="update-btn" name="update">Update</button>

								</a>

									<form action="delete" method="post" style="display: inline;">
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
								<td colspan="12">No doctors available.</td>
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
		function searchDoctors() {
			const input = document.getElementById("searchInput").value
					.toLowerCase();
			const table = document.getElementById("doctorTable");
			const rows = table.getElementsByTagName("tr");
			let visibleCount = 0;

			// Loop through table rows (excluding the header row)
			for (let i = 1; i < rows.length; i++) {
				let row = rows[i];
				let columns = row.getElementsByTagName("td");
				let matchFound = false;

				// Check each column for a match with the search input
				for (let j = 0; j < columns.length; j++) {
					const cellValue = columns[j].textContent
							|| columns[j].innerText;
					if (cellValue.toLowerCase().includes(input)) {
						matchFound = true;
						break;
					}
				}

				// Display or hide rows based on the search result
				if (matchFound) {
					row.style.display = "";
					visibleCount++;
				} else {
					row.style.display = "none";
				}
			}
		}

		function confirmDelete(form) {
			if (confirm("Are you sure you want to delete this doctor?")) {
				form.submit(); // Submit the form if the user confirms
			}
		}
	</script>
</body>
</html>
