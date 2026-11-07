<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="db.DB,java.sql.*"%>
<%
int tid = Integer.parseInt(request.getParameter("tid"));

String sql = "DELETE from transaction WHERE id = ?";

Connection con = DB.getConnection();
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, tid);

int i = ps.executeUpdate();
if(i==1) { // delete.jsp mein transaction id ka part link karna hai
%>
	<script>
		alert("Transaction Deleted");
		window.location = "dashboard.jsp"
	</script>
	<%
} else {
	%>
	<script>
		alert("ERROR !!! Try Again");
		window.location = "dashboard.jsp"
	</script>
<%
}
ps.close();
con.close();

%>