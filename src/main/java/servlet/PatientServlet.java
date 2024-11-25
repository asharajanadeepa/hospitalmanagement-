package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Patient;
import dao.PatientDao;
import exceptions.InvalidPatientException;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/addPatient")
public class PatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create a session to store error messages
        HttpSession session = request.getSession();
        
        // Retrieve form parameters
        String name = request.getParameter("name");
        String diagnosis = request.getParameter("diagnosis");
        String allergies = request.getParameter("allergies");
        String prescriptionStatus = request.getParameter("prescriptionStatus");

        // Validate input fields
        if (name == null || name.isEmpty() || 
            diagnosis == null || diagnosis.isEmpty() || 
            prescriptionStatus == null || prescriptionStatus.isEmpty()) {
            session.setAttribute("errorMessage", "All fields are required.");
            response.sendRedirect("addPatient.jsp"); // Redirect back to the form
            return;
        }

        try {
            // Create Patient object
            Patient patient = new Patient();
            patient.setName(name);
            patient.setDiagnosis(diagnosis);
            patient.setAllergies(allergies);
            patient.setPrescriptionStatus(prescriptionStatus);
            patient.setAppointmentDate(LocalDate.now()); // Set appointment date to now

            // Attempt to add the patient
            PatientDao patientDao = new PatientDao();
            if (patientDao.addPatient(patient)) {
                // Redirect on success
                request.setAttribute("successMessage", "Patient added successfully.");
                request.getRequestDispatcher("DoctorDashboard.jsp").forward(request, response);
            } else {
                session.setAttribute("errorMessage", "Failed to add patient. Please try again.");
                response.sendRedirect("addPatient.jsp");
            }
        } catch (InvalidPatientException e) {
            // Set the error message in the session scope
            session.setAttribute("errorMessage", e.getMessage());
            response.sendRedirect("addPatient.jsp");
        } catch (Exception e) {
            // Handle unexpected exceptions
            e.printStackTrace(); // Log the exception
            session.setAttribute("errorMessage", "An unexpected error occurred. Please try again later.");
            response.sendRedirect("addPatient.jsp");
        }
    }
}
