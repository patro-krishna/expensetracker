<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="db.DB,java.sql.*" %>
<%@ include file="navbar.jsp" %>

<%
    String msg="";
    if(request.getParameter("submit") != null){
    	
    	String email = request.getParameter("username");
    	String password = request.getParameter("password");

    	
    	String qry= "SELECT * FROM user WHERE email = ? AND password = ?";
    	Connection con = DB.getConnection();
    	PreparedStatement ps = con.prepareStatement(qry);
    	
    	ps.setString(1, email);
    	ps.setString(2, password);
    	
    	ResultSet rs = ps.executeQuery();
    	if(rs.next()) {
    		//msg = "Login Success";
    		int userId = rs.getInt("id");  
    		String name = rs.getString("name");
    		session.setAttribute("userId" , userId);  
    		session.setAttribute("name" , name); // welcome page display
    		response.sendRedirect("dashboard.jsp");
    	} else  {
    		msg = "Invalid Email or Password";
    	}
    	rs.close();
    	ps.close();
    	con.close();	
    }
    
%>

 <main class="auth-page">

        <div class="auth-container">

            <h1 class="auth-logo">Login to your account</h1>

            <div class="auth-divider"></div>
			<p><%=msg %></p>
			
            <form action="signin.jsp" method="post" class="auth-form">

                <div class="form-group">
                    <label for="username">Email / Username</label>

                    <input
                        type="text"
                        id="username"
                        name="username"
                        placeholder="Enter your email or username"
                        required
                    >
                </div>


                <div class="form-group">
                    <label for="password">Password</label>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Enter your password"
                        required
                    >
                </div>


                <div class="form-checkbox">
                    <input
                        type="checkbox"
                        id="remember"
                        name="remember"
                    >

                    <label for="remember">Remember me</label>
                </div>


                <button type="submit" name="submit" class="btn btn-primary btn-block">
                    Login
                </button>

            </form>


            <p class="auth-footer-text">
                Don't have an account?
                <a href="signup.jsp">Register here</a>
            </p>

        </div>

    </main>


<%@ include file="footer.jsp" %>