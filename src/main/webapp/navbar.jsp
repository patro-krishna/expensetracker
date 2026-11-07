<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Tracker</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
  <!-- Navbar -->
    <nav class="navbar">
        <div class="container navbar-inner">

            <h2 class="logo">
                Expense Tracker
            </h2>
            
            <% if(session.getAttribute("userId") != null) {  %>
            	 <div class="nav-links">

		            <a href="dashboard.jsp" class="nav-active">
		                Dashboard
		            </a>
		
		            <a href="add-expense.jsp">
		                Add Expense
		            </a>
		
		            <a href="expenses.jsp">
		                View Expenses
		            </a>
		
		            <a href="profile.jsp">
		                Profile
		            </a>
		
		            <a href="logout.jsp">
		                Logout
		            </a>

        		</div>

		        <div class="user-welcome">
		            
		            Welcome, <%= session.getAttribute("name") %>
		        </div>
            <%  } else { %>
            <div class="nav-links">
                <a href="signin.jsp">Login</a>
                <a href="signup.jsp">
                    Register
                </a>
            </div>
            <%  } %>

        </div>
    </nav>
