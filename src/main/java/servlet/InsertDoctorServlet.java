package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;  // Updated
import jakarta.servlet.ServletException;  // Updated
import jakarta.servlet.annotation.WebServlet;  // Updated
import jakarta.servlet.http.HttpServlet;  // Updated
import jakarta.servlet.http.HttpServletRequest;  // Updated
import jakarta.servlet.http.HttpServletResponse;  // Updated

import exceptions.InvalidPhoneNumberException;
import dao.DoctorDBUtil;

@WebServlet("/InsertDoctorServlet")
public class InsertDoctorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String name = request.getParameter("full_name");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("date_of_birth");
        String specialization = request.getParameter("specialization");
        String phone = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String joiningDate = request.getParameter("joining_date");
        
        boolean isTrue;
        
        try {
            DoctorDBUtil.validatePhoneNumber(phone);
            isTrue = DoctorDBUtil.insertDoctor(name, gender, dob, specialization, phone, email, address, joiningDate);
        } catch (InvalidPhoneNumberException e) {
            response.sendRedirect("DoctorInsert.jsp?error=true&message=" + e.getMessage());
            return;
        }

        if (isTrue) {
            RequestDispatcher dis1 = request.getRequestDispatcher("AdminDashboard.jsp");
            dis1.forward(request, response);
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(request, response);
        }
    }
}
