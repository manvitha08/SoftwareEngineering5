<!DOCTYPE html>
<html lang="en">
<head>
<title>Pharmacy</title>
<%@ include file="links.jsp"%>
</head>
<body
	style="background-color: bodycolor; background-image: url(images/)">
	<%@ include file="home_menu.jsp"%>
	<div class="container" style="background-color: #ffffff; width: %">
		<br>
		<div class='row text-center'>
			<div class='col-md-4'>
				<h3>Pharmacy Login</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4  ">
				<form name='f1' method='post' action="pharmacy_login_code.jsp"
					enctype="">
					<label for='username'>username:</label> <input type='text'
						class='form-control' id='username' placeholder='Enter username'
						name='username' required>
			</div>
		</div>
		<div class='row'>
			<div class='col-sm-4'>
				<label for='password'>password:</label> <input type='password'
					class='form-control' id='password' placeholder='Enter password'
					name='password' required>
			</div>
		</div>
		<br>
		<div class='row text-center'>
			<div class='col-sm-4'>
				<button class="btn btn-lg btn-primary btn-block" type="submit">
					Sign in</button>
				<br>
				<br>

			</div>
		</div>

		<div class='row text-center'>
			<div class='col-sm-4'>
				<label class="checkbox"> <a
					class='btn btn-sm btn-info' href="pharmacy_registration.jsp"
					class="text-center new-account">Create an account </a>
				</label>
			</div>
		</div>

		</form>
	</div>


	</div>
	</div>
	<br>
	<center>
		<%
			if (request.getParameter("msg") != null) {
				out.println("<br><h3>Invalid Username/Password</h3>");
			}
		%>
	</center>
	</div>
</body>
</html>