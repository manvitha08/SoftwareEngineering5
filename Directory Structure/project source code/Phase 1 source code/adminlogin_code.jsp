
<%@ page import="java.sql.*,java.io.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="online.database.DBConnection"%>
<%
	DBConnection db = new DBConnection();
	Connection conn = db.getConnection();

	String username = "";
	String password = "";
	if (request.getParameter("username") != null)
		username = request.getParameter("username");
	else
		username = "null";
	if (request.getParameter("password") != null)
		password = request.getParameter("password");
	else
		password = "null";
	
	String qry = "select * from admin where username='" + username + "' and password='" + password + "'";
	try {

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(qry);
		if (rs.next()) {

			session.setAttribute("username", username);
		
			response.sendRedirect("admin/admin_home.jsp");
		} else {
			response.sendRedirect("adminlogin.jsp?msg=Invalid username/password");
		}

		stmt.close();
		conn.close();
	} catch (Exception ee) {
		out.println("<h3>Error :" + ee.toString());
	}
%>