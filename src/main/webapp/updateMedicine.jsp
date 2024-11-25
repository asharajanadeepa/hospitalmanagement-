<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Medicine</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #1a1a1d;
            color: #fff;
            margin: 0;
            padding: 0;
        }

        .modal {
            display: block; /* Set to 'none' to hide the modal initially */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.85); /* Dark overlay with higher opacity */
            display: flex;
            justify-content: center;
            align-items: center;
            animation: fadeIn 0.5s ease-in-out;
        }

        .modal-content {
            background-color: #2d2d34;
            border-radius: 12px;
            width: 35%;
            max-width: 500px;
            padding: 25px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            transform: translateY(-20px);
            opacity: 0;
            animation: slideIn 0.6s forwards;
        }

        .modal-header h2 {
            margin: 0;
            padding-bottom: 15px;
            font-size: 24px;
            color: #ffcc00;
            border-bottom: 1px solid #555;
            text-align: center;
        }

        .modal-body {
            margin-top: 20px;
        }

        .modal-body label {
            display: block;
            margin-bottom: 8px;
            color: #ccc;
            font-size: 14px;
        }

        .modal-body input[type="text"],
        .modal-body input[type="number"],
        .modal-body textarea,
        .modal-body input[type="url"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: none;
            background-color: #3d3d46;
            color: #fff;
            font-size: 14px;
            outline: none;
            transition: all 0.3s ease;
        }

        .modal-body input:focus,
        .modal-body textarea:focus {
            background-color: #46464f;
            border-left: 4px solid #ffcc00;
        }

        .modal-body textarea {
            height: 90px;
            resize: none;
        }

        .modal-footer {
            text-align: right;
            padding-top: 10px;
        }

        .modal-footer button {
            padding: 12px 20px;
            border-radius: 8px;
            border: none;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .cancel-btn {
            background-color: #e74c3c;
            color: white;
            margin-right: 10px;
        }

        .cancel-btn:hover {
            background-color: #c0392b;
        }

        .add-btn {
            background-color: #2ecc71;
            color: white;
        }

        .add-btn:hover {
            background-color: #27ae60;
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                background-color: rgba(0, 0, 0, 0);
            }
            to {
                background-color: rgba(0, 0, 0, 0.85);
            }
        }

        @keyframes slideIn {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .modal-content {
                width: 90%;
            }
        }

        @media (max-width: 480px) {
            .modal-content {
                width: 100%;
                padding: 20px;
            }

            .modal-header h2 {
                font-size: 20px;
            }

            .modal-footer button {
                padding: 10px 18px;
                font-size: 12px;
            }
        }

    </style>
</head>
<body>
<c:choose>
		<c:when
			test="${not empty sessionScope.role && sessionScope.role == 'pharmacist'}">
		</c:when>
		<c:otherwise>
			<script>
                window.location.href = "Login.jsp";
            </script>
		</c:otherwise>
	</c:choose>

	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String Quantity = request.getParameter("Quantity");
		String price = request.getParameter("price");
	%>
	


    <div id="medicineModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Update Medicine</h2>
            </div>
            <div class="modal-body">
                <form action="Update" method="post">
                
                    <input type="hidden" name="medid" value="<%= id %>"  readonly/>
                
                    <label for="medName">Medicine Name</label>
                    <input type="text" name="medName" placeholder="Enter Medicine Name" value="<%= name %>" />

                    <label for="medDescription">Description</label>
                    <textarea name="medDescription" placeholder="Enter Description"><%= description %> </textarea>

                    <label for="medQuantity">Quantity</label>
                    <input type="number" name="medQuantity" placeholder="Enter Quantity" value="<%= Quantity %>"   />

                    <label for="medPrice">Price</label>
                    <input type="number" name="medPrice" placeholder="Enter Price" step="0.01" min="0" value="<%= price %>"  />
                    
                    <div class="modal-footer">
                        <button type="button" class="cancel-btn" onclick="window.location.href='insertDash.jsp'">Cancel</button>
                        <button class="add-btn" type="submit"> Update Medicine</button>
                    </div>
                </form> 
            </div>
        </div>
    </div>
</body>
</html>
