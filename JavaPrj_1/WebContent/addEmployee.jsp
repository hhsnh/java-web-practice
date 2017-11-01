<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.sanqing.bean.Employee"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>员工管理</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
		  <h1>添加员工</h1>
		<div id="addEmployee" >
			<c:choose>
				<c:when test="${empty sessionScope.employee}">
					没有进行身份识别，请先进行身份识别!
				</c:when>
				<c:when test="${!sessionScope.employee.lead}">
					不是领导，没有权限!
				</c:when>
				<c:otherwise>
				<form calss="form-horizontal" role="form" action="AddEmployeeAction" method="POST">
					<div class="form-group col-sm-12">
						<label class="col-sm-1 control-label">工号</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="employeeID" name="employeeID" placeholder="请输入员工号">
						</div>
					</div>
					<div class="form-group col-sm-12">
						<label class="col-sm-1 control-label">姓名</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="employeeName" name="employeeName" placeholder="请输入员工姓名">
						</div>
					</div>
					<div class="col-sm-12">
						<label class="col-sm-1 control-label">性别</label>
						<div class="radio col-sm-2">
						<label class="radio-inline">
							<input type="radio" name="employeeSex"	value='True'>男
						</label>
						<label class="radio-inline">
							<input type="radio" name="employeeSex"	value='False'>女
						</label>
					</div>
					</div>
					<div class="form-group col-sm-12">
						<label class="col-sm-1 control-label">生日</label>
						<div class="col-sm-2">
							<input type="date" class="form-control" id="employeeBirth" name="employeeBirth" >
						</div>
					</div>
					<div class="form-group col-sm-12">
						<label class="col-sm-1 control-label">电话</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="employeePhone" name="employeePhone" >
						</div>
					</div>
					<div class="form-group col-sm-12">
						<label class="col-sm-1 control-label">地址</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="employeePlace" name="employeePlace" >
						</div>
					</div>
					<div class="form-group col-sm-12">
						<label class="col-sm-1 control-label">入职时间</label>
						<div class="col-sm-2">
							<input type="date" class="form-control" id="joinTime" name="joinTime" >
						</div>
					</div>
					<div class="form-group col-sm-12">
						<label class="col-sm-1 control-label">密码</label>
						<div class="col-sm-2">
							<input type="password" class="form-control" id="password" name="password" >
						</div>
					</div>
					<div class="col-sm-12">
						<label class="col-sm-1 control-label">是否领导</label>
						<div class="radio col-sm-2">
						<label class="radio-inline">
							<input type="radio" name="isLead"	value='True'>是
						</label>
						<label class="radio-inline">
							<input type="radio" name="isLead"	value='False'>否
						</label>
					</div>
					</div>
					<div class="form-group col-sm-12">
						<label class="col-sm-1 control-label"></label>
						<div class="col-sm-2">
							<button type="submit" class="btn btn-default"  >提交</button> 
						</div>
						<div class="col-sm-2">
							<button type="reset" class="btn btn-default"  >重置</button> 
						</div>
					</div>
				 </form>
				</c:otherwise>
			</c:choose>
		</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	</body>
</html>