package com.sanqing.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sanqing.bean.Employee;
import com.sanqing.dao.EmployeeDAO;
import com.sanqing.factory.EmployeeDAOFactory;
import com.sanqing.util.Page;
import com.sanqing.util.PageUtil;

/**
 * Servlet implementation class GetEmployee
 */
public class GetEmployeeById extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String employeeID = request.getParameter("employeeID");
				EmployeeDAO employeeDao = EmployeeDAOFactory.getEmployeeDAOInstance();			
		Employee theEmployee = employeeDao.findEmployeeById(Integer.parseInt(employeeID));
		request.setAttribute("theEmployee", theEmployee);

//		ServletContext servletcontext = getServletContext();
//		RequestDispatcher dispatcher = servletcontext.getRequestDispatcher("/stuffManage.jsp");
//		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
