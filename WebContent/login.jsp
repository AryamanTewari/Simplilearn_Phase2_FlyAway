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
<link rel="stylesheet" href="css/login.css">

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

	<!-- Login -->

	<div class="container-fluid">

		<div class="row justify-content-center">

			<div class="col-12 col-md-6 col-sm-6">
				<form class="form-container" id="login-form"
					style="background: rgba(255, 255, 255, 0.8)" action="login"
					method="post">
					<h3
						class="text-center py-4 text-dark banner-heading font-weight-bold">Login
						Form</h3>

					<%
        		String fail = (String)request.getAttribute("loginerr1");
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


					<div class="form-group has-feedback">
						<label for="email-id" class="text-dark font-weight-bold">Email
							Address</label> <input name="emailaddress" type="email"
							class="form-control" placeholder=" Enter Email Address"
							id="email-id" />
						<div class="invalid-feedback font-weight-bold" id="eError"></div>
					</div>

					<div class="form-group has-feedback">
						<label for="password" class="text-dark font-weight-bold">Password</label>
						<input name="password" type="password" class="form-control "
							placeholder="Enter Password" id="password">
						<div class="invalid-feedback font-weight-bold" id="pError"></div>

						<%
        		String password = (String)request.getAttribute("loginerr");
                if(password != null){
                	
        	%>

						<div class="text-danger"><%=request.getAttribute("loginerr") %></div>

						<% } %>
					</div>

					<button type="button" class="btn btn-primary btn-block "
						id="loginbtn">Login</button>


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
	<script>
  
//Email Address Validation  ==============================================================================

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
      addError = "Email Address cannot be empty";
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
      addError = 'Please provide a valid email address';
      return true;
    }
  }



  //Email Address Validation Ends ==============================================================================

	  
 let passError = '';

  function validatePassword(id) {
    if (isEmptyPassword(id)) {
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
    if (element.value == null || element.value == "") {
      element.classList.add('is-invalid');
      passError = `Password Cannot be Empty`;
      return true;
    } else {
      return false;
    }
  }
	  
  $(document).ready(

		    function () {

		      $("#loginbtn").click(function () {
		        if (
		         validateAddress('email-id') &&
		          validatePassword('password')) {
		          $("form#login-form").submit();
		        }
		      });
		    });
  
  </script>
</body>
</html>