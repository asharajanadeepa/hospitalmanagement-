<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Lab Report</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
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
        .labreport-form {
            width: 100%;
            max-width: 600px;
            padding: 20px;
            background: rgba(24, 23, 23, 0.555);
            border: 1px solid rgba(85, 85, 85, 0);
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
            transition: transform 0.3s ease-in-out;
        }

        .labreport-form:hover {
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
            color: white;
            background-color: rgb(56, 55, 55);
            transition: border-color 0.3s ease-in-out;
            box-shadow: inset 0 2px 4px rgba(59, 58, 58, 0.3);
        }

        select.form-input {
            color: white;
            background-color: rgb(44, 43, 43);
        }

        select.form-input:focus {
            border-color: #007bff;
            outline: none;
        }

        /* Button Group */
        .button-group {
            display: flex;
            justify-content: space-between;
        }

        /* Submit Button */
        .add-labreport.button {
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

        .add-labreport.button:hover {
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
            .labreport-form {
                padding: 15px;
            }
            .form-input {
                font-size: 14px;
            }
            .add-labreport.button, .cancel-button {
                padding: 10px 20px;
                font-size: 14px;
            }
        }

        /* Message Styles */
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
    <c:choose>
        <c:when test="${not empty sessionScope.role && sessionScope.role == 'lab_technician'}">
        </c:when>
        <c:otherwise>
            <script>
                window.location.href = "Login.jsp";
            </script>
        </c:otherwise>
    </c:choose>

    <form id="addLabReportForm" class="labreport-form" action="addLabReport" method="post">
        <h2 style="text-align: center; color: #ffffff;">Add Lab Report</h2>
        
        <!-- Display error messages -->
        <c:if test="${not empty sessionScope.errorMessage}">
            <div class="message error-message">${sessionScope.errorMessage}</div>
            <c:remove var="errorMessage" scope="session" />
        </c:if>

        <label for="patientName" class="form-label">Patient Name:</label>
        <input type="text" id="patientName" name="patientName" class="form-input"/>

        <label for="testName" class="form-label">Lab Test Name:</label>
        <select id="testName" name="labTestName" class="form-input" required>
        	<option value="">Select Lab Test Name</option>
            <option value="Complete Blood Count (CBC)">Complete Blood Count (CBC)</option>
            <option value="Basic Metabolic Panel (BMP)">Basic Metabolic Panel (BMP)</option>
            <option value="Liver Function Tests (LFT)">Liver Function Tests (LFT)</option>
            <option value="Coagulation Tests">Coagulation Tests</option>
            <option value="Urinalysis">Urinalysis</option>
        </select>

        <label for="reportStatus" class="form-label">Report Status:</label>
        <select id="reportStatus" name="reportStatus" class="form-input" required>
        	<option value="">Select Report Status</option>
            <option value="In Progress">In Progress</option>
            <option value="Completed">Completed</option>
            <option value="Pending">Pending</option>
        </select>

        <label for="paymentStatus" class="form-label">Payment Status:</label>
        <select id="paymentStatus" name="paymentStatus" class="form-input" required>
        	<option value="">Select Payment Status</option>
            <option value="Paid">Paid</option>
            <option value="Not Paid">Not Paid</option>
        </select>

        <div class="button-group">
            <button type="submit" class="add-labreport button">Add Lab Report</button>
            <button type="button" class="cancel-button" onclick="window.location.href = 'LaboDashboard.jsp';">Cancel</button>
        </div>
    </form>

</body>
</html>
