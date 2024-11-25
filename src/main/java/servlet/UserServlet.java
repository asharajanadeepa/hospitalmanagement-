package servlet;

import dao.UserDao;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login") // Maps to the action attribute in Login.jsp form
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserDao(); // Initialize UserDao
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get the username and password from the form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate user credentials
        User user = userDao.validateUser(username, password);

        if (user != null) {
            // Successful login
            HttpSession session = request.getSession();
            session.setAttribute("username", user.getUsername());
            session.setAttribute("name", user.getName());
            session.setAttribute("role", user.getRole());

            // Redirect based on the role of the user
            String role = user.getRole();
            switch (role) {
                case "doctor":
                    response.sendRedirect("DoctorDashboard.jsp");
                    break;
                case "lab_technician":
                    response.sendRedirect("LaboDashboard.jsp");
                    break;
                case "admin":
                    response.sendRedirect("AdminDashboard.jsp");
                    break;
                case "pharmacist":
                    response.sendRedirect("insertDash.jsp");
                    break;
                default:
                    response.sendRedirect("login.jsp");
            }

        } else {
            // Login failed, set error message in session and redirect back to login page
            request.getSession().setAttribute("errorMessage", "Invalid username or password");
            response.sendRedirect("Login.jsp");
        }
    }

}
