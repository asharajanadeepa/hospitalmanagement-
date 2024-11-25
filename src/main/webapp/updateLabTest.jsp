<%@ page import="model.LabTest, dao.LabTestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Lab Test</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap"
	rel="stylesheet">
<style>
    /* General page layout */
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        background: linear-gradient(108deg, #0f0961 50%, rgb(31, 141, 214) 100%);
        font-family: 'Poppins', sans-serif;
    }

    /* General form styling */
    .labtest-form {
        width: 100%;
        max-width: 600px;
        padding: 20px;
        background: rgba(24, 23, 23, 0.555); /* Transparent background */
        border: 1px solid rgba(85, 85, 85, 0);
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
        transition: transform 0.3s ease-in-out;
    }

    .labtest-form:hover {
        transform: scale(1.03);
    }

    /* Form Labels */
    .form-label {
        display: block;
        font-weight: bold;
        margin-bottom: 8px;
        color: #ddd;
    }

    /* Form Inputs */
    .form-input {
        width: 95%;
        padding: 12px;
        margin-bottom: 20px;
        border: 1px solid rgb(0, 0, 0);
        border-radius: 6px;
        font-size: 16px;
        color: white; /* Change to white font color */
        background-color: rgb(56, 55, 55); /* Change background color to black */
        transition: border-color 0.3s ease-in-out;
        box-shadow: inset 0 2px 4px rgba(59, 58, 58, 0.3);
    }

    select.form-input {
        color: white; /* Font color for dropdown */
        background-color: rgb(44, 43, 43); /* Background color for dropdown */
    }

    select.form-input:focus {
        border-color: #007bff; /* Border color when focused */
        outline: none;
    }

    /* Button Group */
    .button-group {
        display: flex;
        justify-content: space-between;
    }

    /* Update Button */
    .update-button {
        background-color: #2218b4;
        color: white;
        padding: 12px 24px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 500;
        transition: background-color 0.3s ease-in-out, transform 0.3s ease-in-out;
    }

    .update-button:hover {
        background-color: #13074d;
        transform: translateY(-2px);
    }

    /* Cancel Button */
    .cancel-button {
        background-color: #dc3545;
        color: white;
        padding: 12px 24px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 500;
        transition: background-color 0.3s ease-in-out, transform 0.3s ease-in-out;
    }

    .cancel-button:hover {
        background-color: #c82333;
        transform: translateY(-2px);
    }

    /* For responsiveness */
    @media (max-width: 768px) {
        .labtest-form {
            padding: 15px;
        }

        .form-input {
            font-size: 14px;
        }

        .update-button, .cancel-button {
            padding: 10px 20px;
            font-size: 14px;
        }
    }

</style>

</head>
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
	<%
	String tidStr = request.getParameter("tid");
	LabTest labTest = null;

	if (tidStr != null && !tidStr.isEmpty()) {
		int tid = Integer.parseInt(tidStr);
		LabTestDao labTestDao = new LabTestDao();
		labTest = labTestDao.getLabTestById(tid);
	}
	%>

<form id="updateLabTestForm" class="labtest-form" action="updateLabTest" method="post">
    <h2 style="text-align: center; color: #ffffff;">Update Lab Test</h2>

    <% if (labTest != null) { %>
        <input type="hidden" id="labTestId" name="tid" value="<%=labTest.getTid()%>" />

        <label for="labTestName" class="form-label">Name:</label>
        <input type="text" id="labTestName" name="name" class="form-input" value="<%=labTest.getName()%>" required />

        <label for="labTest" class="form-label">Lab Test:</label>
        <select id="labTest" name="labTest" class="form-input" required>
            <option value="Complete Blood Count (CBC)" <%= "Complete Blood Count (CBC)".equals(labTest.getLabTest()) ? "selected" : "" %>>Complete Blood Count (CBC)</option>
            <option value="Basic Metabolic Panel (BMP)" <%= "Basic Metabolic Panel (BMP)".equals(labTest.getLabTest()) ? "selected" : "" %>>Basic Metabolic Panel (BMP)</option>
            <option value="Liver Function Tests (LFT)" <%= "Liver Function Tests (LFT)".equals(labTest.getLabTest()) ? "selected" : "" %>>Liver Function Tests (LFT)</option>
            <option value="Coagulation Tests" <%= "Coagulation Tests".equals(labTest.getLabTest()) ? "selected" : "" %>>Coagulation Tests</option>
            <option value="Urinalysis" <%= "Urinalysis".equals(labTest.getLabTest()) ? "selected" : "" %>>Urinalysis</option>
        </select>

        <label for="testDate" class="form-label">Test Date:</label>
        <input type="date" id="testDate" name="testDate" class="form-input" value="<%=labTest.getTestDate()%>" required />

        <label for="reportStatus" class="form-label">Report Status:</label>
        <select id="reportStatus" name="reportStatus" class="form-input">
            <option value="In Progress" <%= "In Progress".equals(labTest.getReportStatus()) ? "selected" : "" %>>In Progress</option>
            <option value="Completed" <%= "Completed".equals(labTest.getReportStatus()) ? "selected" : "" %>>Completed</option>
            <option value="Pending" <%= "Pending".equals(labTest.getReportStatus()) ? "selected" : "" %>>Pending</option>
        </select>

        <label for="paymentStatus" class="form-label">Payment Status:</label>
        <select id="paymentStatus" name="paymentStatus" class="form-input">
            <option value="Paid" <%= "Paid".equals(labTest.getPaymentStatus()) ? "selected" : "" %>>Paid</option>
            <option value="Not Paid" <%= "Not Paid".equals(labTest.getPaymentStatus()) ? "selected" : "" %>>Not Paid</option>
        </select>

        <div class="button-group">
            <button type="submit" class="update-button">Update</button>
            <button type="button" class="cancel-button" onclick="window.location.href='LaboDashboard.jsp';">Cancel</button>
        </div>
    <% } else { %>
        <p style="color: red;">Lab Test not found or invalid ID!</p>
    <% } %>
</form>


</body>
</html>
