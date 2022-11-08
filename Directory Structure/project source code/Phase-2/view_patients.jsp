<!DOCTYPE html>
<html lang="en">
<head>
  <title>Patients</title>
   <%@ include file="../links.jsp"%>
</head>
<body
	style="background-color: bodycolor; background-image: url(images/)">
	<%@ include file="admin_home_menu.jsp"%>
<div class="container" style="background-color: #ffffff">
  <h2>Patients</h2>
  
   	<%@ page import="java.sql.*,java.io.*" %>
	<%@page import="java.util.ArrayList"%>
	<%@ page import="java.util.*" %>
	<%@page import="online.database.DBConnection"%>
 	<%
	
 	
	 
try{
     
      

	DBConnection dbase = new DBConnection();
	Connection connect = dbase.getConnection();
	Statement stmt = connect.createStatement();
	  String qry1="select patientid,name,address,mobile,email,registerdate from patients";
	  ResultSet rs=stmt.executeQuery(qry1);
	 if(rs.next())
	  {
		out.println("<br><table class='table table-bordered display' id='table_id'>");
		out.println("<thead class='thead-light'>");
		out.println("<tr>");out.println("<th>patientid</th>");out.println("<th>name</th>");out.println("<th>address</th>");out.println("<th>mobile</th>");out.println("<th>email</th>");out.println("<th>registerdate</th>");		out.println("</tr>");
		out.println("</thead>");
		out.println("<tbody>");
						
		do
		{
			out.println("<tr>");
		 out.println("<td>"+rs.getString("patientid")+"</td>");
		 out.println("<td>"+rs.getString("name")+"</td>");
		 out.println("<td>"+rs.getString("address")+"</td>");
		 out.println("<td>"+rs.getString("mobile")+"</td>");
		 out.println("<td>"+rs.getString("email")+"</td>");
		 out.println("<td>"+rs.getString("registerdate")+"</td>");		out.println("</tr>");
		}while(rs.next());
		out.println("</tbody>");
		out.println("<thead class='thead-light'>");
		out.println("<tr>");out.println("<th>patientid</th>");out.println("<th>name</th>");out.println("<th>address</th>");out.println("<th>mobile</th>");out.println("<th>email</th>");out.println("<th>registerdate</th>");		out.println("</tr>");
		out.println("</thead>");
		out.println("</table></div>");
	  }
	 else
	  {
	 	  out.println("<h3>Records Not Found.</h3>");
	  }
	  stmt.close();
	  connect.close();
	  
	 }
	 catch(Exception ee)
	 {
		 out.println("<h3>Error :"+ee.toString());
	 }
	%>
   </div>
   <br>
   
  
</div>
		<script>
		$(document).ready( function () {
    $('#table_id').DataTable();
} );
		</script>
		
</body>
</html>
