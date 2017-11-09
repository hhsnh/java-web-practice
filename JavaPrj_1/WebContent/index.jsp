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
			</div>
			
<!-- 			中间栏 -->
			<div id="main" class="col-md-6">
				<div class="tit">
				  <h1>最新消息</h1>
				</div>
				<div class="STYLE1" id="therecom">
					<%
						MessageDAO messageDAO = MessageDAOFactory.getMessageAOInstance();
						Page pageX = PageUtil.createPage(6, messageDAO.findAllCount(), 1);
						List<Message> messages = messageDAO.findAllMessagee(pageX);
						for(Message message : messages) {
					%>
						<p><a href="GetMessage?messageID=<%=message.getMessageID()%>"><%=message.getMessageTitle()%></a>
						<span class="STYLE2"><%=message.getPublishTime() %></span></p>
				 		<p>&nbsp;</p>
					<%	
						}
					 %>
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
			<div class="col-sm-2">
		      <img src="imgs/logo.png" class="img-responsive">
		    </div>
		    <div class="col-sm-2">
		      <h5>The company</h5>
		      <ul class="list-unstyled">
		        <li><a href="#">Documentation</a></li>
		        <li><a href="#">Packt publisher</a></li>
		        <li><a href="#">About us</a></li>
		        <li><a href="#">Contact</a></li>
		      </ul>
		    </div>
		    <div class="col-sm-2">
		      <h5>Social</h5>
		      <ul class="list-unstyled">
		        <li><a href="#">Facebook</a></li>
		        <li><a href="#">Twitter</a></li>
		        <li><a href="#">Blog</a></li>
		      </ul>
		    </div>
		    <div class="col-sm-2">
		      <h5>Support</h5>
		      <ul class="list-unstyled">
		        <li><a href="#">Contact</a></li>
		        <li><a href="#">Privacy police</a></li>
		        <li><a href="#">Terms & conditions</a></li>
		        <li><a href="#">Help desk</a></li>
		      </ul>
		    </div>
		    <div class="col-sm-4">
		      <address>
		        <strong>Name, Inc.</strong>
		        Address line 1<br>
		        Address line 2<br>
		        <abbr title="Phone">P:</abbr> (123) 456-7890
		      </address>
		    </div>
		</div>
	</footer>
</body>
</html>

