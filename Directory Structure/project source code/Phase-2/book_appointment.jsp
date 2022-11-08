<%@ page import="java.sql.*,java.io.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<%@page import="online.database.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Appointment</title>
<%@ include file="../links.jsp"%>
</head>
<body
	style="background-color: bodycolor; background-image: url(images/)">
	<%@ include file="patient_home_menu.jsp"%>
	<div class="container" style="background-color: #ffffff">
		<h2>Book Appointment 
		</h2>
		<br>
		<div class="container" style='margin-top:'>
		<%
		try{
			DBConnection dbase = new DBConnection();
			Connection connect = dbase.getConnection();
			Statement st = connect.createStatement();
			
			String qry="select doctorid,name,hospitalname,address,state,city,qualification,specialization,experiance,mobile,email,doctorphoto,consultfee,opentime,closetime from doctors where doctorid="+request.getParameter("doctorid");
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
				 
				 out.println("</tr></table>");
				 out.println("</div><br>");
			}
			
			st.close();
			connect.close();
		} catch (Exception ee) {
		out.println("<h3>Error :" + ee.toString());
		}
		%>    
		</div>
		<form name='ff1' method='post' action='book_appointment_code.jsp'>
		<input type='hidden' name='doctorid' value="<%=request.getParameter("doctorid")%>">
		<input type='hidden' name='accountnumber' value="<%=request.getParameter("accountnumber")%>">
		<input type='hidden' name='consultfee' value="<%=request.getParameter("consultfee")%>">
		<div class='row'>
			<div class='col-sm-4'>
			<label>Type Symptoms..</label>
				<textarea rows="5" cols="50" class='form-control' name='symptoms' required></textarea>
			</div>
		</div>
		<div class='row'>
			<div class='col-sm-4'>
			<label>Card Number</label>
				<input type='number' class='form-control' name='cardno' required>
			</div>
		</div>
		<div class='row'>
			<div class='col-sm-4'>
			<label>Expiry Date</label>
				<input type='text' class='form-control' name='expdate' required>
			</div>
		</div>
		<div class='row'>
			<div class='col-sm-4'>
			<label>CVV</label>
				<input type='number' class='form-control' name='cvv' required>
			</div>
		</div>
		<br>
		<div class='row'>
			<div class='col-sm-2'>
				<input type='submit' class='btn btn-info' name='submit' value='Book Appointment'>
			</div>
		</div>
		</form>

	</div>
<br><br><br><br>
</body>
</html>
