<!DOCTYPE html>
<html lang="en">
<head>
<title>Pharmacy</title>
<%@ include file="links.jsp"%>

<script type="text/javascript">
	function Validate() {
		var password = document.getElementById("password").value;
		var confirmPassword = document.getElementById("cpassword").value;
		if (password != confirmPassword) {
			alert("Passwords mismatch.");
			document.getElementById("cpassword").value = "";
			return false;
		}
		return true;
	}
</script>
</head>
<body style="background-color: #ffffff; background-image: url(images/)">
	<%@ include file="home_menu.jsp"%>
	<div class="container"
		style="background-color: #ffffff; margin-top: 20px; width: %">
		<h2>Pharmacy Registration</h2>
		<form name='f1' method='post' action="pharmacy_registration_code.jsp"
			enctype="">



			<div class='row'>
				<div class='col-md-6'>
					<label for='shopname'>shopname:</label> <input type='text'
						class='form-control' id='shopname' placeholder='Enter shopname'
						name='shopname' required>
				</div>
				<div class='col-md-6'>
					<label for='ownername'>ownername:</label> <input type='text'
						class='form-control' id='ownername' placeholder='Enter ownername'
						name='ownername' required>
				</div>
			</div>
			<div class='row'>
				<div class='col-md-6'>
					<label for='address'>address:</label> <input type='text'
						class='form-control' id='address' placeholder='Enter address'
						name='address' required>
				</div>
				<div class='col-md-6'>
					<label for='city'>city:</label> <input type='text'
						class='form-control' id='city' placeholder='Enter city'
						name='city' required>
				</div>
			</div>
			<div class='row'>
				<div class='col-md-6'>
					<label for='state'>state:</label> <input type='text'
						class='form-control' id='state' placeholder='Enter state'
						name='state' required>
				</div>
				<div class='col-md-6'>
					<label for='mobile'>mobile:</label> <input type='number'
						class='form-control' id='mobile' placeholder='Enter mobile'
						name='mobile' required>
				</div>
			</div>
			<div class='row'>
				<div class='col-md-6'>
					<label for='email'>email:</label> <input type='email'
						class='form-control' id='email' placeholder='Enter email'
						name='email' required>
				</div>
				<div class='col-md-6'>
					<label for='usename'>usename:</label> <input type='text'
						class='form-control' id='usename' placeholder='Enter usename'
						name='usename' required>
				</div>
			</div>
			<div class='row'>
				<div class='col-md-6'>
					<label for='password'>password:</label> <input type='text'
						class='form-control' id='password' placeholder='Enter password'
						name='password' required>
				</div>
				<div class='col-md-6'>
					<label for='cpassword'>Confirm-password:</label> <input type='text'
						class='form-control' id='cpassword'
						placeholder='Enter Confirm-password' name='cpassword'
						onfocusout='Validate()' required>
				</div>
			</div>
			<br>
			<button type="submit" class="btn btn-default btn-success">Create Account</button>
		</form>
	</div>


</body>
</html>
