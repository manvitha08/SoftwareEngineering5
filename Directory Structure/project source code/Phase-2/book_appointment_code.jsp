
<%@ page import="java.sql.*,java.io.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="online.database.DBConnection"%>
<%
	DBConnection dbase = new DBConnection();
	Connection con = dbase.getConnection();
	String qry = "select * from bank where cardnumber='"+request.getParameter("cardno")+"' and expirydate='"+request.getParameter("expdate")+"' and cvv='"+request.getParameter("cvv")+"'"; 
	try {
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(qry);
		String patientAccountNumber="";
		if (rs.next()) {
			patientAccountNumber=rs.getString("accountnumber");
			String qry1="insert into appointments(doctorid,patientid,appointmentdate,symptoms) values('"+request.getParameter("doctorid")+"','"+session.getAttribute("patientid").toString()+"',now(),'"+request.getParameter("symptoms")+"')";
			st.executeUpdate(qry1);
			
			qry1="update bank set balance=balance+"+request.getParameter("consultfee")+" where accountnumber='"+request.getParameter("accountnumber")+"'";
			System.out.println(qry1);
			st.executeUpdate(qry1);
			
			qry1="update bank set balance=balance-"+request.getParameter("consultfee")+" where cardnumber='"+request.getParameter("cardno")+"'";
			System.out.println(qry1);
			st.executeUpdate(qry1);
			
			qry1="insert into transactions(date,toaccountnumber,fromaccountnumber,amount) values(curdate(),'"+request.getParameter("accountnumber")+"','"+patientAccountNumber+"','"+request.getParameter("consultfee")+"')";
			System.out.println(qry1);
			st.executeUpdate(qry1);
			
			out.println("<script language='javascript'>window.alert('appointment booked');</script>");
			response.sendRedirect("patient_home.jsp");
		} else {
			out.println("<script language='javascript'>window.alert('invalid card number'); history.back();</script>");
			
		}

		st.close();
		con.close();
	} catch (Exception ee) {
		out.println("<h3>Error :" + ee.toString());
	}
%>