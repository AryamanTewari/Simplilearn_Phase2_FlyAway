
<% 
 if(request.getSession().getAttribute("adminId") == null){
	 response.sendRedirect("index.jsp");
 }else if(request.getSession().getAttribute("adminId") != null){ 
 %>

<%@page import="com.flyaway.dao.Utils"%>
<%@page import="com.flyaway.model.Airport"%>
<%@page import="java.util.List"%>
<%@page import="com.flyaway.dao.CustomerDAO"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
	Map<String,String>weekMap = new LinkedHashMap<>();
	weekMap = Utils.getWeekDays(); 
	CustomerDAO cust = new CustomerDAO();
	List<String>codeList = cust.listAirportCode();
	List<String>airList = cust.listAirline();
%>

	<div class="container-fluid ">
		<div class="row justify-content-center">

			<div class="col-12 col-md-8 col-sm-6">
				<form id="form-flight" class="form-container"
					style="background: rgba(255, 255, 255, 0.8)"
					action="addflightadmin" method="post">
					<h2
						class="text-center py-4 text-dark banner-heading font-weight-bold">Add
						New Flight</h2>
					<div class="form-group has-feedback">

						<label for="Airline" class="text-dark font-weight-bold">Airline</label>
						<select class="form-control" id="Airline" name="airline">
							<option selected value="selected">Select</option>
							<% 
        		if(airList.size() != 0){
        			for(String code: airList){
        		%>
							<option value=<%= code %>><%= code %></option>
							<% } }%>
						</select>
						<div class="invalid-feedback font-weight-bold" id="s1Error"></div>
					</div>


					<label for="weekdays"><b>Select Weekdays</b></label>
					<table id="weekdays">
						<tr>
							<% for(Map.Entry<String , String> wm : weekMap.entrySet()){ %>
							<td><input class="pr-3 mr-2" type="checkbox" name="weekdays"
								value=<%= wm.getKey() %> /><%= wm.getValue() %></td>
							<% } %>
						</tr>
					</table>



					<div class="form-group has-feedback">
						<label for="Source" class="text-dark font-weight-bold">Source
							Airport</label> <select class="form-control" id="Source" name="source">
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

					<div class="form-group has-feedback">
						<label for="Destination" class="text-dark font-weight-bold">Destination
							Airport</label> <select class="form-control" id="Destination"
							name="destination">
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
						<div class="invalid-feedback font-weight-bold" id="s3Error"></div>
					</div>

					<div class="form-group mt-4 has-feedback">
						<button type="button" class="btn btn-success btn-block "
							id="addbtn">Add Flight</button>
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
	
  
let sel2Error = '';

  function validateSourceSelect(id) {
    if (isEmptySourceSelect(id)) {
      document.getElementById('s2Error').textContent = sel2Error;
      return false;
    }else if(checkSameDestination(id)) {
    	document.getElementById('s2Error').textContent = sel2Error;
        return false;
    }else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('s2Error').remove;
      return true;
    }
  }

  function isEmptySourceSelect(id) {
    let element = document.getElementById(id);
    if (element.value === 'selected') {
      element.classList.add('is-invalid');
      sel2Error = `Please Select an Option`;
      return true;
    } else {
      return false;
    }
  }

  function checkSameDestination(id) {
	    let Source = document.getElementById(id).value;
	    let Destination = document.getElementById('Destination').value;

	    if (Source !== Destination) {
	      return false;
	    } else {
	      document.getElementById(id).classList.add('is-invalid');
	      sel2Error = `Source Cannot be same as Destination`;
	      return true;
	    }
	  }

  

  let sel3Error = '';

  function validateDestSelect(id) {
    if (isEmptyDestSelect(id)) {
      document.getElementById('s3Error').textContent = sel3Error;
      return false;
    }else if(checkSameSource(id)) {
    	document.getElementById('s3Error').textContent = sel3Error;
        return false;
    }else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('s3Error').remove;
      return true;
    }
  }

  function isEmptyDestSelect(id) {
    let element = document.getElementById(id);
    if (element.value === 'selected') {
      element.classList.add('is-invalid');
      sel3Error = `Please Select an Option`;
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
	      sel3Error = `Destination Cannot be same as Source`;
	      return true;
	    }
	  }

        

  $(document).ready(

		    function () {

		      $("#addbtn").click(function () {
		        if (
		        		validateSelect('Airline') &&
		        		validateSourceSelect('Source') &&
		        		validateDestSelect('Destination')) {
		          $("form#form-flight").submit();
		        }
		      });
		    });
  

  </script>


</body>


</html>

<% } %>