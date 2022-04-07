
<% 
 if(request.getSession().getAttribute("fareobject") == null){
	 response.sendRedirect("index.jsp");
 }else if(request.getSession().getAttribute("fareobject") != null){ 
 %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900"
	rel="stylesheet">
<link rel="icon" href="images/header-logo.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/register.css">

<title>Fly Away</title>

</head>

<body>

	<!-- header -->
	<header class="d-flex align-items-center">

		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
			<a class="navbar-brand" href="index.jsp"><i
				class="fas fa-plane pr-2 fa-2x text-primary"></i></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse " id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="index.jsp" class="nav-link">Home</a>
					</li>
					<li class="nav-item"><a href="adminlogin.jsp" class="nav-link">Admin
							Login</a></li>
					<li class="nav-item"><a href="login.jsp" class="nav-link">Customer
							Login</a></li>
				</ul>

			</div>
		</nav>

		<!-- Navigation -->
	</header>
	<!--Header-->


	<!-- Sign Up -->


	<div class="container-fluid ">
		<div class="row justify-content-center">

			<div class="col-8">
				<form id="form-reg" class="form-container"
					style="background: rgba(255, 255, 255, 0.8)" action="register"
					method="post">
					<h2
						class="text-center py-4 text-dark banner-heading font-weight-bold">Registration
						Form</h2>

					<%
        		String fail = (String)request.getAttribute("Error");
                if(fail != null){		
        	%>
					<div
						class="alert alert-danger alert-dismissible fade show text-center font-weight-bold"
						role="alert">
						<%= fail %>
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<%}%>

					<%
        		String fail1 = (String)request.getAttribute("Error1");
                if(fail1 != null){		
        	%>
					<div
						class="alert alert-danger alert-dismissible fade show text-center font-weight-bold"
						role="alert">
						<%= fail1 %>
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<%}%>



					<div class="form-row">
						<div class="form-group col-md-6 has-feedback">
							<label for="firstName" class="text-dark font-weight-bold">First
								Name</label> <input name="firstname" type="text" class="form-control"
								id="firstName" placeholder="Enter First name">
							<div class="invalid-feedback font-weight-bold" id="fError"></div>
						</div>
						<div class="form-group col-md-6 has-feedback">
							<label for="lastName" class="text-dark font-weight-bold">Last
								Name</label> <input name="lastname" type="text" class="form-control"
								id="lastName" placeholder="Enter Last name">
							<div class="invalid-feedback font-weight-bold" id="lError"></div>
						</div>
					</div>

					<div class="form-group  has-feedback">
						<label for="emailAddress" class="text-dark font-weight-bold">Email
							Address</label> <input name="emailaddress" type="email"
							class="form-control" id="emailAddress"
							placeholder="Enter Email Address">
						<div class="invalid-feedback font-weight-bold" id="eError"></div>
					</div>

					<div class="form-group mb-3 has-feedback">
						<label for="inputPassword4" class="text-dark font-weight-bold">Password</label>
						<input name="password" type="password" class="form-control"
							id="inputPassword4" placeholder="Enter Password">
						<div class="invalid-feedback font-weight-bold" id="pError"></div>
					</div>

					<div class="form-group has-feedback">
						<label for="phone-no" class="text-dark font-weight-bold">Phone
							Number</label> <input name="phone" type="text" class="form-control"
							id="phone-no" placeholder="Enter Phone Number">
						<div class="invalid-feedback font-weight-bold" id="nError"></div>

					</div>

					<div class="form-group mt-4 has-feedback">
						<button type="button" class="btn btn-success btn-block "
							id="submitbtn">Register</button>
					</div>

					<a class="btn btn-success btn-block " href="login.jsp">Login
						into Existing Account</a>

				</form>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer>
		<div class="row justify-content-center">
			<div class="col-md-5 text-center">
				<i class="fas fa-plane pr-2 fa-4x text-primary"></i>
				<p>Here at Fly Away we provide flights at the cheapest rate to
					help you reach your destination</p>
				<strong>Contact Info</strong>
				<p>
					<i class="fas fa-phone-square pr-2 fa-2x text-success"></i>{888}
					888-8888
				</p>
				<p>
					<i class="fas fa-envelope-open-text pr-2 fa-2x text-success"></i>support@flyaway.com
				</p>

			</div>

			<hr class="socket">
			<p>&copy; FlyAway, All Rights Reserved</p>
		</div>
	</footer>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

	<script>
    //FirstName validation ======================================================================================
  let firstError = '';

  function validateFirstName(id) {
    if (isEmptyFirstName(id)) {
      document.getElementById('fError').textContent = firstError;
      return false;
    } else if (regexValidateFN(id)) {
      document.getElementById('fError').textContent = firstError;
      return false;
    } else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('fError').remove;
      return true;
    }
  }

  function isEmptyFirstName(id) {
    let element = document.getElementById(id);
    if (element.value == null || element.value == "" || element.value.trim() == "") {
      element.classList.add('is-invalid');
      firstError = `First Name cannot be empty`;
      return true;
    } else {
      return false;
    }
  }

  function regexValidateFN(id) {
    var alphaExp = /^[a-zA-Z]{3,}$/;
    let element = document.getElementById(id);
    if (alphaExp.test(element.value)) {
      return false;
    } else {
      element.classList.add('is-invalid');
      firstError = `Please enter a valid First Name (only Alphabets and atleast 3 characters)`;
      return true;
    }
  }



  //FirstName Validation Ends ==============================================================================

