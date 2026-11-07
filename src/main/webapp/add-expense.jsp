<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,db.DB"%>
<%@ include file="navbar.jsp" %>
<%@ include file="check.jsp" %>    
    <%
    String msg="";
    if(request.getParameter("submit") != null){
    	String date = request.getParameter("date");
    	String category = request.getParameter("category");
    	String description = request.getParameter("description");
    	double amount = Double.parseDouble(request.getParameter("amount"));
		int userId = (int)session.getAttribute("userId");
		Date tdate = Date.valueOf(date);
		
		String sql= "INSERT INTO transaction(user_id,transaction_date,category,description,amount) VALUES(?,?,?,?,?)";
    	Connection con = DB.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
    	
    	ps.setInt(1, userId);
    	ps.setDate(2, tdate);
    	ps.setString(3, category);
    	ps.setString(4, description);
    	ps.setDouble(5, amount);

    	int i = ps.executeUpdate();
    	if(i == 1) {
    		msg = "Transaction Added";
    	} else  {
    		msg = "Something went wrong.Try Again";
    	}
    	ps.close();
    	con.close();
    }
    
    %>
    
    <!-- Main Content -->
    <main class="page-content">

        <div class="container">

            <div class="page-header">
                <h1>Add Expense</h1>
                <p>Add a new expense to keep your spending up to date.</p>
                <p style="color: brown; margin-top:8px;"><%=msg %></p>
            </div>


            <!-- Expense Form -->
            <div class="form-card">

                <form action="add-expense.jsp" method="post">

                    <div class="form-row">

                        <div class="form-group">
                            <label for="date">Date</label>

                            <input
                                type="date"
                                id="date"
                                name="date"
                                required
                            >
                        </div>


                        <div class="form-group">
                            <label for="category">Category</label>

                            <select
                                id="category"
                                name="category"
                                required
                            >
                                <option value="">Select category</option>
                                <option value="Credit">Credit</option>
                                <option value="Food">Food</option>
                                <option value="Transport">Transport</option>
                                <option value="Shopping">Shopping</option>
                                <option value="Utilities">Utilities</option>
                                <option value="Entertainment">Entertainment</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>

                    </div>


                    <div class="form-group">
                        <label for="description">Description</label>

                        <input
                            type="text"
                            id="description"
                            name="description"
                            placeholder="Enter expense description"
                            required
                        >
                    </div>


                    <div class="form-group">
                        <label for="amount">Amount (₹)</label>

                        <input
                            type="number"
                            id="amount"
                            name="amount"
                            placeholder="Enter amount"
                            min="0"
                            step="0.01"
                            required
                        >
                    </div>


                    <div class="form-actions">

                        <a href="dashboard.jsp" class="btn btn-outline">
                            Cancel
                        </a>

                        <button type="submit" name="submit" class="btn btn-primary">
                            Add Expense
                        </button>

                    </div>

                </form>

            </div>

        </div>

    </main>
    
    

<%@ include file="footer.jsp" %>
