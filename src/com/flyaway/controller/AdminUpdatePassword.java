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

/**
 * Servlet implementation class AdminUpdatePassword
 */
@WebServlet("/adminupdatepassword")
public class AdminUpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd;
		HttpSession session = request.getSession(false);	
		Integer adminId = (Integer)session.getAttribute("adminId");
		AdminDAO admin = new AdminDAO();
		String status = "";

		if(adminId != null) {

			String password = request.getParameter("password");

			if(password != null && password.trim() != "") {

				status = admin.updatePasswordAdmin(adminId, password);
				if(status == "SUCCESS") {
					request.setAttribute("SUCCESS", "Password Successfully Updated");
					rd = getServletContext().getRequestDispatcher("/admindetails.jsp");
					rd.forward(request, response);
				}else if(status == "FAIL") {

					request.setAttribute("FAIL", "Error while Updating Password");
					rd = getServletContext().getRequestDispatcher("/admindetails.jsp");
					rd.forward(request, response);
				}
			}else {

				request.setAttribute("FAIL1", "Error while Updating Password");
				rd = getServletContext().getRequestDispatcher("/admindetails.jsp");
				rd.forward(request, response);

			}
		}



	}

}
