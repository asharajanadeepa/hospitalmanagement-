package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.LabTest;
import dao.LabTestDao;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/updateLabTest")
public class UpdateLabTestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create an instance of LabTestDao
        LabTestDao labTestDao = new LabTestDao(); // Initialize LabTestDao

        // Retrieve lab test ID
        String tidStr = request.getParameter("tid");

        if (tidStr == null || tidStr.isEmpty()) {
            request.getSession().setAttribute("errorMessage", "Lab Test ID is missing.");
            response.sendRedirect("LaboDashboard.jsp");
            return;
        }

        int tid = Integer.parseInt(tidStr);

        // Retrieve other lab test details from the form
        String name = request.getParameter("name");
        String labTestName = request.getParameter("labTest");

        LocalDate testDate;
        try {
            testDate = LocalDate.parse(request.getParameter("testDate"));
        } catch (Exception e) {
            request.getSession().setAttribute("errorMessage", "Invalid date format.");
            response.sendRedirect("updateLabTest.jsp?tid=" + tid);
            return;
        }

        String reportStatus = request.getParameter("reportStatus");
        String paymentStatus = request.getParameter("paymentStatus");

        // Create a LabTest object with updated data
        LabTest labTest = new LabTest();
        labTest.setTid(tid);
        labTest.setName(name);
        labTest.setLabTest(labTestName);
        labTest.setTestDate(testDate);
        labTest.setReportStatus(reportStatus);
        labTest.setPaymentStatus(paymentStatus);

        // Update the lab test in the database using LabTestDao
        if (labTestDao.updateLabTest(labTest)) {
            request.getSession().setAttribute("successMessage", "Lab Test updated successfully!");
            response.sendRedirect("LaboDashboard.jsp");
        } else {
            request.getSession().setAttribute("errorMessage", "Error updating Lab Test. Please try again.");
            response.sendRedirect("updateLabTest.jsp?tid=" + tid);
        }
    }
}
