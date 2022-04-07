package com.flyaway.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.AdminDAO;
import com.flyaway.model.Fare;

/**
 * Servlet implementation class AddFareDetails
 */
@WebServlet("/addfaredetails")
public class AddFareDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd;
		boolean flag =  false;
		HttpSession session = request.getSession(false);
		String flightNumber = (String)session.getAttribute("flightnumber");
		Integer conFlightNumber = 0;
		String travelClass = request.getParameter("travelclass");
		String fare = request.getParameter("fare");
		Fare fareObj = new Fare();
		AdminDAO admin = new AdminDAO();
		String status = "";
		double classFare = 0.00;
		try {
			conFlightNumber = Integer.parseInt(flightNumber);
			classFare = Double.parseDouble(fare);

		}catch(Exception e) {
			flag = true;
		}


		if((conFlightNumber != 0 && conFlightNumber != null) && 
				(travelClass != null && travelClass.trim() != "") &&
				(classFare != 0.00) && (flag == false)) {

			fareObj.setFlightNumber(conFlightNumber);
			fareObj.setTravelClass(travelClass);
			fareObj.setFare(classFare);

			status = admin.addFare(fareObj);
			if(status == "SUCCESS") {

				request.setAttribute("SUCCESS", "Fare Added Successfully");
				rd = getServletContext().getRequestDispatcher("/admindetails.jsp");
				rd.forward(request, response);

			}else if(status == "FAIL") {

				request.setAttribute("FAIL", "ERROR Occured while adding Fare");
				rd = getServletContext().getRequestDispatcher("/admindetails.jsp");
				rd.forward(request, response);


			}

		}else {

			request.setAttribute("FAIL", "ERROR Occured while adding Fare");
			rd = getServletContext().getRequestDispatcher("/admindetails.jsp");
			rd.forward(request, response);
		}

	}

}
