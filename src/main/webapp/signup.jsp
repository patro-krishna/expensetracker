<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="db.DB,java.sql.*" %>
<%@ include file="navbar.jsp" %>
    
    <%
    String msg="";
    if(request.getParameter("submit") != null){
    	String name = request.getParameter("fullName");
    	String email = request.getParameter("username");
    	String password = request.getParameter("password");

    	//out.println(name+""+email+""+password);
    	String qry= "INSERT INTO user(name,email,password) VALUES(?,?,?)";
    	Connection con = DB.getConnection();
    	PreparedStatement ps = con.prepareStatement(qry);
    	
    	ps.setString(1, name);
    	ps.setString(2, email);
    	ps.setString(3, password);
    	
    	int i = ps.executeUpdate();
    	if(i == 1) {
    		msg = "Account Created. Login to continue";
    	} else  {
    		msg = "Something went wrong.Try Again";
    	}
    	ps.close();
    	con.close();
    }
    
    %>
    
    
    <main class="auth-page">

        <div class="auth-container register-container">

            <h1 class="auth-logo">Create a new account</h1>

            <div class="auth-divider"></div>
            <p><%=msg %></p>

            <form action="signup.jsp" method="post" class="auth-form">

                <div class="form-group">
                    <label for="fullName">Full Name</label>

                    <input
                        type="text"
                        id="fullName"
                        name="fullName"
                        placeholder="Enter your full name"
                        required
                    >
                </div>


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


                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>

                    <input
                        type="password"
                        id="confirmPassword"
                        name="confirmPassword"
                        placeholder="Confirm your password"
                        required
                    >
                </div>


                <button type="submit" name="submit" class="btn btn-primary btn-block">
                    Register
                </button>

            </form>


            <p class="auth-footer-text">
                Already have an account?
                <a href="signin.jsp">Login here</a>
            </p>

        </div>

    </main>
    
    
<%@ include file="footer.jsp" %>