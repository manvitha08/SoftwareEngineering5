
<%@page import="online.database.DBConnection"%>
<%@ page import="java.sql.*,java.io.*"%>
<%

	Statement stmt = null;

	String shopname = "";
	String ownername = "";
	String address = "";
	String city = "";
	String state = "";
	String mobile = "";
	String email = "";
	String usename = "";
	String password = "";
	if (request.getParameter("shopname") != null)
		shopname = request.getParameter("shopname");
	else
		shopname = "null";
	if (request.getParameter("ownername") != null)
		ownername = request.getParameter("ownername");
	else
		ownername = "null";
	if (request.getParameter("address") != null)
		address = request.getParameter("address");
	else
		address = "null";
	if (request.getParameter("city") != null)
		city = request.getParameter("city");
	else
		city = "null";
	if (request.getParameter("state") != null)
		state = request.getParameter("state");
	else
		state = "null";
	if (request.getParameter("mobile") != null)
		mobile = request.getParameter("mobile");
	else
		mobile = "null";
	if (request.getParameter("email") != null)
		email = request.getParameter("email");
	else
		email = "null";
	if (request.getParameter("usename") != null)
		usename = request.getParameter("usename");
	else
		usename = "null";
	if (request.getParameter("password") != null)
		password = request.getParameter("password");
	else
		password = "null";

	String qry = "insert into pharmacy(shopname,ownername,address,city,state,mobile,email,username,password) values('"
			+ shopname + "','" + ownername + "','" + address + "','" + city + "','" + state + "','" + mobile
			+ "','" + email + "','" + usename + "','" + password + "')";

	try {
		DBConnection dbase = new DBConnection();
		Connection connect = dbase.getConnection();
		stmt=connect.createStatement();

		int n = stmt.executeUpdate(qry);
		if (n == 0)
			out.println(
					"<script language='javascript'>window.alert('Registration Failed.  Try Again!');window.location='pharmacy_registration.jsp';</script>");
		else
			out.println(
					"<script language='javascript'>window.alert('Registration Success.');window.location='pharmacy_login.jsp';</script>");

		stmt.close();
		connect.close();
	} catch (Exception ee) {
		out.println("<h3>Error :" + ee.toString());
	}
%>