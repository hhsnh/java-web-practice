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
</head>

<body>
	<div class="container">
	<div id="topexplain">
		<div>企业日常事务管理系统，为企业内部通信提供最简便的服务！
		<c:if test="${!(empty employee) }">
			<a id="logout" style="float: right;" urn="jsmenu5" href="Logout" rel="conmenu" >注销</a>
		</c:if>
			<c:if test="${(empty employee) }">
			<a id="login" style="float: right;" urn="jsmenu3" href="statusRecognise.jsp" rel="conmenu" >登录</a>
		</c:if>
		</div>
	</div>
	
	<div ><img src="images/banner.jpg" class="img-rounded" /></div>
	<nav class="navbar navbar-default" role="navigation"> 
	   <div class="navbar-header"> 
	      <a class="navbar-brand active" href="index.jsp">首页</a> 
	   </div> 
	   <div> 
	      <ul class="nav navbar-nav">
	      	<li><a href="GetMessageList">消息列表</a></li>
	      	<li><a href="publishNewMsg.jsp">发布新消息</a></li>
	      	<c:if test="${employee.lead}">
	        	<li ><a href="GetEmployee">员工管理</a></li>
	        </c:if> 
	       </ul> 
	   </div> 
	</nav> 
	<div id="indexfirst">
	<div id="thenew">
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
	<div id="menunav">
	<div class="tit">
	  <h1>员工信息</h1>
	</div>
	<div id="employee">
		<c:choose>
			<c:when test="${empty sessionScope.employee}">
				没有进行身份识别，请先进行身份识别!
			</c:when>
			<c:otherwise>
				<ul>
				  <li>员工编号：${employee.employeeID}</li>
				  <li>员工姓名：${employee.employeeName}</li>
				  <li>员工性别：${employee.employeeSex ? "男" : "女"}</li>
				  <li>出生日期：${employee.employeeBirth }</li>
				  <li>办公室电话：${employee.employeePhone }</li>
				  <li>住址：${employee.employeePlace }</li>
				  <li>管理层领导：${employee.lead ? '是' : '否'}</li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
	</div>
	</div>
	<div id="indexsec"></div>
	<div class="copyright"><ul><li></li>
	<li>企业日常事务管理系统 &nbsp;&copy;2009-2010</li>
	</ul>
	</div>
	<div class="end"></div>
	</div>
	<script type=text/javascript>
	startajaxtabs("jsmenu");
	var iTab=GetCookie("nets_jsmenu");
		iTab = iTab ? parseInt(iTab):parseInt(Math.random()*5);
		if(iTab!=0) getElement("jsmenu").getElementsByTagName("h1")[iTab].LoadTab();
		iTab++;
		if(iTab>4) iTab=0;
		SetCookie("nets_jsmenu",iTab,365);
	function getElement(aID)
	{
	  return (document.getElementById) ? document.getElementById(aID)
	                                   : document.all[aID];
	}
	</script>
</body>
</html>

