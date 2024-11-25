package servlet;

import java.io.IOException;

import dao.pharmacistDBUtil;
import exceptions.InvalidMedicationException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/medicineInsert")
public class medicineInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public medicineInsert() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String medName = request.getParameter("medName");
        String medDescription = request.getParameter("medDescription");
        String medQuantityStr = request.getParameter("medQuantity");
        String medPriceStr = request.getParameter("medPrice");

        // Create a session to store error messages
        HttpSession session = request.getSession();

        // Validate input fields
     /*   if (medName == null || medName.isEmpty() || 
            medDescription == null || medDescription.isEmpty() || 
            medQuantityStr == null || medQuantityStr.isEmpty() || 
            medPriceStr == null || medPriceStr.isEmpty()) {
            session.setAttribute("errorMessage", "All fields are required.");
            response.sendRedirect("medicineAdd.jsp"); // Redirect back to the form
            return;
        }*/

        try {
            // Parse numeric values safely
            int medQuantity = Integer.parseInt(medQuantityStr);
            String medPrice = medPriceStr; // Keep as string or parse it if needed

            // Perform insertion logic
            boolean isTrue = pharmacistDBUtil.insertMedicine(medName, medDescription, medQuantity, medPrice);

            // Forward to appropriate JSP based on insertion outcome
            if (isTrue) {
                RequestDispatcher dis = request.getRequestDispatcher("insertDash.jsp");
                dis.forward(request, response);
            } else {
                session.setAttribute("errorMessage", "Failed to insert medicine. Please try again.");
                RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
                dis2.forward(request, response);
            }
        } catch (NumberFormatException e) {
            session.setAttribute("errorMessage", "Quantity must be a valid number.");
            response.sendRedirect("medicineAdd.jsp");
        } catch (InvalidMedicationException e) {
            session.setAttribute("errorMessage", e.getMessage());
            response.sendRedirect("medicineAdd.jsp");
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
            session.setAttribute("errorMessage", "An unexpected error occurred. Please try again later.");
            response.sendRedirect("medicineAdd.jsp");
        }
    }
}

