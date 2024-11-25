<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Patient</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        /* General page layout */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(108deg, #2c075f 50%, rgb(142, 137, 145) 100%);
            font-family: 'Poppins', sans-serif;
        }

        /* General form styling */
        .patient-form {
            width: 100%;
            max-width: 600px;
            padding: 20px;
            background: rgba(24, 23, 23, 0.555); /* Transparent background */
            border: 1px solid rgba(85, 85, 85, 0);
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
            transition: transform 0.3s ease-in-out;
        }

        .patient-form:hover {
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
            color: #eee;
            background-color: rgba(65, 64, 64, 0.541); /* Transparent background */
            transition: border-color 0.3s ease-in-out;
            box-shadow: inset 0 2px 4px rgba(59, 58, 58, 0.3);
        }

        .form-input:focus {
            border-color: #007bff;
            outline: none;
        }

        /* Message Styles */
        .message {
            margin-bottom: 20px;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            font-weight: bold;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
        }

        /* Button Group */
        .button-group {
            display: flex;
            justify-content: space-between;
        }

        /* Submit Button */
        .add-p.button {
            background-color: #5c18b4;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s ease-in-out, transform 0.3s ease-in-out;
        }

        .add-p.button:hover {
            background-color: #350e5a;
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
            .patient-form {
                padding: 15px;
            }
            .form-input {
                font-size: 14px;
            }
            .add-p.button, .cancel-button {
                padding: 10px 20px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <c:choose>
        <c:when test="${not empty sessionScope.role && sessionScope.role == 'doctor'}">
            <!-- User is logged in as a doctor -->
        </c:when>
        <c:otherwise>
            <script>
                window.location.href = "Login.jsp";
            </script>
        </c:otherwise>
    </c:choose>

    <form id="addPatientForm" class="patient-form" action="addPatient" method="post">
        <h2 style="text-align: center; color: #ffffff;">Add Patient</h2>
        <!-- Display success or error message -->
    <c:if test="${not empty sessionScope.errorMessage}">
        <div class="message error">${sessionScope.errorMessage}</div>
        <c:remove var="errorMessage" scope="session"/>
    </c:if>

    <c:if test="${not empty sessionScope.successMessage}">
        <div class="message success">${sessionScope.successMessage}</div>
        <c:remove var="successMessage" scope="session"/>
    </c:if>
    
        <label for="patientName" class="form-label">Name:</label>
        <input type="text" id="patientName" name="name" class="form-input"/>

        <label for="patientDiagnosis" class="form-label">Diagnosis:</label>
        <select id="patientDiagnosis" name="diagnosis" class="form-input">
            <option value="">Select Diagnosis</option>
            <option value="Diabetes">Diabetes</option>
            <option value="Hypertension">Hypertension</option>
            <option value="Asthma">Asthma</option>
            <option value="Heart Disease">Heart Disease</option>
            <option value="COVID-19">COVID-19</option>
            <option value="Flu">Flu</option>
        </select>

        <label for="patientAllergies" class="form-label">Allergies:</label>
        <select id="patientAllergies" name="allergies" class="form-input">
            <option value="N/A">N/A</option>
            <option value="Have">Have</option>
        </select>

        <label for="prescriptionStatus" class="form-label">Prescription Status:</label>
        <select id="prescriptionStatus" name="prescriptionStatus" class="form-input">
            <option value="Pending">Pending</option>
            <option value="Completed">Completed</option>
        </select>

        <div class="button-group">
            <button type="submit" class="add-p button">Add Patient</button>
            <button type="button" class="cancel-button" onclick="cancelForm()">Cancel</button>
        </div>
    </form>

    <script>
        function cancelForm() {
            window.location.href = 'DoctorDashboard.jsp'; // Change this to the desired cancel redirect URL
        }
    </script>
</body>
</html>
