	<%@page import="online.database.DBConnection"%>
<%@ page import="java.sql.*,java.io.*" %>
	<%@page import="java.util.ArrayList"%>
	<%@ page import="java.util.*" %>
    <%@ page import="java.util.Iterator" %>
	<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.FileItem"%>
    <%@ page import="org.apache.commons.fileupload.FileUpload"%>

	
	
	<%
	
 
    
Statement stmt = null;
	
String username="";
String password="";		
			if(request.getParameter("username")!=null)
				username=request.getParameter("username");
			else
				username="null";		
			if(request.getParameter("password")!=null)
				password=request.getParameter("password");
			else
				password="null";
String qry="select * from pharmacy where username='"+username+"' and password='"+password+"'";	 
try{
     
	DBConnection dbase = new DBConnection();
	Connection connect = dbase.getConnection();
      stmt = connect.createStatement();
	  ResultSet rs=stmt.executeQuery(qry);
	  if(rs.next())
	  {
		  		
		session.setAttribute("username",username);		
		session.setAttribute("password",password);
		  response.sendRedirect("pharmacy/pharmacy_home.jsp");
	  }
	  else
	  {
		  response.sendRedirect("pharmacy_login.jsp?msg=Invalid username/password");
	  }
	 
	  stmt.close();
	  connect.close();
	 }
	 catch(Exception ee)
	 {
		 out.println("<h3>Error :"+ee.toString());
	 }
	 %>