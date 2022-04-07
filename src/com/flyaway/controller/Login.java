package com.flyaway.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.CustomerDAO;
import com.flyaway.model.Flight;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String email = request.getParameter("emailaddress");
		String password = request.getParameter("password");

		RequestDispatcher rd;
		CustomerDAO cust = new CustomerDAO();
		if((email != null && email.trim() != "") && (password != null && password.trim() != "")) {
			int customerId = cust.customerLogin(email, password);
			if(customerId != 0) {

				HashMap<String, Object> map = new HashMap<String, Object>();
				HttpSession oldSession = request.getSession(false);
				HttpSession newSession = null;
				if (oldSession != null) {
					Enumeration keys = oldSession.getAttributeNames();
					while(keys.hasMoreElements()) {
						String key = (String)keys.nextElement();
						map.put(key, oldSession.getAttribute(key));
						oldSession.removeAttribute(key);			
					}

					oldSession.invalidate();	
					newSession = request.getSession();
					for(Map.Entry<String , Object> m : map.entrySet()) {

						newSession.setAttribute((String)m.getKey(), m.getValue());
						map.remove(m);
					}


				}else if(oldSession == null)  {

					newSession = request.getSession();
				}


				Flight flight = (Flight)newSession.getAttribute("flightobject");
				if (flight == null) {

					newSession.setAttribute("customerId", customerId);
					rd = getServletContext().getRequestDispatcher("/customerdetails.jsp");
					rd.forward(request, response);

				}else {
					newSession.setAttribute("customerId", customerId);
					rd = getServletContext().getRequestDispatcher("/confirmbooking.jsp");
					rd.forward(request, response);

				}



			}else {
				request.setAttribute("loginerr", "Incorrect email or Password");
				rd = getServletContext().getRequestDispatcher("/login.jsp");
				rd.forward(request, response);

			}
		}else {

			request.setAttribute("loginerr1", "Error Occured while login in");
			rd = getServletContext().getRequestDispatcher("/login.jsp");
			rd.forward(request, response);

		}




	}

}
