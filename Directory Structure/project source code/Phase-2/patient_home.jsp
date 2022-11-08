<%@ page import="java.sql.*,java.io.*"%>
<%@page import="online.database.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home</title>
  <%@ include file = "../links.jsp" %>

</head>
<body style="background-color: bodycolor;background-image: url(images/)">
<%@ include file = "patient_home_menu.jsp" %>
<div class="container">
	 <form name='fform1'  action='#' method='GET'>
		<div class='row'>
			<div class='col-sm-4'>
			<input type='text' name='search' class='form-control' placeholder='search doctor'>
			</div>
			<div class='col-sm-2'>
				<input type='submit' name='submit' value='Search' class='form-control btn btn-secondary'>
			</div>
	 	</div>
	 </form>
</div>
<br>  
<div class="container-fluid bg-3 text-center">

<%
try{
	DBConnection dbase = new DBConnection();
	Connection connect = dbase.getConnection();
	Statement st = connect.createStatement();
	
	String qry="";
	
	if(request.getParameter("search")!=null)
		qry="select doctorid,name,hospitalname,address,state,city,qualification,specialization,experiance,mobile,email,doctorphoto,consultfee,opentime,closetime,accountnumber from doctors where specialization like '%" + request.getParameter("search") + "%'";
	else
		qry="select doctorid,name,hospitalname,address,state,city,qualification,specialization,experiance,mobile,email,doctorphoto,consultfee,opentime,closetime,accountnumber from doctors";
	
	
	ResultSet rs=st.executeQuery(qry);
	String path=request.getContextPath();
	while(rs.next())
	{
		out.println("<div class='card'>");
		//out.println("<td>"+rs.getString("doctorid")+"</td>");
		out.println("<table class='table table-sm borderless'>");
		out.println("<tr>");
		out.println("<td><img src='"+path+"/uploads/"+rs.getString("doctorphoto")+"' width='100px' height='100px'></img></td>");
		out.println("<td align='left'>");
		out.println("<b>Doctor Name:</b>"+rs.getString("name"));
		 out.println("<br><b>Hospital Name:</b>"+rs.getString("hospitalname"));
		 out.println("<br><b>Address:</b>"+rs.getString("address")+","+rs.getString("city")+","+rs.getString("state"));
		 out.println("<br><b>Qualification:</b>"+rs.getString("qualification"));
		 out.println("<br><b>Specilization:</b>"+rs.getString("specialization"));
		 out.println("&nbsp;&nbsp;&nbsp;Experiance:</b>"+rs.getString("experiance"));
		 out.println("<br><b>Fee:</b>"+rs.getString("consultfee"));
		 out.println(" <b>OpenTime:</b>"+rs.getString("opentime"));
		 out.println(" <b>CloseTime:</b>"+rs.getString("closetime"));
		 out.println("</td>");
		 out.println("<td><A href='book_appointment.jsp?doctorid="+rs.getString("doctorid")+"&accountnumber="+rs.getString("accountnumber")+"&consultfee="+rs.getString("consultfee")+"' class='btn btn-success'>Book Appointment</A></td>");
		 out.println("</tr></table>");
		 out.println("</div><br>");
	}
	st.close();
	connect.close();
} catch (Exception ee) {
out.println("<h3>Error :" + ee.toString());
}
%>    
   
  

</body>
</html>
