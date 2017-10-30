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
public class GetEmployee extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int currentPage = 0;
		String currentPageStr = request.getParameter("currentPage");
		if(currentPageStr == null || "".equals(currentPageStr)){
			currentPage = 1;
		}else{
			currentPage = Integer.parseInt(currentPageStr);
		}
		EmployeeDAO employeeDao = EmployeeDAOFactory.getEmployeeDAOInstance();
		Page page = PageUtil.createPage(10, employeeDao.findAllEmpCount(), currentPage);
		
		List<Employee> employees = employeeDao.findAllEmployee(page);
		request.setAttribute("employeeList", employees);
		request.setAttribute("page", page);
		ServletContext servletcontext = getServletContext();
		RequestDispatcher dispatcher = servletcontext.getRequestDispatcher("/stuffManage.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
