<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,db.DB"%>
<%@ include file="navbar.jsp" %>
<%@ include file="check.jsp" %>    
    <%
    String msg="";
    int tid = Integer.parseInt(request.getParameter("tid"));
    if(request.getParameter("submit") != null){
    	String date = request.getParameter("date");
    	String category = request.getParameter("category");
    	String description = request.getParameter("description");
    	double amount = Double.parseDouble(request.getParameter("amount"));
		int userId = (int)session.getAttribute("userId");
		Date tdate = Date.valueOf(date);
		
		String sql= "UPDATE transaction SET transaction_date=?, category=?, description=?, amount=? WHERE id=?";
    	Connection con = DB.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
    	
    	
    	ps.setDate(1, tdate);
    	ps.setString(2, category);
    	ps.setString(3, description);
    	ps.setDouble(4, amount);
		ps.setInt(5, tid);
    	int i = ps.executeUpdate();
    	if(i == 1) {
    		msg = "Transaction Updated";
    	} else  {
    		msg = "Something went wrong.Try Again";
    	}
    	ps.close();
    	con.close();
    }
    
    Date tdate = null;
    String category = null;
    String description = null;
    double amount = 0;
    
    String sql = "SELECT * FROM transaction WHERE ID = ?";
    Connection con = DB.getConnection();
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, tid);
    ResultSet rs = ps.executeQuery();
    if(rs.next()) {
    	tdate = rs.getDate("transaction_date");
    	category = rs.getString("category");
    	description = rs.getString("description");
    	amount = rs.getDouble("amount");
    }
    rs.close();
    ps.close();
	con.close();
    
    
    %>
    
    <!-- Main Content -->
    <main class="page-content">

        <div class="container">

            <div class="page-header">
                <h1>Update Expense</h1>
                <p>Update an existing expense.</p>
                <p style="color: brown; margin-top:8px;"><%=msg %></p>
            </div>


            <!-- Expense Form -->
            <div class="form-card">

                <form action="edit-expense.jsp?tid=<%=tid %>" method="post"> / delete.jsp mein transaction id ka part link karna hai

                    <div class="form-row">

                        <div class="form-group">
                            <label for="date">Date</label>

                            <input
                                type="date"
                                id="date"
                                name="date"
                                value = "<%=tdate.toString() %>"
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
                                <option value="Credit"
                                <%= category.equals("Credit") ? "selected" : "" %>
                                >Credit</option>
                                <option value="Food"
                                <%= category.equals("Food") ? "selected" : "" %>                              
                                >Food</option>
                                <option value="Transport"
                                <%= category.equals("Transport") ? "selected" : "" %>
                                >Transport</option>
                                <option value="Shopping"
                                <%= category.equals("Shopping") ? "selected" : "" %>
                                >Shopping</option>
                                <option value="Utilities"
                                <%= category.equals("Utilities") ? "selected" : "" %>
                                >Utilities</option>
                                <option value="Entertainment"
                                <%= category.equals("Enviroment") ? "selected" : "" %>
                                >Entertainment</option>
                                <option value="Other"
                                <%= category.equals("Other") ? "selected" : "" %>
                                >Other</option>
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
                            value = "<%=description %>"
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
                            value = "<%=amount %>"
                            required
                        >
                    </div>


                    <div class="form-actions">

                        <a href="dashboard.jsp" class="btn btn-outline">
                            Cancel
                        </a>

                        <button type="submit" name="submit" class="btn btn-primary">
                            Update Expense
                        </button>

                    </div>

                </form>

            </div>

        </div>

    </main>
    
    

<%@ include file="footer.jsp" %>
