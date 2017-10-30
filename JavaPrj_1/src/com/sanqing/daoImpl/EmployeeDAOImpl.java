package com.sanqing.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.sanqing.bean.Employee;
import com.sanqing.dao.EmployeeDAO;
import com.sanqing.util.DBConnection;
import com.sanqing.util.Page;

public class EmployeeDAOImpl implements EmployeeDAO {

	public void addEmployee(Employee employee) {
		Connection conn=DBConnection.getConnection();
		String insertSQL="insert into tb_employee values (?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=null;		
		try{
			pstmt=conn.prepareStatement(insertSQL);
			pstmt.setInt(1,employee.getEmployeeID());
			pstmt.setString(2, employee.getEmployeeName());
			pstmt.setBoolean(3, employee.isEmployeeSex());
			pstmt.setDate(4, new java.sql.Date(employee.getEmployeeBirth().getTime()));
			pstmt.setString(5, employee.getEmployeePhone());
			pstmt.setString(6, employee.getEmployeePlace());
			pstmt.setDate(7, new java.sql.Date(employee.getJoinTime().getTime()));
			pstmt.setString(8, employee.getPassword());
			pstmt.setBoolean(9, employee.isLead());
			pstmt.execute();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
	}

	public void deleteEmployee(int employeeID) {
		Connection conn = DBConnection.getConnection();
		String deleteSQL = "delete from  tb_employee where employeeID=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(deleteSQL);
			pstmt.setInt(1, employeeID);
			pstmt.execute();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
	}

	public List<Employee> findAllEmployee(Page page) {
		Connection conn = DBConnection.getConnection();
		String findSql="select * from tb_employee order by employeeID limit ?,?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Employee> employees = new ArrayList<Employee>();
		
		try {
			pstmt = conn.prepareStatement(findSql);
			pstmt.setInt(1, page.getBeginIndex());
			pstmt.setInt(2, page.getEveryPage());
			rs = pstmt.executeQuery();
			while(rs.next()){
				Employee employee = new Employee();
				employee.setEmployeeID(rs.getInt(1));
				employee.setEmployeeName(rs.getString(2));
				employee.setEmployeeSex(rs.getBoolean(3));
				employee.setEmployeeBirth(rs.getDate(4));
				employee.setEmployeePhone(rs.getString(5));
				employee.setEmployeePlace(rs.getString(6));
				employee.setJoinTime(rs.getDate(7));
				employee.setPassword(rs.getString(8));
				employee.setLead(rs.getBoolean(9));
				employees.add(employee);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnection.close(rs);
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
		
		return employees;
	}

	public Employee findEmployeeById(int employeeID) {
		Connection conn = DBConnection.getConnection();		//������Ӷ���
		String findByIDSQL = "select * from " +
						"tb_employee where employeeID = ?";	//SQL���
		PreparedStatement pstmt = null;	//����Ԥ�������
		ResultSet rs = null;
		Employee employee = null;
		try {
			pstmt = conn.prepareStatement(findByIDSQL);		//���Ԥ������󲢸�ֵ
			pstmt.setInt(1, employeeID);					//���ò���
			rs = pstmt.executeQuery();						//ִ�в�ѯ
			if(rs.next()) {
				employee = new Employee();
				employee.setEmployeeID(rs.getInt(1));		//����Ա�����
				employee.setEmployeeName(rs.getString(2));	//����Ա������
				employee.setEmployeeSex(rs.getBoolean(3));	//����Ա���Ա�
				employee.setEmployeeBirth(rs.getDate(4));	//���ó�������
				employee.setEmployeePhone(rs.getString(5));	//���ð칫�ҵ绰
				employee.setEmployeePlace(rs.getString(6));	//����סַ
				employee.setJoinTime(rs.getDate(7));		//����¼��ʱ��
				employee.setPassword(rs.getString(8));		//����ϵͳ����
				employee.setLead(rs.getBoolean(9));			//�����Ƿ�Ϊ������쵼
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(rs);								//�رս��������
			DBConnection.close(pstmt);							//�ر�Ԥ�������
			DBConnection.close(conn);							//�ر����Ӷ���
		}
		return employee;
	}
	public void updateEmployee(Employee employee) {
		Connection conn = DBConnection.getConnection();
		String updateSQL = "update tb_employee set  employeeName = ?, "+
													"employeeSex = ?,"+	
													"employeeBirth = ?,"+
													"employeePhone = ?,"+													
													"employeePlace = ?,"+
													"joinTime = ?,"+
													"password = ?,"+
													"isLead = ?"+
													" where employeeID=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(updateSQL);
			pstmt.setString(1, employee.getEmployeeName());
			pstmt.setBoolean(2, employee.isEmployeeSex());
			pstmt.setDate(3, new java.sql.Date(employee.getEmployeeBirth().getTime()));
			pstmt.setString(4, employee.getEmployeePhone());
			pstmt.setString(5, employee.getEmployeePlace());
			pstmt.setDate(6, new java.sql.Date(employee.getJoinTime().getTime()));
			pstmt.setString(7, employee.getPassword());
			pstmt.setBoolean(8, employee.isLead());
			pstmt.setInt(9,employee.getEmployeeID());
			pstmt.execute();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
	}

	@Override
	public int findAllEmpCount() {
		// TODO Auto-generated method stub
		int count = 0;
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String querySQL = "select count(*) from tb_employee";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(querySQL);
			rs = pstmt.executeQuery(querySQL);
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnection.close(rs);
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
		
		return count;
	}
	
}
