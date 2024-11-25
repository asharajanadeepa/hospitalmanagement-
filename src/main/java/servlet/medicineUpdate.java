package servlet;

import java.io.IOException;

import dao.pharmacistDBUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/medicineUpdate")
public class medicineUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String id = request.getParameter("medid");
        String medName = request.getParameter("medName");
        String medDescription = request.getParameter("medDescription");
        int medQuantity = Integer.parseInt(request.getParameter("medQuantity"));
        String medPrice = request.getParameter("medPrice");

        // Perform update logic
        boolean isTrue = pharmacistDBUtil.updateMedicine(id, medName, medDescription, medQuantity, medPrice);

        // Redirect or forward based on update result
        if (isTrue) {
            request.setAttribute("updateSuccess", "Medicine details updated successfully!");
            response.sendRedirect("insertDash.jsp");
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(request, response);
        }
    }
}
