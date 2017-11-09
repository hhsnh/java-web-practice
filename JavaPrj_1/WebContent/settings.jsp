<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.sanqing.dao.MessageDAO"%>
<%@page import="com.sanqing.factory.MessageDAOFactory"%>
<%@page import="com.sanqing.util.Page"%>
<%@page import="com.sanqing.util.PageUtil"%>
<%@page import="com.sanqing.bean.Message"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>企业日常事务管理系统-首页</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/base.css">
	<script src="js/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>

<body>
<!-- 	导航栏 -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
<!-- 			导航栏 Logo头 -->
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp">
					<img alt="logo" src="images/logo.jpg" class="img-responsive">
				</a>
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-menu" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
<!-- 			导航栏-选项 -->
			<div id="nav-menu" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li>
						<a href="index.jsp">
							<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
							Home
						</a>
					</li>
					<li>
						<a href="GetMessageList">
							<span class="glyphicon glyphicon-bell" aria-hidden="true"></span>
							消息列表
						</a>
					</li>
					<li>
						<a href="GetEmployee">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							员工列表
						</a>
					</li>
				</ul>
<!-- 				登录、注册按钮 -->
				<c:if test="${(empty employee) }">
				
				<form id="sign" role="form" class="form-inline" action="StatusRecogniseAction" method="post">
			      <div class="input-group">
			      	<span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
			        <input id="employeeID" name="employeeID" type="text" class="form-control" placeholder="username">			        
			      </div>
			      <div class="input-group">
			      	<span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
			      	<input id="password" name="password" type="password" class="form-control">			        
			      </div>
			      <div id="login" class="btn-group-inline pull-right">
					<input id="signIn" type="submit" class="btn btn-success" value="登录">
					<button id="signUp" type="button" class="btn btn-success" onclick="#">注册</button>
				  </div>
			    </form>
				</c:if>
				<c:if test="${!(empty employee) }">
<!-- 				发布新消息按钮 -->

					<button id="tweet" class="btn btn-primary pull-right" onclick="location='publishNewMsg.jsp'">
					  <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
					  新消息
					</button>
<!-- 			导航栏——profile选项 -->				
					<div id="nav-options" class="btn-group pull-right">
						<button type="button" class="btn btn-default dropdown-toggle thumbnail" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<img alt="profile" src="images/jon.png">
						</button>
						<ul class="dropdown-menu">
							<li><a href="index.jsp">个人主页</a></li>
							<li><a href="settings.jsp">设置</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="Logout">注销</a></li>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</nav>

<!-- 	内容布局 -->
	<div class="container">
		<div class="row">
<!-- 			左侧栏 -->

			<div id="profile" class="col-md-3 hidden-sm hidden-xs">
<!-- 				卡片模块 -->
				<div id="profile-resume" class="card">
					<img class="card-img-top img-responsive" src="images/hotbloom.jpg">
					<div class="card-block">
						<img class="card-img" src="images/jon.png">
						<h4 class="card-title">SPDB<small>@spdb</small></h4>
						<p class="card-text">社会我浦哥，人狠话不多</p>
						<ul class="list-inline list-unstyled">
							<li id="card-tweet">
								<span class="profile-states">消息</span>
								<span class="profile-value">99</span>
							</li>
							<li id="card-following">
								<span class="profile-states">关注</span>
								<span class="profile-value">8</span>
							</li>
							<li id="card-follower">
								<span class="profile-states">粉丝</span>
								<span class="profile-value">10k</span>
							</li>
						</ul>
					</div>
				</div>
<!-- 				胶囊式导航栏 -->
				<div id="profile-settings" class="card">
					<ul id="setting-pills" class="nav nav-pills nav-stacked">
						<li role="presentation" class="active">
							<a href="#settings-account" data-toggle="pill">
								Acount
								<span class="glyphicon glyphicon-chevron-right pull-right" aria-hidden="true"></span>
							</a>
						</li>
						<li role="presentation">
							<a href="#settings-security" data-toggle="pill">
								Security
								<span class="glyphicon glyphicon-chevron-right pull-right" aria-hidden="true"></span>
							</a>
						</li>
						<li role="presentation">
							<a href="#" data-toggle="pill">
								Notifications
								<span class="glyphicon glyphicon-chevron-right pull-right" aria-hidden="true"></span>
							</a>
						</li>
						<li role="presentation">
							<a href="#" data-toggle="pill">
								Design
								<span class="glyphicon glyphicon-chevron-right pull-right" aria-hidden="true"></span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			
<!-- 			中间栏 -->
			<div id="main" class="col-md-6">
<!-- 			对应pills的tabs展示 -->
				<div class="tab-content" >
