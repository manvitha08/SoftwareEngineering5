<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<title>Registration Form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

</head>
<body style="background-color: #ffffff;background-image: url(images/)">

<%@ include file = "home_menu.jsp" %>
<div class="container" style="background-color: #ffffff;width:%">
    <form name='f1' method='post' action="doctor_registration_code.jsp" enctype="multipart/form-data">
		<h3>Doctor Registration Form</h3>
		

		
<div class='row'>
	<div class='col-md-5'>
		<label for='name'>Name</label>
		<input type='text' class='form-control' id='name' placeholder='Enter name' name='name' required >
	</div>

	<div class='col-md-5'>
		<label for='hospitalname'>Hospital Name</label>
		<input type='text' class='form-control' id='hospitalname' placeholder='Enter hospitalname' name='hospitalname' required >
	</div>

	<div class='col-md-5'>
		<label for='address'>Address</label>
		<input type='text' class='form-control' id='address' placeholder='Enter address' name='address' required >
	</div>

	<div class='col-md-5'>
		<label for='state'>State</label>
		<input type='text' class='form-control' id='state' placeholder='Enter state' name='state' required >
	</div>

	<div class='col-md-5'>
		<label for='city'>City</label>
		<input type='text' class='form-control' id='city' placeholder='Enter city' name='city' required >
	</div>

	<div class='col-md-5'>
		<label for='qualification'>Qualification</label>
		<input type='text' class='form-control' id='qualification' placeholder='Enter qualification' name='qualification' required >
	</div>

	<div class='col-md-5'>
		<label for='specialization'>Specialization</label>
		<input type='text' class='form-control' id='specialization' placeholder='Enter specialization' name='specialization' required >
	</div>

	<div class='col-md-5'>
		<label for='experiance'>Experience</label>
		<input type='text' class='form-control' id='experiance' placeholder='Enter experiance' name='experiance' required >
	</div>

	<div class='col-md-5'>
		<label for='mobile'>Mobile</label>
		<input type='text' class='form-control' id='mobile' placeholder='Enter mobile' name='mobile' required >
	</div>

	<div class='col-md-5'>
		<label for='email'>E-Mail:</label>
		<input type='text' class='form-control' id='email' placeholder='Enter email' name='email' required >
	</div>

	<div class='col-md-5'>
		<label for='doctorphoto'>Doctor Photo</label>
		<input type='file' class='form-control' id='doctorphoto' placeholder='Enter doctorphoto' name='doctorphoto' required >
	</div>

	<div class='col-md-5'>
		<label for='certificatefile'>Certificate File</label>
		<input type='file' class='form-control' id='certificatefile' placeholder='Enter certificatefile' name='certificatefile' required >
	</div>

	<div class='col-md-5'>
		<label for='consultfee'>Consult Fee</label>
		<input type='text' class='form-control' id='consultfee' placeholder='Enter consultfee' name='consultfee' required >
	</div>

	<div class='col-md-5'>
		<label for='password'>Password</label>
		<input type='password' class='form-control' id='password' placeholder='Enter password' name='password' required >
	</div>
	<div class='col-md-5'>
		<label for='cpassword'>Confirm-Password</label>
		<input type='password' class='form-control' id='cpassword' placeholder='Enter Confirm-password' name='cpassword' onfocusout='Validate()'required >
		</div>
	<div class='col-md-5'>
		<label for='accountnumber'>Account Number</label>
		<input type='text' class='form-control' id='accountnumber' placeholder='Enter accountnumber' name='accountnumber' required >
	</div>
	<div class='col-md-5'>
		<label for='registerdate'>Register Date</label>
		<input type='date' class='form-control' id='registerdate' placeholder='Enter registerdate' name='registerdate' required >
	</div>
	<div class='col-md-5'>
		<label for='opentime'>Open Time</label>
		<input type='text' class='form-control' id='opentime' placeholder='Enter opentime' name='opentime' required >
	</div>
	<div class='col-md-5'>
		<label for='closetime'>Close Time</label>
		<input type='text' class='form-control' id='closetime' placeholder='Enter closetime' name='closetime' required >
	</div>
</div>


		<br>
		<div class="row">
			<div class='col-sm-4'>&nbsp;</div>
			<div class='col-sm-2'>
            	<button type="submit" class="btn btn-success btn-md btn-block">Register</button>
            	
            	<h4><a href="doctor_login.jsp"><u>Sign in</u></a></h4>
            </div>
        </div>
        
    </form>
	
	</div>
</div>
</div>
</body>
</html>                            