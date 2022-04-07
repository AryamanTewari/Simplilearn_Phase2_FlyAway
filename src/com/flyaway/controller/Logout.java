package com.flyaway.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getSession().getAttribute("customerId")!=null)
		{
			request.getSession().invalidate();
			
			response.sendRedirect("index.jsp");
		}else if(request.getSession().getAttribute("adminId")!=null) {
			request.getSession().invalidate();
			
			response.sendRedirect("index.jsp");
		}else {
			
			request.getSession().invalidate();
			
			response.sendRedirect("index.jsp");
			
		}	
	}

	

}
