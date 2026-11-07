<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="db.DB,java.sql.*"%>
<%@ include file="navbar.jsp" %>
<%@ include file="check.jsp" %>    

<%
int userId = (int)session.getAttribute("userId");
String sql = "SELECT * FROM transaction where user_id = ?";
Connection con = DB.getConnection();
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, userId);
ResultSet rs = ps.executeQuery();

double total_dedit = 0;
double total_credit = 0;
double savings = 0;
int transaction_count = 0;

while(rs.next()) {
	transaction_count++;
	if( rs.getString("category").equals("Credit")) {
		total_credit += rs.getDouble("amount");
	} else {
		total_dedit += rs.getDouble("amount");
	}
}
savings = total_credit - total_dedit;
rs = ps.executeQuery();


%>
    
    

    <!-- Main Content -->
    <main class="page-content">

        <div class="container">

            <!-- Page Header -->
            <div class="page-header dashboard-header">

                <div>
                    <h1>Dashboard</h1>
                    <p>Overview of your expenses</p>
                </div>

            </div>


            <!-- Summary Cards -->
            <div class="summary-grid">

                <div class="summary-card">
                    <div class="summary-icon blue">
                        ₹
                    </div>

                    <div>
                        <p>Total Debit</p>
                        <h2>₹<%=total_dedit %></h2>
                    </div>
                </div>


                <div class="summary-card">
                    <div class="summary-icon green">
                        ₹
                    </div>

                    <div>
                        <p>This Credit</p>
                        <h2>₹<%=total_credit%></h2>
                    </div>
                </div>


                <div class="summary-card">
                    <div class="summary-icon yellow">
                        ₹
                    </div>

                    <div>
                        <p>Saving</p>
                        <h2>₹<%=savings%></h2>
                    </div>
                </div>


                <div class="summary-card">
                    <div class="summary-icon purple">
                        #
                    </div>

                    <div>
                        <p>Total Transactions</p>
                        <h2><%=transaction_count%></h2>
                    </div>
                </div>

            </div>


            <!-- Recent Expenses -->
            <section class="table-card">

                <div class="table-header">

                    <h2>Recent Expenses</h2>

                    <a href="add-expense.jsp" class="btn btn-primary btn-small">
                        + Add Expense
                    </a>

                </div>


                <div class="table-wrapper">

                    <table class="expense-table">

                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Date</th>
                                <th>Category</th>
                                <th>Description</th>
                                <th>Amount (₹)</th>
                                <th>Actions</th>
                            </tr>
                        </thead>

                        <tbody>
							<% int i = 0; while(rs.next()) { %>
							
							
                            <tr>
                                <td><%=++i %></td>
                                <td><%=rs.getDate("transaction_date") %></td>
                                <td>
                                    <span class="category category-<%=rs.getString("category").toLowerCase() %>">
                                        <%=rs.getString("category") %>
                                    </span>
                                </td>
                                <td><%=rs.getString("description") %></td>
                                <td><%=rs.getDouble("amount")%></td>
                                <td>
                                    <div class="table-actions">
                                        <a href="edit-expense.jsp?tid=<%=rs.getInt("id") %>""
                                           class="action-btn action-edit">
                                            Edit
                                        </a>

                                        <a href="delete-expense.jsp?tid=<%=rs.getInt("id") %>"
                                           class="action-btn action-delete"
                                           onclick="return confirm('Are Your Sure?')"
                                           >
                                            Delete
                                        </a>
                                    </div>
                                </td>
                            </tr>
							<% } %>

                           

                        </tbody>

                    </table>

                </div>


            </section>

        </div>

    </main>
    
    
<%@ include file="footer.jsp" %>
