package com.flyaway.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddFareDetailSubmit
 */
@WebServlet("/addfaredetailssubmit")
public class AddFareDetailsSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd;
		HttpSession session = request.getSession(false);
		String flightNumber = request.getParameter("flightnumber");
		if(flightNumber == null) {
			request.setAttribute("ERROR", "Cannot add Fare details");
			rd = getServletContext().getRequestDispatcher("/admindetails.jsp");
			rd.forward(request, response);
		}else if(flightNumber != null) {
			session.setAttribute("flightnumber", flightNumber);
			rd = getServletContext().getRequestDispatcher("/addfaredetails.jsp");
			rd.forward(request, response);

		}

	}

}
