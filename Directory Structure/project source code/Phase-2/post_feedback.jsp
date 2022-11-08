<%@ page import="java.sql.*,java.io.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<%@page import="online.database.DBConnection"%>
<html lang="en">
<head>
<title>Feedback</title>
<%@ include file="../links.jsp"%>
</head>
<body
	style="background-color: bodycolor; background-image: url(images/)">
	<%@ include file="patient_home_menu.jsp"%>
	<section>
		<div class="container" style="background-color: #ffffff; width: 50%">
			<div class="row">

				<div class="col-md-12">
					<h3>Post Feedback</h3>
					<form name='f1' method='post' action="post_feedback_code.jsp"
						enctype="">
						<input type='hidden' name='doctorid' value="<%=request.getParameter("doctorid") %>">
						<div class='row'>
							<div class='col-md-12'>
								<label for='feedback'>feedback:</label>
								<textarea rows='3' class='form-control' id='feedback'
									placeholder='feedback' name='feedback' required></textarea>
							</div>
						</div>
						<div class='row'>
							<div class='col-md-12'>
								<label for='rating'>rating:</label> <select class='form-control'
									id='rating' name='rating'>
									<option>5</option>
									<option>4</option>
									<option>3</option>
									<option>2</option>
									<option>1</option>
								</select>
							</div>
						</div>


						<div class='col-md-12'>
							<br> <input type="submit" name="submit"
								class="btn btn-danger form-control" value="Add">
						</div>
				</div>
				</form>
			</div>
		</div>

	</section>

</body>
</html>
