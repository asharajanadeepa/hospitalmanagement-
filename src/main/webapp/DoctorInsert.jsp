<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Doctor Form</title>
    <style>
        /* Common body styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0; 
            padding: 0;
            background-color: #139f93;
            color: white;
        }

        /* form Section Styling */
        .form-section {
            position: relative;
            background-color:  #139f93; 
            padding: 4rem 2rem;
            color:white;
            text-align: center;
            z-index: 1;
        }

        .form-section h2 {
            font-size: 3rem;
            color: white;
            margin-bottom: 2rem;
            letter-spacing: 0.1rem;
            font-weight: 600;
            z-index: 2;
            position: relative;
        }

        /* Form Styling */
        form {
            max-width: 600px; /* Wider form */
            margin: 40px auto;
            padding: 30px;
            border-radius: 8px;
            background: linear-gradient(135deg, rgba(61, 229, 212, 0.719), rgba(255, 255, 255, 0.932));
            box-shadow: 0px 4px 10px rgba(49, 45, 110, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"], input[type="email"], input[type="date"], input[type="number"], select {
            width: 90%;
            padding: 1rem;
            margin-bottom: 20px;
            border: 2px solid rgba(255, 255, 255, 0);
            border-radius: 8px;
            background-color: rgba(255, 255, 255, 0.932);
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus, input[type="email"]:focus, input[type="date"]:focus, input[type="number"]:focus, select:focus {
            border-color: rgb(255, 0, 0);
        }

        input[type="submit"] {
            background:  #108076;
            color: white;
            padding: 1rem 2rem;
            font-size: 1.5rem;
            border-radius: 5px;
            cursor: pointer;
            border: 2px solid #108076;
            transition: all 0.3s ease;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: white;
            color: #139f93;
            border-color: #139f93;
            transform: translateY(-3px);
        }
        
        .cancel-button {
    		background: #d9534f; /* Red background */
   			color: white; /* White text */
    		padding: 1rem 2rem; /* Padding */
    		font-size: 1.5rem; /* Font size */
    		border-radius: 5px; /* Rounded corners */
   		 	cursor: pointer; /* Pointer cursor */
    		border: 2px solid #d9534f; /* Same color border */
    		transition: all 0.3s ease; /* Transition effect */
    		width: 100%; /* Full width */
		}

		.cancel-button:hover {
   			background-color: white; /* White background on hover */
    		color: #d9534f; /* Red text on hover */
    		border-color: #d9534f; /* Same color border on hover */
    		transform: translateY(-3px); /* Slight lift on hover */
		}

        /* Media Queries */
        @media (max-width: 768px) {
            form {
                max-width: 100%; /* Full width on smaller screens */
                margin: 20px;
            }
        }
    </style>
</head>
<body>
<c:choose>
		<c:when
			test="${not empty sessionScope.role && sessionScope.role == 'admin'}">
		</c:when>
		<c:otherwise>
			<script>
				window.location.href = "Login.jsp";
			</script>
		</c:otherwise>
	</c:choose>

<div class="form-section">
    <h2>Add New Doctor</h2>
    <form action="insert" method="post">
        <label for="full_name">Full Name:</label>
        <input type="text" id="full_name" name="full_name" required>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender" required>
            <option value="">Select Gender</option>
            <option value="M">Male</option>
            <option value="F">Female</option>
            <option value="O">Other</option>
        </select>

        <label for="date_of_birth">Date of Birth:</label>
        <input type="date" id="date_of_birth" name="date_of_birth" required>

        <label for="specialization">Specialization:</label>
        <input type="text" id="specialization" name="specialization" required>

        <label for="phone_number">Phone Number:</label>
        <input type="text" id="phone_number" name="phone_number" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>

        <label for="joining_date">Joining Date:</label>
        <input type="date" id="joining_date" name="joining_date" required>

        <input type="submit" value="Add Doctor">
        <button type="button" class="cancel-button" onclick="window.location.href='AdminDashboard.jsp';">Cancel</button>
    </form>
</div>

 <script>
        // Function to show an alert if there is an error message
        function showAlert() {
            const urlParams = new URLSearchParams(window.location.search);
            const error = urlParams.get('error');
            const message = urlParams.get('message');

            if (error === 'true' && message) {
                alert(message); // Show the error message
            }
        }

        // Call the showAlert function when the page loads
        window.onload = showAlert;
    </script>

</body>
</html>
