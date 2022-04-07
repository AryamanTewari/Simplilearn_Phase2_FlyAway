
<% 
 if(request.getSession().getAttribute("customerId") != null){
	 response.sendRedirect("customerdetails.jsp");
 }else if(request.getSession().getAttribute("customerId") == null){ 
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
<link rel="stylesheet" href="css/index.css">

<title>Fly Away</title>

</head>

<body data-spy="scroll" data-target="#navbarResponsive">
	<!-- header -->
	<header class="d-flex align-items-center" id="home">

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

					<li class="nav-item"><a href="bookflight.jsp" class="nav-link">Book
							Flight</a></li>

					<li class="nav-item"><a href="adminlogin.jsp" class="nav-link">Admin
							Login</a></li>


					<li class="nav-item"><a href="login.jsp" class="nav-link">Customer
							Login</a></li>

				</ul>

			</div>
		</nav>

		<!-- Navigation -->

		<div class="container">

			<div class="row">
				<div class="col text-center">
					<h3
						class="text-uppercase font-weight-bold display-4 text-light banner-heading">welcome
						to flyaway</h3>
					<h3 class="display-4 text-light banner-heading pt-3 pb-4">Your
						journey is one click away</h3>
					<a href="bookflight.jsp"
						class="btn btn-lg btn-outline-primary text-uppercase px-5">
						Click to book flight</a>
				</div>
			</div>
		</div>
	</header>


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
	<script src="js/bootstrap.min.js">
		
	</script>
	<script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script>

</body>

</html>

<% } %>