
<% 
 if(request.getSession().getAttribute("adminId") == null){
	 response.sendRedirect("index.jsp");
 }else if(request.getSession().getAttribute("adminId") != null){ 
 %>

<%@page import="com.flyaway.dao.Utils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
			<a class="navbar-brand" href="admindetails.jsp"><i
				class="fas fa-plane pr-2 fa-2x text-primary"></i></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse " id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="admindetails.jsp"
						class="nav-link">Admin Details</a></li>
					<li class="nav-item"><a href="adminupdatepassword.jsp"
						class="nav-link">Change Password</a></li>
					<li class="nav-item"><a
						class="text-uppercase text-center p-1 nav-link" href="Logout"><i
							class="fas fa-sign-out-alt fa-2x pr-1 "></i> logout</a></li>
				</ul>

			</div>
		</nav>

		<!-- Navigation -->
	</header>
	<!--Header-->
	<% 
String flightNumber = (String)session.getAttribute("flightnumber");
List<String>classList = Utils.getClasses();
%>


	<div class="container-fluid">

		<div class="row justify-content-center">

			<div class="col-12 col-md-6 col-sm-6">
				<form class="form-container" id="fare-form"
					style="background: rgba(255, 255, 255, 0.8)"
					action="addfaredetails" method="post">
					<h3
						class="text-center py-4 text-dark banner-heading font-weight-bold">Add
						Fare Details</h3>

					<div class="form-group has-feedback">
						<label for="flightId" class="text-dark font-weight-bold">Flight
							Number</label> <input name="flightnumber" type="text"
							class="form-control" id="flightId" value=<%= flightNumber %>
							readonly />
						<div class="invalid-feedback font-weight-bold" id="fError"></div>
					</div>

					<div class="form-group has-feedback">
						<label for="travelClass" class="text-dark font-weight-bold">Travel
							Class</label> <select class="form-control" id="travelClass"
							name="travelclass">
							<option selected value="selected">Select</option>
							<% 
        		if(classList.size() != 0){
        			for(String code: classList){
        		%>
							<option value=<%= code %>><%= code %></option>
							<% } }%>
						</select>
						<div class="invalid-feedback font-weight-bold" id="s1Error"></div>
					</div>

					<div class="form-group has-feedback">
						<label for="Fare" class="text-dark font-weight-bold">Class
							Fare</label> <input name="fare" type="number" class="form-control "
							placeholder="Enter Class Fare" id="Fare" min=1 />
						<div class="invalid-feedback font-weight-bold" id="tError"></div>
					</div>


					<button type="button" class="btn btn-primary btn-block "
						id="farebtn">Add Fare</button>

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
  
  let sel1Error = '';

  function validateSelect(id) {
    if (isEmptySelect(id)) {
      document.getElementById('s1Error').textContent = sel1Error;
      return false;
    }else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('s1Error').remove;
      return true;
    }
  }

  function isEmptySelect(id) {
    let element = document.getElementById(id);
    if (element.value === 'selected') {
      element.classList.add('is-invalid');
      sel1Error = `Please Select an Option`;
      return true;
    } else {
      return false;
    }
  }

  // Fare Validation
  
  let numError = '';

  function validateFare(id) {
    if (checkNum(id)) {
      document.getElementById('tError').textContent = numError;
      return false;
    }else if (checkNegNumAndZero(id)){
   	 document.getElementById('tError').textContent = numError;
        return false; 
    }else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('tError').remove;
      return true;
    }
  }
 
  function checkNum(id) {
	     let element = document.getElementById(id);
	     if (isNaN(element.value)) {
	       element.classList.add('is-invalid');
	       numError = `Please provide a Number`;
	       return true;
	     } else {
	       return false;
	     }
	   }  
 
  function checkNegNumAndZero(id) {
	     let element = document.getElementById(id);
	     if (element.value <= 0) {
	       element.classList.add('is-invalid');
	       numError = `Fare should be a non-zero positive number`;
	       return true;
	     } else {
	       return false;
	     }
	   }  

 
  
  $(document).ready(

		    function () {

		      $("#farebtn").click(function () {
		        if (
		        		validateSelect('travelClass') &&
		        		validateFare('Fare')) {
		          $("form#fare-form").submit();
		        }
		      });
		    });
 
  </script>

</body>
</html>

<% } %>