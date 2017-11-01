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
		<link href="css/base.css" rel="stylesheet">
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</head>
<body>
<nav class="navbar navbar-default" role="navigation"> 
	   <div class="navbar-header"> 
	      <a class="navbar-brand" href="index.jsp">首页</a> 
	   </div> 
	   <div> 
	      <ul class="nav navbar-nav">
	      	<li><a href="GetMessageList">消息列表</a></li>
	      	<li><a href="publishNewMsg.jsp">发布新消息</a></li>
	      	<c:if test="${employee.lead}">
	        	<li class="active"><a href="GetEmployee">员工管理</a></li>
	        </c:if> 
	       </ul> 
	   </div> 
	</nav> 
	<ol class="breadcrumb">
		<li><a href="index.jsp">首页</a></li>
		<li><a href="GetEmployee">员工管理</a></li>
		<li class="active">添加员工</li>
	</ol>
	<section id="addEmployee" class="container">
		<div class="row">
		<div class="col-sm-offset-2 col-sm-8">
		  <div class="text-center">
		  	<h1>添加员工</h1>
		  </div>
			<c:choose>
				<c:when test="${empty sessionScope.employee}">
					没有进行身份识别，请先进行身份识别!
				</c:when>
				<c:when test="${!sessionScope.employee.lead}">
					不是领导，没有权限!
				</c:when>
				<c:otherwise>
					<form class="form-horizontal"  action="AddEmployeeAction" method="POST">
						  <div class="form-group">
						    <label class="col-sm-2 control-label" for="employeeID">工号</label>
						    <div class="col-sm-10">
						      <input class="form-control" type="text" id="employeeID" name="employeeID" placeholder="">
						    </div>
						  </div>
						   <div class="form-group">
						    <label class="col-sm-2 control-label" for="employeeName">姓名</label>
						    <div class="col-sm-10">
						      <input class="form-control" type="text" id="employeeName" name="employeeName" placeholder="Full name">
						    </div>
						  </div>
						  <div class="form-group">
							<label class="col-sm-2 control-label" for="employeeSex">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline">
									<input type="radio" name="employeeSex"	value='True'>男
								</label>
								<label class="radio-inline">
									<input type="radio" name="employeeSex"	value='False'>女
								</label>
							</div>
						  </div>
						  <div class="form-group">
							<label class="col-sm-2 control-label" for="employeeBirth">生日</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" id="employeeBirth" name="employeeBirth" >
							</div>
						  </div>
						  <div class="form-group">
							<label class="col-sm-2 control-label" for="employeePhone">电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="employeePhone" name="employeePhone" >
							</div>
						  </div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="employeePlace">地址</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="employeePlace" name="employeePlace" >
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="joinTime">入职时间</label>
								<div class="col-sm-10">
									<input type="date" class="form-control" id="joinTime" name="joinTime" >
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="password">密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="password" name="password" >
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">是否领导</label>
								<div class="col-sm-10">
								<label class="radio-inline">
									<input type="radio" name="isLead"	value='True'>是
								</label>
								<label class="radio-inline">
									<input type="radio" name="isLead"	value='False'>否
								</label>
								</div>
							</div>
						  <div class="form-group">
							<div class="col-sm-offset-4 col-sm-4">
								<button type="submit" class="btn btn-success btn-lg"  >提交</button> 
							</div>
							<div class="col-sm-4">
								<button type="reset" class="btn btn-danger btn-lg"  >重置</button> 
							</div>
						  </div>
	  					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	</section>
	</body>
</html>