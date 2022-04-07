package com.flyaway.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.CustomerDAO;
import com.flyaway.model.Fare;
import com.flyaway.model.Flight;

/**
 * Servlet implementation class Submit
 */
@WebServlet("/submit")
public class Submit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd;
		CustomerDAO cust = new CustomerDAO();
		
		String travelClass = request.getParameter("travelclass");
		HttpSession session = request.getSession(false);
		Flight flight = (Flight)session.getAttribute("flightobject");
		Fare fare = cust.getFareRecord(flight.getFlightNumber(), travelClass);
		session.setAttribute("fareobject", fare);
		
		Integer customerId = (Integer)session.getAttribute("customerId");
		
		if(customerId == null) {
		rd = getServletContext().getRequestDispatcher("/register.jsp");
        rd.forward(request, response);
		}else if(customerId != null) {
			rd = getServletContext().getRequestDispatcher("/confirmbooking.jsp");
	        rd.forward(request, response);
		}
	}

}
