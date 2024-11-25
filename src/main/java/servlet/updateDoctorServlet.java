package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;  // Change from javax to jakarta
import jakarta.servlet.ServletException;  // Change from javax to jakarta
import jakarta.servlet.annotation.WebServlet;  // Change from javax to jakarta
import jakarta.servlet.http.HttpServlet;  // Change from javax to jakarta
import jakarta.servlet.http.HttpServletRequest;  // Change from javax to jakarta
import jakarta.servlet.http.HttpServletResponse;  // Change from javax to jakarta

import dao.DoctorDBUtil;

@WebServlet("/updateDoctorServlet")
public class updateDoctorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String id = request.getParameter("id");
        String name = request.getParameter("full_name");
        String specialization = request.getParameter("specialization");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("date_of_birth");
        String phone = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String joiningDate = request.getParameter("joining_date");
        
        boolean isTrue;
        
        isTrue = DoctorDBUtil.updateDoctor(id, name, gender, dob, specialization, phone, email, address, joiningDate);
        
        if(isTrue) {
            RequestDispatcher dis1 = request.getRequestDispatcher("AdminDashboard.jsp");
            dis1.forward(request, response);
             
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(request, response);
        }
    }
}
