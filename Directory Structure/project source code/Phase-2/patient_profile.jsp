<%@ page import="java.sql.*,java.io.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<%@page import="online.database.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Profile</title>
<%@ include file="../links.jsp"%>
</head>
<body
	style="background-color: bodycolor; background-image: url(images/)">
	<%@ include file="patient_home_menu.jsp"%>
	<div class="container" style="background-color: #ffffff">
		<h2>Profile <A href='patient_profile_edit_code.jsp?patientid=<%=session.getAttribute("patientid")%>'>
		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
		</A></h2>
		<br>
		<div class="container" style='margin-top: -40px'>
		<%
				try{
					DBConnection dbase = new DBConnection();
					Connection connect = dbase.getConnection();
					Statement st = connect.createStatement();
					
					String qry = "select patientid,name,address,mobile,email,password,registerdate from patients";
					ResultSet rs = st.executeQuery(qry);
					if (rs.next()) {
						out.println("<br><table class='table table-sm'>");
							out.println("<tbody");
							out.println("<tr><th>Patient Id:</td><td>" + rs.getString("patientid") + "</td></tr>");
							out.println("<tr><th>Name:</td><td>" + rs.getString("name") + "</td></tr>");
							out.println("<tr><th>Address:</td><td>" + rs.getString("address") + "</td></tr>");
							out.println("<tr><th>Mobile:</td><td>" + rs.getString("mobile") + "</td></tr>");
							out.println("<tr><th>Email:</td><td>" + rs.getString("email") + "</td></tr>");
							out.println("<tr><th>Password:</td><td>" + rs.getString("password") + "</td></tr>");
							out.println("<tr><th>Register Date:</td><td>" + rs.getString("registerdate") + "</td></tr>");
							out.println("</tbody>");
						} 
		
					st.close();
					connect.close();
				} catch (Exception ee) {
					out.println("<h3>Error :" + ee.toString());
				}
			%>
		</div>
		<br>


	</div>
	<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
		});
	</script>

</body>
</html>
