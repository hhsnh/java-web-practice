package com.sanqing.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sanqing.bean.Employee;
import com.sanqing.dao.EmployeeDAO;
import com.sanqing.factory.EmployeeDAOFactory;

public class AddEmployee extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  request.setCharacterEncoding("UTF-8");
		ServletContext servletContext = getServletContext();	//���ServletContex
		RequestDispatcher dispatcher = null;

		int employeeID = Integer.parseInt(request.getParameter("employeeID"));	//����Ա����Ų���
		
		String employeeName = request.getParameter("employeeName");		
		Boolean employeeSex = Boolean.parseBoolean(request.getParameter("employeeSex"));//�Ա�
		String employeeBirthDate = request.getParameter("employeeBirth");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date employeeBirth = null;
		try {
			employeeBirth = sdf.parse(employeeBirthDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String employeePhone = request.getParameter("employeePhone");
		String employeePlace = request.getParameter("employeePlace");
		String joinTimeDate = request.getParameter("joinTime");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		Date joinTime = null;
		try {
			joinTime = sdf1.parse(joinTimeDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Boolean isLead = Boolean.parseBoolean(request.getParameter("isLead"));
		String password = request.getParameter("password");		//����ϵͳ�������
		if(employeeID == 0 || "".equals(employeeID)) {		//�ж��Ƿ�����Ա�����
			request.setAttribute("error", "������Ա�����!");
			dispatcher = servletContext.
					getRequestDispatcher("/stuffManage.jsp");//������תҳ��
		}else {
			if(password == null || "".equals(password)) {		//�ж��Ƿ�����ϵͳ����
				request.setAttribute("error", "������ϵͳ����!");
				dispatcher = servletContext.
					getRequestDispatcher("/stuffManage.jsp");//������תҳ��
			}else {
				Employee employee = new Employee();
				employee.setEmployeeID(employeeID);
				employee.setEmployeeName(employeeName);
				employee.setEmployeeSex(employeeSex);
				employee.setEmployeeBirth(employeeBirth);
				employee.setEmployeePhone(employeePhone);
				employee.setEmployeePlace(employeePlace);
				employee.setJoinTime(joinTime);
				employee.setPassword(password);
				employee.setLead(isLead);
				EmployeeDAO employeeDAO = 
					EmployeeDAOFactory.getEmployeeDAOInstance();//���DAOʵ����ʵ��
				try{
					employeeDAO.addEmployee(employee);
				}catch(Exception e){
					e.printStackTrace();
					request.setAttribute("error", "����Ա��ʧ��!");
				}finally{
					
					dispatcher = servletContext.
							getRequestDispatcher("/GetEmployee");
				}
			}
		}
		dispatcher.forward(request, response);//������ת
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
