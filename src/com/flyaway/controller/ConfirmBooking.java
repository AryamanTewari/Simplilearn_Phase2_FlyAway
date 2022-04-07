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
 * Servlet implementation class ConfirmBooking
 */
@WebServlet("/confirmbooking")
public class ConfirmBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if(session != null) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/payment.jsp");
			rd.forward(request, response);

		}else {
			request.setAttribute("Error", "Error Occured while confirming ticket");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/confirmbooking.jsp");
			rd.forward(request, response);
		}

	}

}

