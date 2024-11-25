package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.PatientDao;

import java.io.IOException;

@WebServlet("/deletePatient")
public class DeletePatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create an instance of PatientDao within doPost
        PatientDao patientDao = new PatientDao(); // Initialize PatientDao

        // Retrieve patient ID from the request
        String pidStr = request.getParameter("pid");

        if (pidStr == null || pidStr.isEmpty()) {
            request.setAttribute("errorMessage", "Patient ID is missing.");
            request.getRequestDispatcher("DoctorDashboard.jsp").forward(request, response);
            return; // Exit if PID is not provided
        }

        int pid = Integer.parseInt(pidStr);

        // Delete the patient using PatientDao
        boolean isDeleted = patientDao.deletePatient(pid);

        if (isDeleted) {
            // Set success message in request
            request.setAttribute("successMessage", "Patient deleted successfully!");
        } else {
            // Set error message in request
            request.setAttribute("errorMessage", "Error deleting patient. Please try again.");
        }

        // Forward the request back to DoctorDashboard.jsp
        request.getRequestDispatcher("DoctorDashboard.jsp").forward(request, response);
    }
}
