
<% 
 if(request.getSession().getAttribute("adminId") == null){
	 response.sendRedirect("index.jsp");
 }else if(request.getSession().getAttribute("adminId") != null){ 
 %>


<%@page import="com.flyaway.model.Airport"%>
<%@page import="com.flyaway.model.Fare"%>
<%@page import="com.flyaway.model.Flight"%>
<%@page import="java.util.List"%>
<%@page import="com.flyaway.dao.CustomerDAO"%>
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

	<section>

		<%
        		String success = (String)request.getAttribute("SUCCESS");
                if(success != null){		
        	%>
		<div
			class="alert alert-success alert-dismissible fade show text-center font-weight-bold mt-5"
			role="alert">
			<%= success %>
			<i class="fas fa-check-circle ml-2 fa-2x"></i>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%}%>


		<%
        		String fail = (String)request.getAttribute("FAIL");
                if(fail != null){		
        %>
		<div
			class="alert alert-danger alert-dismissible fade show text-center font-weight-bold mt-5"
			role="alert">
			<%= fail %>
			<i class="fas fa-times-circle ml-2 fa-2x"></i>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%}%>

		<%
        		String error = (String)request.getAttribute("Error");
                if(error != null){		
        %>
		<div
			class="alert alert-danger alert-dismissible fade show text-center font-weight-bold mt-5"
			role="alert">
			<%= error %>
			<i class="fas fa-times-circle ml-2 fa-2x"></i>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%}%>

		<%
        		String error2 = (String)request.getAttribute("Error2");
                if(error2 != null){		
        %>
		<div
			class="alert alert-danger alert-dismissible fade show text-center font-weight-bold mt-5"
			role="alert">
			<%= error2 %>
			<i class="fas fa-times-circle ml-2 fa-2x"></i>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%}%>

		<div class="btn-group mt-5 pt-5" role="group"
			aria-label="Basic example">
			<a href="adminaddflight.jsp" class="btn btn-primary pl-3 ml-3">Add
				a new Flight</a> <a href="adminupdatepassword.jsp"
				class="btn btn-primary px-4 mx-4 ">Change Password</a>
		</div>



		<%
	CustomerDAO cust = new CustomerDAO();
	List<Flight> flightList = cust.showFlightList();
	List<Fare> fareList = null;
%>

		<% if(flightList.size() == 0){ 
	
	%>

		<div
			class="alert alert-danger text-center text-uppercase text-primary font-weight-bold"
			role="alert">Sorry There are No Flights available. Please Add a
			Flight.</div>

		<%}else if (flightList.size() != 0 ){ 
		
		%>

		<h2 class="text-center text-uppercase text-primary font-weight-bold">All
			Flight Details</h2>
		<div class="container p-5 m-5 text-center">
			<table id="BasicExample"
				class="table table-striped table-hover table-light table-bordered">
				<thead class="thead-dark">
					<tr>
						<th class="th text-center py-3">Flight Number</th>
						<th class="th text-center py-3">Airline</th>
						<th class="th text-center py-3">Week Days</th>
						<th class="th text-center py-3">Source</th>
						<th class="th text-center py-3">Destination</th>
						<th class="th text-center py-3">Classes</th>
					</tr>
				</thead>
				<tbody>



					<% 
		for(Flight f : flightList){
		
			fareList = cust.showFareList(f.getFlightNumber());
			String srcAirport = cust.getAirport(f.getSource());
			String destAirport = cust.getAirport(f.getDestination());
			String srcCountry = cust.getCountryCode(f.getSource());
			String destCountry = cust.getCountryCode(f.getDestination());
	
	%>

					<tr class="text-center">
						<td class="py-3"><%= f.getFlightNumber() %></td>
						<td class="py-3"><%= f.getAirline() %></td>
						<td class="py-3"><%= f.getWeekdays() %></td>
						<td class="py-3"><%= srcAirport %> (<%= f.getSource() %>) <b><%= srcCountry %></b></td>
						<td class="py-3"><%= destAirport %> (<%= f.getDestination() %>)
							<b><%= destCountry %></b></td>

						<% 
		if(fareList.size() != 0){
		for(Fare fare: fareList){ %>

						<td class="py-3"><%= fare.getTravelClass() %> <br> <%= fare.getFare() %></td>
						<%} }%>

						<% 
	if(fareList.size() < 3){%>
						<td class="py-3"><form action="addfaredetailssubmit"
								method="post">
								<input name="flightnumber" value="<%= f.getFlightNumber() %>"
									type="hidden"> <input class="btn btn-primary"
									type="submit" value="Add Fare" />
							</form></td>
						<%}%>
					</tr>
					<% } } %>

				</tbody>
			</table>
		</div>

	</section>
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
</body>
</html>

<% } %>