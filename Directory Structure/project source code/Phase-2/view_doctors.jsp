<%@ page import="java.sql.*,java.io.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<%@page import="online.database.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Doctors</title>
   <%@ include file="../links.jsp"%>
</head>
<body
	style="background-color: bodycolor; background-image: url(images/)">
	<%@ include file="admin_home_menu.jsp"%>
<div class="container" style="background-color: #ffffff">
  <h2>Doctors..</h2>
  

 	<%

String path=request.getContextPath(); 
		
	 
try{
     
      

	DBConnection dbase = new DBConnection();
	Connection connect = dbase.getConnection();
	Statement stmt = connect.createStatement();
      stmt = connect.createStatement();
	  String qry1="select doctorid,name,hospitalname,address,state,city,qualification,specialization,experiance,mobile,email,doctorphoto,consultfee,opentime,closetime from doctors";
	  ResultSet rs=stmt.executeQuery(qry1);
	 if(rs.next())
	  {
		out.println("<br><table class='table table-bordered display' id='table_id'>");
		out.println("<thead class='thead-light'>");
		out.println("<tr>");out.println("<th>doctorid</th>");out.println("<th>name</th>");out.println("<th>hospitalname</th>");out.println("<th>address</th>");out.println("<th>state</th>");out.println("<th>city</th>");out.println("<th>qualification</th>");out.println("<th>specialization</th>");out.println("<th>experiance</th>");out.println("<th>mobile</th>");out.println("<th>email</th>");out.println("<th>doctorphoto</th>");out.println("<th>consultfee</th>");out.println("<th>opentime</th>");out.println("<th>closetime</th>");		out.println("</tr>");
		out.println("</thead>");
		out.println("<tbody>");
						
		do
		{
			out.println("<tr>");
		 out.println("<td>"+rs.getString("doctorid")+"</td>");
		 out.println("<td>"+rs.getString("name")+"</td>");
		 out.println("<td>"+rs.getString("hospitalname")+"</td>");
		 out.println("<td>"+rs.getString("address")+"</td>");
		 out.println("<td>"+rs.getString("state")+"</td>");
		 out.println("<td>"+rs.getString("city")+"</td>");
		 out.println("<td>"+rs.getString("qualification")+"</td>");
		 out.println("<td>"+rs.getString("specialization")+"</td>");
		 out.println("<td>"+rs.getString("experiance")+"</td>");
		 out.println("<td>"+rs.getString("mobile")+"</td>");
		 out.println("<td>"+rs.getString("email")+"</td>");
		 out.println("<td><img src='"+path+"/uploads/"+rs.getString("doctorphoto")+"' width='100px' height='100px'></img></td>");
		 out.println("<td>"+rs.getString("consultfee")+"</td>");
		 out.println("<td>"+rs.getString("opentime")+"</td>");
		 out.println("<td>"+rs.getString("closetime")+"</td>");		out.println("</tr>");
		}while(rs.next());
		out.println("</tbody>");
		out.println("<thead class='thead-light'>");
		out.println("<tr>");out.println("<th>doctorid</th>");out.println("<th>name</th>");out.println("<th>hospitalname</th>");out.println("<th>address</th>");out.println("<th>state</th>");out.println("<th>city</th>");out.println("<th>qualification</th>");out.println("<th>specialization</th>");out.println("<th>experiance</th>");out.println("<th>mobile</th>");out.println("<th>email</th>");out.println("<th>doctorphoto</th>");out.println("<th>consultfee</th>");out.println("<th>opentime</th>");out.println("<th>closetime</th>");		out.println("</tr>");
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
