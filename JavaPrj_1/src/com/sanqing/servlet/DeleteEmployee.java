package com.sanqing.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sanqing.dao.EmployeeDAO;
import com.sanqing.factory.EmployeeDAOFactory;

/**
 * Servlet implementation class DeleteEmployee
 */
public class DeleteEmployee extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext servletContext = getServletContext();
		RequestDispatcher dispatcher = null;
		int employeeID = Integer.parseInt(request.getParameter("employeeID"));
		EmployeeDAO employeeDAO = EmployeeDAOFactory.getEmployeeDAOInstance();
		
		try {
			employeeDAO.deleteEmployee(employeeID);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "É¾³ýÔ±¹¤Ê§°Ü!");
		}finally {
			dispatcher = servletContext.getRequestDispatcher("/GetEmployee");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
