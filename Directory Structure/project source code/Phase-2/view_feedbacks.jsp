<%@ page import="java.sql.*,java.io.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<%@page import="online.database.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Feedback</title>
  <%@ include file="../links.jsp"%>
</head>
<body
	style="background-color: bodycolor; background-image: url(images/)">
	<%@ include file="patient_home_menu.jsp"%>
<div class="container" style="background-color: #ffffff">
  <h2>Feedbacks..</h2>
  <br><br>
     
   <div class="container" style='margin-top:-40px'>
  
 	<%
	 
try{
     
	DBConnection dbase = new DBConnection();
	Connection connect = dbase.getConnection();
	Statement st = connect.createStatement();
		String qry1="select date,patientid,doctorid,feedback,rating from feedback";
	  ResultSet rs=st.executeQuery(qry1);
	 if(rs.next())
	  {
		out.println("<br><table class='table table-bordered display' id='table_id'>");
		out.println("<thead class='thead-light'>");
		out.println("<tr>");
		out.println("<th>date</th>");
		out.println("<th>doctor</th>");
		out.println("<th>feedback</th>");
		out.println("<th>rating</th>");
		out.println("</tr>");
		out.println("</thead>");
		out.println("<tbody>");
						
		do
		{
			out.println("<tr>");
		 out.println("<td>"+rs.getString("date")+"</td>");
		 String qry2="select doctorid,name,hospitalname,address,state,city,qualification,specialization,experiance,mobile,email,doctorphoto,consultfee,opentime,closetime,accountnumber from doctors where doctorid="+rs.getString("doctorid");
			Statement st2=connect.createStatement();
			ResultSet rs2 = st2.executeQuery(qry2);
			out.println("<td>");
			if(rs2.next()){
				out.println("" +rs2.getString("name")+"<br>"+rs2.getString("hospitalname")+"<br>"+rs2.getString("address")+","+rs2.getString("mobile"));
			}
			
			
			 out.println("</td>");
		
		 out.println("<td>"+rs.getString("feedback")+"</td>");
		 out.println("<td>"+rs.getString("rating")+"</td>");
		 out.println("</tr>");
		}while(rs.next());
		out.println("</tbody>");
		out.println("<thead class='thead-light'>");
		out.println("<tr>");
		out.println("<th>date</th>");
		out.println("<th>doctor</th>");
		out.println("<th>feedback</th>");
		out.println("<th>rating</th>");
		out.println("</tr>");
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
