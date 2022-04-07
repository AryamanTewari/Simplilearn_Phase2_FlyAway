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
import com.flyaway.model.Reservation;

/**
 * Servlet implementation class ConfirmPayment
 */
@WebServlet("/confirmpayment")
public class ConfirmPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		String cardName = request.getParameter("cardname");
		String cardNo = request.getParameter("cardno");
		String date = request.getParameter("paymentdate");

		if(session != null && (cardName != null && cardName.trim() != "") && (cardNo != null && cardNo.trim() != "" )
				&& date != null) {

			session.setAttribute("cardname", cardName);
			session.setAttribute("cardno", cardNo);
			session.setAttribute("paymentdate", date);

			Flight flight = (Flight)session.getAttribute("flightobject");
			Fare fare = (Fare)session.getAttribute("fareobject");
			String travelDate = (String)session.getAttribute("traveldate");
			int passengers = (int)session.getAttribute("passengers");
			String day = (String)session.getAttribute("day");
			int customerId = (int)session.getAttribute("customerId");
			int bookingId = 0;

			Reservation reservation = new Reservation();
			CustomerDAO cust = new CustomerDAO();
			double totalFare = cust.calculateFare(flight.getFlightNumber(), 
					fare.getTravelClass() , passengers);

			reservation.setFlightNumber(flight.getFlightNumber());
			reservation.setTravelClass(fare.getTravelClass());
			reservation.setTravelDate(cust.getDate(travelDate));
			reservation.setPassengers(passengers);
			reservation.setTotalFare(totalFare);
			reservation.setCustomerId(customerId);

			bookingId = cust.addReservation(reservation);

			if(bookingId != 0) {
				session.setAttribute("bookingId", bookingId);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/bookingdetails.jsp");
				rd.forward(request, response);
			}
		}else {
			request.setAttribute("Error", "Error in processing payment please try again later");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/payment.jsp");
			rd.forward(request, response);
		}

	}

}
