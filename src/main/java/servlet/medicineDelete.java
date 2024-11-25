package servlet;

import java.io.IOException;

import dao.pharmacistDBUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/medicineDelete")
public class medicineDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the medicine ID
        String id = request.getParameter("id");

        // Perform delete operation
        boolean isTrue = pharmacistDBUtil.deleteMedicine(id);

        // Forward based on deletion result
        if (isTrue) {
            RequestDispatcher dis1 = request.getRequestDispatcher("insertDash.jsp");
            dis1.forward(request, response);
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(request, response);
        }
    }
}
