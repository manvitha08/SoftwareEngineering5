<%@ page import="java.sql.*,java.io.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="online.database.DBConnection"%>
<%
	

	String feedback = "";
	String rating = "";
	if (request.getParameter("feedback") != null)
		feedback = request.getParameter("feedback");
	else
		feedback = "null";
	
	if (request.getParameter("rating") != null)
		rating = request.getParameter("rating");
	else
		rating = "null";

	String qry = "insert into feedback(date,patientid,doctorid,feedback,rating) values(curdate(),'"+session.getAttribute("patientid")+"','"+request.getParameter("doctorid")+"','" + feedback + "','" + rating + "')";

	try {

		DBConnection dbase = new DBConnection();
		Connection conn = dbase.getConnection();
		Statement stmt = conn.createStatement();
		int n = stmt.executeUpdate(qry);
		if (n == 0)
			out.println("<script language='javascript'>window.alert('Feedback Not Added.  Try Again!');window.location='appointment_history.jsp';</script>");
		else
			out.println("<script language='javascript'>window.alert('Feeback Added Successfully.');window.location='appointment_history.jsp';</script>");

		stmt.close();
		conn.close();
	} catch (Exception ee) {
		out.println("<h3>Error :" + ee.toString());
	}
%>