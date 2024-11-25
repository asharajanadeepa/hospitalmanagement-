package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Patient;
import dao.PatientDao;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/updatePatient")
public class UpdatePatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pidStr = request.getParameter("pid");

        if (pidStr == null || pidStr.isEmpty()) {
            request.getSession().setAttribute("errorMessage", "Patient ID is missing.");
            response.sendRedirect("DoctorDashboard.jsp");
            return;
        }

        int pid = Integer.parseInt(pidStr);
        PatientDao patientDao = new PatientDao();  // Instantiate PatientDao
        Patient patient = patientDao.getPatientById(pid);  // Fetch patient details

        if (patient == null) {
            request.getSession().setAttribute("errorMessage", "Patient not found.");
            response.sendRedirect("DoctorDashboard.jsp");
            return;
        }

        // Retrieve updated patient details from the form
        String name = request.getParameter("name");
        String diagnosis = request.getParameter("diagnosis");
        String allergies = request.getParameter("allergies");
        String prescriptionStatus = request.getParameter("prescriptionStatus");

        LocalDate appointmentDate;
        try {
            appointmentDate = LocalDate.parse(request.getParameter("appointmentDate"));
        } catch (Exception e) {
            request.getSession().setAttribute("errorMessage", "Invalid date format.");
            response.sendRedirect("updatePatient.jsp?pid=" + pid);
            return;
        }

        // Update the patient object with new data
        patient.setName(name);
        patient.setDiagnosis(diagnosis);
        patient.setAllergies(allergies);
        patient.setPrescriptionStatus(prescriptionStatus);
        patient.setAppointmentDate(appointmentDate);

        // Update patient in the database
        if (patientDao.updatePatient(patient)) {
            request.getSession().setAttribute("successMessage", "Patient updated successfully!");
            response.sendRedirect("DoctorDashboard.jsp");
        } else {
            request.getSession().setAttribute("errorMessage", "Error updating patient.");
            response.sendRedirect("updatePatient.jsp?pid=" + pid);
        }
    }
}