//LastName Validation  ==============================================================================

  let lastError = '';

  function validateLastName(id) {
    if (isEmptyLastName(id)) {
      document.getElementById('lError').textContent = lastError;
      return false;
    } else if (regexValidateLN(id)) {
      document.getElementById('lError').textContent = lastError;
      return false;
    } else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('lError').remove;
      return true;
    }
  }

  function isEmptyLastName(id) {
    let element = document.getElementById(id);
    if (element.value == null || element.value == "" || element.value.trim() == "") {
      element.classList.add('is-invalid');
      lastError = `Last Name cannot be empty`;
      return true;
    } else {
      return false;
    }
  }

  function regexValidateLN(id) {
    var alphaExp = /^[a-zA-Z]+$/;
    let element = document.getElementById(id);
    if (alphaExp.test(element.value)) {
      return false;
    } else {
      element.classList.add('is-invalid');
      lastError = `Please enter a valid Last Name (only Alphabets)`;
      return true;
    }
  }

  //LastName Validation Ends ==============================================================================

   // Email Address Validation  ==============================================================================

  let addError = '';

  function validateAddress(id) {
    if (isEmptyAddress(id)) {
      document.getElementById('eError').textContent = addError;
      return false;
    } else if (regexValidateE(id)) {
      document.getElementById('eError').textContent = addError;
      return false;
    } else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('eError').remove;
      return true;
    }
  }

  function isEmptyAddress(id) {
    let element = document.getElementById(id);
    if (element.value == null || element.value == "" || element.value.trim() == "") {
      element.classList.add('is-invalid');
      addError = `Email Address cannot be empty`;
      return true;
    } else {
      return false;
    }
  }

  function regexValidateE(id) {
    var alphaExp = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    let element = document.getElementById(id);
    if (alphaExp.test(element.value)) {
      return false;
    } else {
      element.classList.add('is-invalid');
      addError = `Please provide a valid email address`;
      return true;
    }
  }



  //Email Address Validation Ends ==============================================================================


   //Password Validation  ==============================================================================

  let passError = '';

  function validatePassword(id) {
    if (isEmptyPassword(id)) {
      document.getElementById('pError').textContent = passError;
      return false;
    } else if (regexValidateP(id)) {
      document.getElementById('pError').textContent = passError;
      return false;
    } else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('pError').remove;
      return true;
    }
  }

  function isEmptyPassword(id) {
    let element = document.getElementById(id);
    if (element.value == null || element.value == "" || element.value.trim() == "") {
      element.classList.add('is-invalid');
      passError = `Passoword cannot be empty`;
      return true;
    } else {
      return false;
    }
  }

  function regexValidateP(id) {
    var alphaExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
    let element = document.getElementById(id);
    if (alphaExp.test(element.value)) {
      return false;
    } else {
      element.classList.add('is-invalid');
      passError =
        `Must contain at least one number and one uppercase and lowercase letter and one special character, and at least 8 or more characters`;
      return true;
    }
  }


  //Password Validation Ends ==============================================================================

  //Phone Number Validation ==============================================================================

  let phError = '';

  function validatePhone(id) {
    if (isEmptyPhone(id)) {
      document.getElementById('nError').textContent = phError;
      return false;
    } else if (regexValidatePH(id)) {
      document.getElementById('nError').textContent = phError;
      return false;
    } else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('nError').remove;
      return true;
    }
  }

  function isEmptyPhone(id) {
    let element = document.getElementById(id);
    if (element.value == null || element.value == "") {
      element.classList.add('is-invalid');
      phError = `Phone Number cannot be empty`;
      return true;
    } else {
      return false;
    }
  }

  function regexValidatePH(id) {
    var alphaExp = /^\d{10}$/;
    let element = document.getElementById(id);
    if (alphaExp.test(element.value)) {
      return false;
    } else {
      element.classList.add('is-invalid');
      phError = `Please enter a valid Phone Number (of length 10))`;
      return true;
    }
  }


  //Phone Number Validation Ends ==============================================================================


  $(document).ready(

    function () {

      $("#submitbtn").click(function () {
        if (
          validateFirstName('firstName') &&
          validateLastName('lastName') &&
          validateAddress('emailAddress') &&
          validatePassword('inputPassword4') &&
          validatePhone('phone-no')) {
          $("form#form-reg").submit();
        }
      });
    });

</script>


</body>


</html>

<% } %>