<!-- 					对应第一个pill -->
					<div role="pillpanel" class="tab-pane fade in active" id="settings-account">
						<ul  id="account-tabs" class="nav nav-tabs nav-justified" >
							<li role="presentation"  class="active">
								<a href="#account-user" data-toggle="tab">用户信息</a>
							</li>
							<li role="presentation">
								<a href="#account-language" data-toggle="tab">语言</a>
							</li>
							<li role="presentation">
								<a href="#account-mobile" data-toggle="tab">手机</a>
							</li>
						</ul>
		<!-- 				panel展示 -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="account-user">
								<form id="update-account" action="UpdateEmployeeAction" method="post">
									<c:choose>
										<c:when test="${empty sessionScope.employee}">
											没有进行身份识别，请先进行身份识别!
										</c:when>
										<c:otherwise>
											<div class="form-group">
												<dt>
													<label for="employeeName">姓名</label>
												</dt>
												<dd class="input-group">
													<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
													<input type="text" class="form-control" id="employeeName" name="employeeName" value="${employee.employeeName}">
												</dd>
											</div>
											<div class="form-group">
												<dt>
													<label for="employeeID">工号</label>
												</dt>
												<dd class="input-group">
													<span class="input-group-addon"><span class="glyphicon glyphicon-barcode"></span></span>
													<input type="text" class="form-control" id="employeeID" name="employeeID" value="${employee.employeeID}">
												</dd>
											</div>
											<div class="form-group">
												<dt>
													<label for="employeePhone">电话</label>
												</dt>
												<dd class="input-group">
													<span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
													<input type="text" class="form-control" id="employeePhone" name="employeePhone" value="${employee.employeePhone}">
												</dd>
											</div>
											<div class="form-group">
												<dt>
													<label for="password">密码</label>
												</dt>
												<dd class="input-group">
													<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
													<input type="text" class="form-control" id="password" name="password" value="${employee.password}">
												</dd>
											</div>
											<div class="form-group">
												<dt>
													<label for="employeePlace">地址</label>
												</dt>
												<dd class="input-group">
													<span class="input-group-addon"><span class="glyphicon glyphicon-home"></span></span>
													<input type="text" class="form-control" id="employeePlace" name="employeePlace" value="${employee.employeePlace}">
												</dd>
											</div>
											<div class="form-group">
												<dt>
													<label for="employeeBirth">生日</label>
												</dt>
												<dd class="input-group">
													<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
													<input type="text" class="form-control" id="employeeBirth" name="employeeBirth" value="${employee.employeeBirth}">
												</dd>
											</div>
											<div class="form-group">
												<dt>
													<label for="joinTime">入职时间</label>
												</dt>
												<dd class="input-group">
													<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
													<input type="text" class="form-control" id="joinTime" name="joinTime" value="${employee.joinTime}">
												</dd>
											</div>
											<div class="form-checkbox">
												<dt>
													<label for="employeeSex">性别</label>
												</dt>
												<dd class="checkbox">
													<label>
														<input type="radio" class="radio-inline" id="employeeSex1" value='True' name="employeeSex"  <c:if test="${employee.employeeSex}">checked="checked"</c:if>/>男		
													</label>										
													<label>
														<input type="radio" class="radio-inline" id="employeeSex2" value='False' name="employeeSex" <c:if test="${!employee.employeeSex}">checked="checked"</c:if>/>女
													</label>
												</dd>
											</div>
											<div class="form-checkbox">
												<dt>
													<label for="isLead">是否领导</label>
												</dt>
												<dd class="checkbox">
													<label>
														<input type="radio" class="radio-inline" id="isLead1" value='True' name="isLead"  <c:if test="${employee.lead}">checked</c:if>/>是			
													</label>										
													<label>
														<input type="radio" class="radio-inline" id="isLead2" value='False' name="isLead" <c:if test="${!employee.lead}">checked</c:if>/>否
													</label>
												</dd>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-4 col-sm-4">
													<button type="submit" class="btn btn-success btn-lg"  >更新</button> 
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</form>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="account-language">
								语言展示页面
							</div>
							<div role="tabpanel" class="tab-pane fade" id="account-mobile">
								手机展示页面
							</div>
						</div>
					</div>
<!-- 					对应第二个pill -->
					<div role="pillpanel" class="tab-pane fade " id="settings-security">
						<ul  id="security-tabs" class="nav nav-tabs nav-justified" >
							<li role="presentation"  class="active">
								<a href="#security-user" data-toggle="tab">用户安全</a>
							</li>
							<li role="presentation">
								<a href="#security-language" data-toggle="tab">安全语言</a>
							</li>
							<li role="presentation">
								<a href="#security-mobile" data-toggle="tab">安全手机</a>
							</li>
						</ul>
		<!-- 				panel展示 -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="security-user">
								安全安全用户信息展示页面
							</div>
							<div role="tabpanel" class="tab-pane fade" id="security-language">
								安全安全语言展示页面
							</div>
							<div role="tabpanel" class="tab-pane fade" id="security-mobile">
								安全安全手机展示页面
							</div>
						</div>
					</div>
<!-- 					第三个pill -->
					<div role="pillpanel" class="tab-pane fade " id="notifications-security">
					</div>
<!-- 					第四个pill -->
					<div role="pillpanel" class="tab-pane fade " id="design-security">
					</div>
				</div>				
			</div>
<!-- 			右侧栏 -->
			<div id="right-content" class="col-md-3 hidden-sm hidden-xs">
				
			</div> 
		</div>
	</div>
<!-- 	页脚 -->
	<footer>
		<div class="container">
			
		</div>
	</footer>
</body>
</html>

