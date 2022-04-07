
<% 
 if(request.getSession().getAttribute("flightobject") == null){
	 response.sendRedirect("index.jsp");
 }else if(request.getSession().getAttribute("flightobject") != null){ 
 %>

<% Integer customerId = (Integer)session.getAttribute("customerId"); %>
<%@page import="com.flyaway.model.Flight"%>
<%@page import="com.flyaway.model.Fare"%>
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


	<div class="container p-5 m-5">
		<table id="BasicExample"
			class="table table-striped table-hover table-light table-bordered">
			<thead class="thead-dark">
				<tr>
					<th class="th text-center py-3">Flight Number</th>
					<th class="th text-center py-3">Airline</th>
					<th class="th text-center py-3">Travel Class</th>
					<th class="th text-center py-3">Fare</th>
					<th class="th text-center py-3"></th>
				</tr>
			</thead>
			<tbody>
				<% 
         List<Fare> fareList = (List<Fare>)request.getAttribute("farelist");
     	Flight flight = (Flight)session.getAttribute("flightobject");
     	
     	if(fareList != null && flight != null){
     	
     	for(Fare f: fareList){
  		 %>
				<tr class="text-center">
					<td class="py-3"><%= flight.getFlightNumber() %></td>
					<td class="py-3"><%= flight.getAirline() %></td>
					<td class="py-3"><%= f.getTravelClass() %></td>
					<td class="py-3"><%= f.getFare() %></b></td>
					<td class="py-3"><form action="submit" method="post">
							<input name="travelclass" value="<%= f.getTravelClass() %>"
								type="hidden"> <input type="submit" value="Book Now"
								class="btn btn-primary" />
						</form></td>
				</tr>
				<%} }%>
			</tbody>
		</table>
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

</body>
</html>
<% } %>
