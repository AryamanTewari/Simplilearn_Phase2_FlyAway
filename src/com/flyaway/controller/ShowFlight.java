package com.flyaway.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.CustomerDAO;
import com.flyaway.model.Airport;
import com.flyaway.model.Flight;

/**
 * Servlet implementation class ShowFlight
 */
@WebServlet("/bookflight")
public class ShowFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerDAO cust = new CustomerDAO();

		Airport srcAirport  = null;
		Airport destAirport = null;
		String day = "";
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String date = request.getParameter("traveldate");
		Date travelDate = cust.getDate(date);
		int passengers = Integer.parseInt(request.getParameter("passengers"));
		List<Flight> flightList = new ArrayList<>();
		if(source != "" && destination != "" && travelDate != null
				&& passengers != 0 ){
			HttpSession session = request.getSession();
			srcAirport = cust.getAirportObject(source);
			destAirport = cust.getAirportObject(destination);
			day = cust.getDay(travelDate);
			flightList = cust.flightList(source, destination, travelDate);
			request.setAttribute("sourceairport", srcAirport);
			request.setAttribute("destairport", destAirport);
			request.setAttribute("flightlist", flightList);
			session.setAttribute("traveldate", date);
			session.setAttribute("passengers", passengers);
			session.setAttribute("day", day);



			if(flightList.size() == 0 || flightList == null) {
				request.setAttribute("FAIL", "There are no flights flying from " + srcAirport.getAirport() + " to " + destAirport.getAirport() + " on date " + date + " ." );
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/bookflight.jsp");
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/flightdetails.jsp");
				rd.forward(request, response);
			}


		}else {
			request.setAttribute("FAIL1", "Error Occurred while searching flights.");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/bookflight.jsp");
			rd.forward(request, response);


		}

	}

}
