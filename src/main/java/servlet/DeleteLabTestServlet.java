package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.LabTestDao;

import java.io.IOException;

@WebServlet("/deleteLabTest")
public class DeleteLabTestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create an instance of LabTestDao within doPost
        LabTestDao labTestDao = new LabTestDao(); // Initialize LabTestDao

        // Retrieve lab test ID from the request
        String tidStr = request.getParameter("tid");

        if (tidStr == null || tidStr.isEmpty()) {
            request.setAttribute("errorMessage", "Lab Test ID is missing.");
            request.getRequestDispatcher("LaboDashboard.jsp").forward(request, response);
            return; // Exit if TID is not provided
        }

        int tid;
        try {
            tid = Integer.parseInt(tidStr); // Parse the ID
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid Lab Test ID format.");
            request.getRequestDispatcher("LaboDashboard.jsp").forward(request, response);
            return;
        }

        // Delete the lab test using LabTestDao
        boolean isDeleted = labTestDao.deleteLabTest(tid);

        if (isDeleted) {
            // Set success message in request
            request.setAttribute("successMessage", "Lab Test deleted successfully!");
        } else {
            // Set error message in request
            request.setAttribute("errorMessage", "Error deleting lab test. Please try again.");
        }

        // Forward the request back to LaboDashboard.jsp
        request.getRequestDispatcher("LaboDashboard.jsp").forward(request, response);
    }
}
