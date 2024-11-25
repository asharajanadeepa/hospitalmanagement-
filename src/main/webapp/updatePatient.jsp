<%@ page import="model.Patient, dao.PatientDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Patient</title>
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
            border: 1px solid #000;
            border-radius: 6px;
            font-size: 16px;
            color: #eee;
            background-color: rgba(65, 64, 64, 0.541); /* Transparent background */
            box-shadow: inset 0 2px 4px rgba(59, 58, 58, 0.3);
            transition: border-color 0.3s ease-in-out;
        }

        .form-input:focus {
            border-color: #007bff;
            outline: none;
        }

        /* Button Group */
        .button-group {
            display: flex;
            justify-content: space-between;
        }

        /* Update Button */
        .update-button {
            background-color: #5c18b4;
            color: white;
            padding: 12px 24px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s ease-in-out, transform 0.3s ease-in-out;
        }

        .update-button:hover {
            background-color: #350e5a;
            transform: translateY(-2px);
        }

        /* Cancel Button */
        .cancel-button {
            background-color: #dc3545;
            color: white;
            padding: 12px 24px;
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
			test="${not empty sessionScope.role && sessionScope.role == 'doctor'}">
		</c:when>
		<c:otherwise>
			<script>
				window.location.href = "Login.jsp";
			</script>
		</c:otherwise>
	</c:choose>
    <%
        String pidStr = request.getParameter("pid");
        Patient patient = null;

        if (pidStr != null && !pidStr.isEmpty()) {
            int pid = Integer.parseInt(pidStr);
            PatientDao patientDao = new PatientDao();
            patient = patientDao.getPatientById(pid);
        }
    %>

    <form id="updatePatientForm" class="patient-form" action="updatePatient" method="post">
        <h2 style="text-align: center; color: #ffffff;">Update Patient</h2>

        <% if (patient != null) { %>
        
            <input type="hidden" id="patientId" name="pid" value="<%=patient.getId()%>" />

            <label for="patientName" class="form-label">Name:</label>
            <input type="text" id="patientName" name="name" class="form-input" value="<%=patient.getName()%>" required />

            <label for="diagnosis" class="form-label">Diagnosis:</label>
<select id="diagnosis" name="diagnosis" class="form-input" required>
    <option value="Diabetes" <%=patient.getDiagnosis().equals("Diabetes") ? "selected" : "" %>>Diabetes</option>
    <option value="Hypertension" <%=patient.getDiagnosis().equals("Hypertension") ? "selected" : "" %>>Hypertension</option>
    <option value="Asthma" <%=patient.getDiagnosis().equals("Asthma") ? "selected" : "" %>>Asthma</option>
    <option value="Heart Disease" <%=patient.getDiagnosis().equals("Heart Disease") ? "selected" : "" %>>Heart Disease</option>
    <option value="COVID-19" <%=patient.getDiagnosis().equals("COVID-19") ? "selected" : "" %>>COVID-19</option>
    <option value="Flu" <%=patient.getDiagnosis().equals("Flu") ? "selected" : "" %>>Flu</option>
</select>


            <label for="allergies" class="form-label">Allergies:</label>
<select id="allergies" name="allergies" class="form-input" required>
    <option value="N/A" <%=patient.getAllergies().equals("N/A") ? "selected" : "" %>>N/A</option>
    <option value="Have" <%=patient.getAllergies().equals("Have") ? "selected" : "" %>>Have</option>
</select>


            <label for="prescriptionStatus" class="form-label">Prescription Status:</label>
<select id="prescriptionStatus" name="prescriptionStatus" class="form-input" required>
    <option value="Pending" <%=patient.getPrescriptionStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
    <option value="Completed" <%=patient.getPrescriptionStatus().equals("Completed") ? "selected" : "" %>>Completed</option>
</select>


            <label for="appointmentDate" class="form-label">Appointment Date:</label>
            <input type="date" id="appointmentDate" name="appointmentDate" class="form-input" value="<%=patient.getAppointmentDate()%>" required />

            <div class="button-group">
                <button type="submit" class="update-button">Update</button>
                <button type="button" class="cancel-button" onclick="window.location.href='DoctorDashboard.jsp';">Cancel</button>
            </div>
        <% } else { %>
            <p style="color: red;">Patient not found or invalid ID!</p>
        <% } %>
    </form>
</body>
</html>
