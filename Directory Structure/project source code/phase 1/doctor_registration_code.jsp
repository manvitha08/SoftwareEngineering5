
<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileUpload"%>
<%@page import="online.database.DBConnection"%>


<%
	try {
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();
		Statement stmt = conn.createStatement();

		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;

		String path = application.getRealPath("/");

		String str = path.substring(0, path.indexOf(".metadata") - 1);

		String str1 = path.substring(path.lastIndexOf("\\", path.length() - 2));

		path = str + str1 + "WebContent/";

		File ProjectDir = new File(path + "/uploads");

		if (!ProjectDir.exists()) {
			ProjectDir.mkdirs();
		}

		try {

			items = upload.parseRequest(request);
		} catch (Exception e) {
			out.println("Error" + e.getMessage());
		}
		Iterator itr = items.iterator();

		String uploadpath = path + "/uploads";
		ArrayList<String> colnames = new ArrayList<String>();
		ArrayList<String> colvalues = new ArrayList<String>();

		while (itr.hasNext()) {

			FileItem item = (FileItem) itr.next();

			if (item.isFormField()) {

				if (!item.getFieldName().equals("cpassword")) {
					String name = item.getFieldName();
					String value = item.getString();
					colvalues.add(value);
				}

			} else {
				try {

					int r = getRandomNumber(100000, 9999999);

					String fileName = new File(item.getName()).getName();
					colvalues.add(r + fileName);

					String contentType = getServletContext().getMimeType(fileName);

					item.write(new File(uploadpath + File.separator + (r + fileName)));
				} catch (Exception ste) {
					out.println("Exception Uploading File : " + ste);
				}
			}
		}

		String qry = "insert into doctors (name,hospitalname,address,state,city,qualification,specialization,experiance,mobile,email,doctorphoto,certificatefile,consultfee,password,accountnumber,registerdate,opentime,closetime) values ("
				+ "'" + colvalues.get(0) + "'," + "'" + colvalues.get(1) + "'," + "'" + colvalues.get(2) + "',"
				+ "'" + colvalues.get(3) + "'," + "'" + colvalues.get(4) + "'," + "'" + colvalues.get(5) + "',"
				+ "'" + colvalues.get(6) + "'," + "'" + colvalues.get(7) + "'," + "'" + colvalues.get(8) + "',"
				+ "'" + colvalues.get(9) + "'," + "'" + colvalues.get(10) + "'," + "'" + colvalues.get(11)
				+ "'," + "'" + colvalues.get(12) + "'," + "'" + colvalues.get(13) + "'," + "'"
				+ colvalues.get(14) + "'," + "'" + colvalues.get(15) + "'," + "'" + colvalues.get(16) + "',"
				+ "'" + colvalues.get(17) + "')";

		int n = stmt.executeUpdate(qry);
		if (n > 0)
			out.println(
					"<script language='javascript'>window.alert('Registration Success.');window.location='doctor_login.jsp';</script>");
		else
			out.println(
					"<script language='javascript'>window.alert('Registration Failed.  Try Again!');window.location='doctor_registration.jsp';</script>");

		stmt.close();
		conn.close();
	} catch (Exception ee) {
		out.println("<h3>Error :" + ee.toString());
	}
%>
<%!
	public int getRandomNumber(int from, int to) {
		Random random = new Random();
		long fact = (long) ((to - from + 1) * random.nextDouble());
		return ((int) (fact + from));
	}%>