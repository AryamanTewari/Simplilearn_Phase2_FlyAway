<%@page import="com.flyaway.model.Airport"%>
<%@page import="java.util.List"%>
<%@page import="com.flyaway.dao.CustomerDAO"%>
<%@page import="com.flyaway.dao.DateUtils"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<% Date date = new Date();  
	String dateStr = DateUtils.formatDate(date);  
	
	Integer customerId = (Integer)session.getAttribute("customerId");
	
	%>
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

				<%if (customerId == null){ %>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="index.jsp" class="nav-link">Home</a>
					</li>
					<li class="nav-item"><a href="adminlogin.jsp" class="nav-link">Admin
							Login</a></li>
					<li class="nav-item"><a href="login.jsp" class="nav-link">Customer
							Login</a></li>
				</ul>

				<%}else if(customerId != null){ %>

				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="customerdetails.jsp"
						class="nav-link">Customer Details</a></li>
					<li class="nav-item"><a href="changepassword.jsp"
						class="nav-link">Change Password</a></li>
					<li class="nav-item"><a
						class="text-uppercase text-center p-1 nav-link" href="Logout"><i
							class="fas fa-sign-out-alt fa-2x pr-1 "></i> logout</a></li>
				</ul>

				<% } %>

			</div>
		</nav>

		<!-- Navigation -->
	</header>
	<!--Header-->

	<% 
	CustomerDAO cust = new CustomerDAO();
	List<String>codeList = cust.listAirportCode();
%>

	<div class="container-fluid">

		<div class="row justify-content-center">

			<div class="col-12 col-md-8 col-sm-6">

				<form id="form-book" class="form-container"
					style="background: rgba(255, 255, 255, 0.8)" action="bookflight"
					method="post">

					<h2
						class="text-center py-4 text-dark banner-heading font-weight-bold">Journey
						Details</h2>

					<%
        		String fail = (String)request.getAttribute("FAIL");
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
        		String fail1 = (String)request.getAttribute("FAIL1");
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
						<div class="form-group has-feedback">
							<label for="Source" class="text-dark font-weight-bold">From</label>
							<select class="form-control" id="Source" name="source">
								<option selected value="selected">Select</option>
								<% 
        		if(codeList.size() != 0){
        			for(String code: codeList){
        				Airport airport = cust.getAirportObject(code);
        		%>
								<option value=<%= code %>><%= airport.getAirport() %>(<%= code %>)
									<b><%= airport.getCountryCode() %></b></option>
								<% } }%>
							</select>
							<div class="invalid-feedback font-weight-bold" id="s1Error"></div>
						</div>
						<div class="form-group has-feedback pl-5 ml-5">
							<label for="Dest" class="text-dark font-weight-bold">To</label> <select
								class="form-control" id="Dest" name="destination">
								<option selected value="selected">Select</option>
								<% 
        		if(codeList.size() != 0){
        			for(String code: codeList){
        				Airport airport = cust.getAirportObject(code);
        		%>
								<option value=<%= code %>><%= airport.getAirport() %>(<%= code %>)
									<b><%= airport.getCountryCode() %></b></option>
								<% } }%>
							</select>
							<div class="invalid-feedback font-weight-bold" id="s2Error"></div>
						</div>
					</div>

					<div class="form-group  has-feedback">
						<label for="travel_date" class="text-dark font-weight-bold">Travel
							Date</label> <input name="traveldate" type="date" class="form-control"
							id="travel_date" value=<%= dateStr %> min=<%= dateStr %> />
						<div class="invalid-feedback font-weight-bold" id="dError"></div>
					</div>

					<div class="form-group has-feedback">
						<label for="passengers_no" class="text-dark font-weight-bold">No
							Of Travellers</label> <input name="passengers" type="number"
							class="form-control " placeholder="Enter No of Travellers"
							id="passengers_no">
						<div class="invalid-feedback font-weight-bold" id="tError"></div>
					</div>


					<div class="form-group mt-4 has-feedback">
						<button type="button" class="btn btn-success btn-block "
							id="searchbtn">Search Flights</button>
					</div>

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
  
//Select Validate =======================================================================================
  let sel1Error = '';

  function validateSourceSelect(id) {
    if (isEmptySourceSelect(id)) {
      document.getElementById('s1Error').textContent = sel1Error;
      return false;
    }else if(checkSameDestination(id)) {
    	document.getElementById('s1Error').textContent = sel1Error;
        return false;
    }else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('s1Error').remove;
      return true;
    }
  }

  function isEmptySourceSelect(id) {
    let element = document.getElementById(id);
    if (element.value === 'selected') {
      element.classList.add('is-invalid');
      sel1Error = `Please Select an Option`;
      return true;
    } else {
      return false;
    }
  }

  function checkSameDestination(id) {
	    let Source = document.getElementById(id).value;
	    let Destination = document.getElementById('Dest').value;

	    if (Source !== Destination) {
	      return false;
	    } else {
	      document.getElementById(id).classList.add('is-invalid');
	      sel1Error = `Source Cannot be same as Destination`;
	      return true;
	    }
	  }

  

  let sel2Error = '';

  function validateDestSelect(id) {
    if (isEmptyDestSelect(id)) {
      document.getElementById('s2Error').textContent = sel2Error;
      return false;
    }else if(checkSameSource(id)) {
    	document.getElementById('s2Error').textContent = sel2Error;
        return false;
    }else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('s2Error').remove;
      return true;
    }
  }

  function isEmptyDestSelect(id) {
    let element = document.getElementById(id);
    if (element.value === 'selected') {
      element.classList.add('is-invalid');
      sel2Error = `Please Select an Option`;
      return true;
    } else {
      return false;
    }
  }
  
  function checkSameSource(id) {
	    let Source = document.getElementById('Source').value;
	    let Destination = document.getElementById(id).value;

	    if (Source !== Destination) {
	      return false;
	    } else {
	      document.getElementById(id).classList.add('is-invalid');
	      sel2Error = `Destination Cannot be same as Source`;
	      return true;
	    }
	  }
  
//Date Validation
  
  let dateError = '';

   function validateDate(id) {
     if (isEmptyDate(id)) {
       document.getElementById('dError').textContent = dateError;
       return false;
     } else {
       document.getElementById(id).classList.remove('is-invalid');
       document.getElementById('dError').remove;
       return true;
     }
   }

   function isEmptyDate(id) {
     let element = document.getElementById(id);
     if (element.value == null || element.value == "") {
       element.classList.add('is-invalid');
       dateError = `Please provide a valid date`;
       return true;
     } else {
       return false;
     }
   }

  
  // Validate Number
  
  let numError = '';

   function validatePassengers(id) {
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
	       numError = `Number of passesgers should be a non-zero positive number`;
	       return true;
	     } else {
	       return false;
	     }
	   }  

  
   
   $(document).ready(

		    function () {

		      $("#searchbtn").click(function () {
		        if (
		        	validateSourceSelect('Source') &&
		        	validateDestSelect('Dest') &&
		        	validateDate('travel_date') &&
		        	validatePassengers('passengers_no')) {
		          $("form#form-book").submit();
		        }
		      });
		    });
  
  
  </script>

</body>
</html>