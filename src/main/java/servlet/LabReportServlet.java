package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.LabTest;
import dao.LabTestDao;
import exceptions.InvalidLabTestException;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/addLabReport")
public class LabReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create a session to store error messages
        HttpSession session = request.getSession();
        
        // Gather parameters from the form
        String patientName = request.getParameter("patientName");
        String labTestName = request.getParameter("labTestName");
        String reportStatus = request.getParameter("reportStatus");
        String paymentStatus = request.getParameter("paymentStatus");

        // Validate input fields
        if (patientName == null || patientName.isEmpty() || 
            labTestName == null || labTestName.isEmpty()) {
            session.setAttribute("errorMessage", "Patient name and lab test name are required.");
            response.sendRedirect("addLabReport.jsp"); // Redirect back to the form
            return;
        }

        try {
            // Create LabTest object and set properties
            LabTest labTest = new LabTest();
            labTest.setName(patientName);
            labTest.setLabTest(labTestName);
            labTest.setReportStatus(reportStatus != null ? reportStatus : "Pending");  // Default if not provided
            labTest.setPaymentStatus(paymentStatus != null ? paymentStatus : "Unpaid"); // Default if not provided
            labTest.setTestDate(LocalDate.now());  // Set current date

            // Attempt to add the lab test report to the database
            LabTestDao labTestDao = new LabTestDao();
            if (labTestDao.addLabTest(labTest)) {
                // Redirect with a success message
                session.setAttribute("successMessage", "Lab report added successfully.");
                response.sendRedirect("LaboDashboard.jsp");
            } else {
                session.setAttribute("errorMessage", "Failed to add lab report. Please try again.");
                response.sendRedirect("addLabReport.jsp");
            }
        } catch (InvalidLabTestException e) {
            // Handle validation error
            session.setAttribute("errorMessage", e.getMessage());
            response.sendRedirect("addLabReport.jsp");
        } catch (Exception e) {
            // Handle unexpected errors
            e.printStackTrace(); // Log the exception
            session.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            response.sendRedirect("addLabReport.jsp");
        }
    }
}
