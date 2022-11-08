<%@ page import="java.sql.*,java.io.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<%@page import="online.database.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Appointments</title>
 <%@ include file="../links.jsp"%>
</head>
<body
	style="background-color: bodycolor; background-image: url(images/)">
	<%@ include file="doctor_home_menu.jsp"%>
	
<div class="container" style="background-color: #ffffff">
  <h2>Appointments</h2>
  
   <div class="container" style='margin-top:'>
	<%
	
 
	
String path=request.getContextPath(); 
		
	 
try{
     
	DBConnection dbase = new DBConnection();
	Connection connect = dbase.getConnection();
	Statement st = connect.createStatement();
	String qry1="select appointid,doctorid,patientid,appointmentdate,symptoms,prescriptionfile from appointments";
	  ResultSet rs=st.executeQuery(qry1);
	 if(rs.next())
	  {
		out.println("<br><table class='table table-bordered display' id='table_id'>");
		out.println("<thead class='thead-light'>");
		out.println("<tr>");out.println("<th>appointid</th>");out.println("<th>doctorid</th>");out.println("<th>patientid</th>");out.println("<th>appointmentdate</th>");out.println("<th>symptoms</th>");out.println("<th>prescriptionfile</th>");		out.println("</tr>");
		out.println("</thead>");
		out.println("<tbody>");
						
		do
		{
			out.println("<tr>");
		 out.println("<td>"+rs.getString("appointid")+"</td>");
		 out.println("<td>"+rs.getString("doctorid")+"</td>");
		 out.println("<td>"+rs.getString("patientid")+"</td>");
		 out.println("<td>"+rs.getString("appointmentdate")+"</td>");
		 out.println("<td>"+rs.getString("symptoms")+"</td>");
		 out.println("<td><A href='"+path+"/uploads/"+rs.getString("prescriptionfile")+"' download>Download</A></td>");		out.println("</tr>");
		}while(rs.next());
		out.println("</tbody>");
		out.println("<thead class='thead-light'>");
		out.println("<tr>");out.println("<th>appointid</th>");out.println("<th>doctorid</th>");out.println("<th>patientid</th>");out.println("<th>appointmentdate</th>");out.println("<th>symptoms</th>");out.println("<th>prescriptionfile</th>");		out.println("</tr>");
		out.println("</thead>");
		out.println("</table></div>");
	  }
	 else
	  {
	 	  out.println("<h3>Records Not Found.</h3>");
	  }
	  st.close();
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
