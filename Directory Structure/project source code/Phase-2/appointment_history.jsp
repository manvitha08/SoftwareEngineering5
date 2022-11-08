<%@ page import="java.sql.*,java.io.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<%@page import="online.database.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>History</title>
<%@ include file="../links.jsp"%>
</head>
<body
	style="background-color: bodycolor; background-image: url(images/)">
	<%@ include file="patient_home_menu.jsp"%>
	<div class="container" style="background-color: #ffffff">
		<h2>History..</h2>
		<div class="container" style='margin-top:'>

			<%
				String path = request.getContextPath(); 
				try {
					DBConnection dbase = new DBConnection();
					Connection connect = dbase.getConnection();
					Statement st = connect.createStatement();
					String qry1 = "select doctorid,appointmentdate,symptoms,prescriptionfile from appointments where patientid='"
							+ session.getAttribute("patientid") + "' order by appointid desc";
					ResultSet rs = st.executeQuery(qry1);
					if (rs.next()) {
						out.println("<br><table class='table table-bordered display' id='table_id'>");
						out.println("<thead class='thead-light'>");
						out.println("<tr>");
						out.println("<th>doctor</th>");
						out.println("<th>appointmentdate</th>");
						out.println("<th>symptoms</th>");
						out.println("<th>prescriptionfile</th>");
						out.println("<th>feedback</th>");
						
						out.println("</tr>");
						out.println("</thead>");
						out.println("<tbody>");

						do {
							out.println("<tr>");
							
							String qry2="select doctorid,name,hospitalname,address,state,city,qualification,specialization,experiance,mobile,email,doctorphoto,consultfee,opentime,closetime,accountnumber from doctors where doctorid="+rs.getString("doctorid");
							Statement st2=connect.createStatement();
							ResultSet rs2 = st2.executeQuery(qry2);
							out.println("<td>");
							if(rs2.next()){
								out.println("" +rs2.getString("name")+"<br>"+rs2.getString("hospitalname")+"<br>"+rs2.getString("address")+","+rs2.getString("mobile"));
							}
							
							
							 out.println("</td>");
							out.println("<td>" + rs.getString("appointmentdate") + "</td>");
							out.println("<td>" + rs.getString("symptoms") + "</td>");
							out.println("<td><A href='" + path + "/uploads/" + rs.getString("prescriptionfile")
									+ "' class='btn btn-sm btn-success' download>Download</A></td>");
							
							out.println("<td><A href='post_feedback.jsp?doctorid="+rs.getString("doctorid")+"' class='btn btn-sm btn-warning'>Give Feedback</A></td>");
							out.println("</tr>");
						} while (rs.next());
						out.println("</tbody>");
						out.println("<thead class='thead-light'>");
						out.println("<tr>");
						out.println("<th>doctor</th>");
						out.println("<th>appointmentdate</th>");
						out.println("<th>symptoms</th>");
						out.println("<th>prescriptionfile</th>");
						out.println("<th>feedback</th>");
						out.println("</tr>");
						out.println("</thead>");
						out.println("</table></div>");
					} else {
						out.println("<h3>Records Not Found.</h3>");
					}
					st.close();
					connect.close();

				} catch (Exception ee) {
					out.println("<h3>Error :" + ee.toString());
				}
			%>
		</div>
		<br>


	</div>
	<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
		});
	</script>

</body>
</html>
