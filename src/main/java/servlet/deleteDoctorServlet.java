package servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;  // Change from javax to jakarta
import jakarta.servlet.ServletException;  // Change from javax to jakarta
import jakarta.servlet.annotation.WebServlet;  // Change from javax to jakarta
import jakarta.servlet.http.HttpServlet;  // Change from javax to jakarta
import jakarta.servlet.http.HttpServletRequest;  // Change from javax to jakarta
import jakarta.servlet.http.HttpServletResponse;  // Change from javax to jakarta

import dao.DoctorDBUtil;
import model.Doctor;

@WebServlet("/deleteDoctorServlet")
public class deleteDoctorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String id = request.getParameter("id");
        
        boolean isTrue = DoctorDBUtil.deleteDoctor(id);
        
        if(isTrue) {
            RequestDispatcher dis1 = request.getRequestDispatcher("AdminDashboard.jsp");
            dis1.forward(request, response);
             
        } else {
            List<Doctor> docDetails = DoctorDBUtil.getDoctorDetails();
            request.setAttribute("docDetails", docDetails);
            
            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(request, response);
        }
    }
}
