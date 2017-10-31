<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.sanqing.bean.Employee"%>
<!DOCTYPE html>
<html>
<head>
<title>员工管理</title>
</head>
<body>

<div id="menunav">
<div class="tit">
  <h1>更改员工信息</h1>
</div>
<div id="updateEmployee">
	<c:choose>
		<c:when test="${empty sessionScope.employee}">
			没有进行身份识别，请先进行身份识别!
		</c:when>
		<c:when test="${!sessionScope.employee.lead}">
			不是领导，没有权限!
		</c:when>
		<c:otherwise>
		<form action="UpdateEmployeeAction" method="POST">
			<p>员工编号：<input type="text" name="employeeID" value="${sessionScope.employeeModify.employeeID }" readonly="readonly" /></p>
		  	<p>&nbsp;</p>
		  	<p>员工姓名：<input type="text" name="employeeName" value="${sessionScope.employeeModify.employeeName }"	/></p>
		  	<p>&nbsp;</p>
		  	<p>员工性别：<input type="radio" name="employeeSex"	value='True' <c:if test="${sessionScope.employeeModify.employeeSex }"> checked="checked"</c:if> >男
		  			     <input type="radio" name="employeeSex"	value='False' <c:if test="${!sessionScope.employeeModify.employeeSex }"> checked="checked"</c:if> >女</p>
		  	<p>&nbsp;</p>
		  	<p>员工生日：<input type="date" name="employeeBirth" value="${sessionScope.employeeModify.employeeBirth }"/></p>
		  	<p>&nbsp;</p>
		  	<p>手机号码：<input type="text" name="employeePhone" value="${sessionScope.employeeModify.employeePhone }" /></p>
		  	<p>&nbsp;</p>
		  	<p>家庭地址：<input type="text" name="employeePlace" value="${sessionScope.employeeModify.employeePlace }" /></p>
		  	<p>&nbsp;</p>
		  	<p>入职时间：<input type="date" name="joinTime" value="${sessionScope.employeeModify.joinTime }" /></p>
		  	<p>&nbsp;</p>
		  	<p>登录密码：<input type="password" name="password" value="${sessionScope.employeeModify.password }" /></p>
		  	<p>&nbsp;</p>
		  	<p>是否领导：<input type="radio" name="isLead"	value='True' <c:if test="${sessionScope.employeeModify.lead }"> checked="checked"</c:if> >是
		  				 <input type="radio" name="isLead"	value='False' <c:if test="${!sessionScope.employeeModify.lead }"> checked="checked"</c:if> >否</p>
		  	<p>&nbsp;</p>

		  	
		  	<p><input type="submit" value="更新" />
		    <input type="reset" value="重置" /></p>
		 </form>
		</c:otherwise>
	</c:choose>
</div>
</div>


</body>
</html>