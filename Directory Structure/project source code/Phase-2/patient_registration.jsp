
<html lang="en">
<head>
<title>Registration</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function Validate() {

		var password = document.getElementById("password").value;

		var confirmPassword = document.getElementById("cpassword").value;

		if (password != confirmPassword) {

			alert("Passwords, confirm passwords not match");

			document.getElementById("cpassword").value = "";

			return false;

		}

		return true;
	}
</script>
</head>
<body style="background-color: #ffffff; background-image: url(images/)">

	<%@ include file="home_menu.jsp"%>
	<section class="testimonial py-5" id="testimonial">
		<div class="container" style="background-color: #ffffff; width: %">
			<div class="row ">
				<div class="col-md-4">

					<div class="card-body">
						<img src="image/patient_reg.jpg" style="width: 100%; height: 80%"
							alt="give image path">

						</p>
					</div>

				</div>
				<div class="col-md-8 py-5 border">
					<h2 class="pb-4">Patient Registration</h2>
					<form name='f1' method='post'
						action="patient_registration_code.jsp" enctype="">

						<div class='row'>
							<div class='col-md-12'>
								<label for='name'>Name:</label> <input type='text'
									class='form-control' id='name' placeholder='Enter name'
									name='name' required>
							</div>
						</div>
						<div class='row'>
							<div class='col-md-12'>
								<label for='address'>Address:</label> <input type='text'
									class='form-control' id='address' placeholder='Enter address'
									name='address' required>
							</div>
						</div>
						<div class='row'>
							<div class='col-md-12'>
								<label for='mobile'>Mobile:</label> <input type='number'
									class='form-control' id='mobile' placeholder='Enter mobile'
									name='mobile' required>
							</div>
						</div>
						<div class='row'>
							<div class='col-md-12'>
								<label for='email'>Email:</label> <input type='email'
									class='form-control' id='email' placeholder='Enter email'
									name='email' required>
							</div>
						</div>
						<div class='row'>
							<div class='col-md-12'>
								<label for='password'>Password:</label> <input type='password'
									class='form-control' id='password' placeholder='Enter password'
									name='password' required>
							</div>
							<div class='col-md-12'>
								<label for='cpassword'>Confirm-password:</label> <input
									type='password' class='form-control' id='cpassword'
									placeholder='Enter Confirm-password' name='cpassword'
									onfocusout='Validate()' required>
							</div>
						</div>
						<br>

						<div class="form-row">
							<button type="submit" class="btn btn-danger">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

</body>
</html>
