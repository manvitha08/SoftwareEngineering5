<%@ page import="java.sql.*,java.io.*" %>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" %>
<%@page import="online.database.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Edit Profile</title>
	<%@ include file = "../links.jsp" %>
</head>
<body style="background-color: bodycolor;background-image: url(images/)">
<%@ include file = "patient_home_menu.jsp" %>
<div class="container" style="background-color: #ffffff">
  <h2>Edit Profile</h2>
  <form name='f1' method='post' action="#" enctype="">
	<div class="container">
 
 		<%
	
		
	String qry="select patientid,name,address,mobile,email,password,registerdate from patients where patientid='"+request.getParameter("patientid")+"'";	
	try
	{
		DBConnection dbase = new DBConnection();
		Connection connect = dbase.getConnection();
		Statement st = connect.createStatement();
		ResultSet rs=st.executeQuery(qry);
		
		if(rs.next())
		{
			out.println("<div class='row'>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>patientid</label>");
			out.println("<input type='text' class='form-control' name='patientid' value='"+rs.getString("patientid")+"' readonly>");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>name</label>");
			out.println("<input type='text' class='form-control' name='name' value='"+rs.getString("name")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>address</label>");
			out.println("<input type='text' class='form-control' name='address' value='"+rs.getString("address")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>mobile</label>");
			out.println("<input type='text' class='form-control' name='mobile' value='"+rs.getString("mobile")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>email</label>");
			out.println("<input type='text' class='form-control' name='email' value='"+rs.getString("email")+"' >");
			out.println("</div>");			
			out.println("<div class='col-sm-3'>");
			out.println("<label class='form-check-label'>password</label>");
			out.println("<input type='text' class='form-control' name='password' value='"+rs.getString("password")+"' >");
			out.println("</div>");			
			out.println("</div><hr></hr>");
		}
		else
		{
			out.println("<h1>Records Not Found</h1>");
		}
		st.close();
		connect.close();
	}
	catch(Exception e1)
	{
		out.println("Error e1 :"+e1);
	}
	%>
   <br>
	<button type="submit" name='submit' class="btn btn-default btn-success">Submit</button>
	
	
	
	
	
	
   </form>
   
   <form name='f2' method='post' action='#'>
   	
	<%
	
	if(request.getParameter("submit")!=null)
	{
		try
		{
			DBConnection dbase = new DBConnection();
			Connection connect = dbase.getConnection();
			Statement st = connect.createStatement();
			String updateqry="update patients set name='"+request.getParameter("name")+"',address='"+request.getParameter("address")+"',mobile='"+request.getParameter("mobile")+"',email='"+request.getParameter("email")+"',password='"+request.getParameter("password")+"'  where patientid='"+request.getParameter("patientid")+"'";
			int n=st.executeUpdate(updateqry);
			if(n>0)
				out.print("<script language='javascript'>window.alert('Profile updated successfully');window.location='patient_profile.jsp';</script>");
		
			st.close();
			connect.close();
		}
		catch(Exception e1)
		{
			out.println("Error e1 :"+e1);
		}
	}
	%>
		
   </form>
</div>
		
		
</body>
</html>
