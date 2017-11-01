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
</head>

<body>
	<header>
	  <div class="container">
	    <!-- row 1 -->
	    <div class="row">
	      <a class="brand pull-left" href="index.jsp">永兴水暖</a>
	      <ul class="list-inline list-unstyled pull-right">
	        <li><a href="GetMessageList">消息列表</a></li>
	        <li><a href="publishNewMsg.jsp">发布消息</a></li>
	        <c:if test="${employee.lead}">
	        <li><a href="GetEmployee">员工管理</a></li>
	        </c:if>
	      </ul>
	    </div>
	  </div>
	</header>
	<section id="intro-header">
	  <div class="container">
	    <!-- row 2 -->
	    <div class="row">
	      <div class="wrap-headline">
	        <h1 class="text-center">永兴水暖</h1>
	        <h2 class="text-center">您身边的水暖专家</h2>
	        <hr>
	        <ul class="list-inline list-unstyled text-center">
	          <li>
	            <a id="sign-btn" class="btn btn-default btn-lg" href="#" role="button">登录</a>
	          </li>
	          <li>
	             <a class="btn btn-primary btn-lg" href="#" role="button">注册</a>
	          </li>
	        </ul>
	        <form id="signin" class="form-inline text-center hidden-element">
			  <div class="form-group">
			    <div class="input-group">
			      <div class="input-group-addon">@</div>
			      <input type="text" class="form-control" id="signin-email" placeholder="Email">
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="input-group">
			      <div class="input-group-addon">*</div>
			      <input type="password" class="form-control" id="signin-password" placeholder="Password">
			    </div>
			  </div>
			  <button type="submit" class="btn btn-default">Sign in</button>
			</form>
	      </div>
	    </div>
	    </div>
	</section>
	<section id="about">
  <div class="container">
    <!-- row 3 -->
    <div class="row">
      <div class="col-sm-6">
        <img src="images/girl1.jpg" class="img-responsive">
      </div>
      <div class="col-sm-6">
        <h3>Lorem ipsum dolor sit amet</h3>
        <p>
          Lorem ipsum dolor...
        </p>
      </div>
    </div>
    <hr>

    <!-- row 4 -->
    <div class="row">
      <div class="col-sm-6">
        <h3>Lorem ipsum dolor sit amet</h3>
        <p>
          Lorem ipsum dolor...
        </p>
      </div>
      <div class="col-sm-6">
		<img src="images/girl2.jpg" class="img-responsive">
      </div>
    </div>
  </div>
</section>  
<section id="features">
  <div class="container">

    <!-- row 5 -->
    <div class="row">
      <div class="col-sm-12">
        <h3 class="text-center">Features</h3>
        <p class="text-center">Features headline message</p>
      </div>
    </div>

    <!-- row 6 -->
    <div class="row">
      <div class="col-sm-2 col-md-4">
        <div class="feature">Feature</div>
      </div>
      <div class="col-sm-2 col-md-4">
        <div class="feature">Feature</div>
      </div>   
      <div class="col-sm-2 col-md-4">
        <div class="feature">Feature</div>
      </div>
      <div class="col-sm-2 col-md-4">
        <div class="feature">Feature</div>
      </div>
      <div class="col-sm-2 col-md-4">
        <div class="feature">Feature</div>
      </div>
      <div class="col-sm-2 col-md-4">
        <div class="feature">Feature</div>
      </div>
      </div>
    </div>
  </div>
</section> 
<section id="pricing">
  <div class="container">

    <!-- row 7 -->
    <div class="row">
      <div class="col-sm-12">
        <h3 class="text-center price-headline">Price table</h3>
      </div>
    </div>

    <!-- row 8 -->
    <div class="row">
      <div class="col-sm-10 col-sm-offset-1">
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th class="success">
                <h4 class="text-center white-text">Free plan</h4>
              </th>
              <th class="info">
                <h4 class="text-center white-text">Standard plan</h4>
              </th>
			     <th class="danger">
                <h4 class="text-center white-text">Premium plan</h4>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="success">
                <h3 class="text-center white-text">$ 0</h3>
              </td>
              <td class="info">
                <h3 class="text-center white-text">$ 99</h3>
              </td>
              <td class="danger">
                <h3 class="text-center white-text">$ 999</h3>
              </td>
            </tr>
            <tr>
              <td>Lorem ipsum</td>
              <td>Lorem ipsum</td>
              <td>Lorem ipsum</td>
            </tr>
            <tr>
              <td>Lorem ipsum</td>
              <td>Lorem ipsum</td>
              <td>Lorem ipsum</td>
            </tr>
            <tr>
              <td>Dolor sit amet</td>
			  <td>Lorem ipsum</td>
              <td>Lorem ipsum</td>
            </tr>
            <tr>
              <td>-</td>
              <td>Dolor sit amet</td>
              <td>Lorem ipsum</td>
            </tr>
            <tr>
              <td>-</td>
              <td>-</td>
              <td>Lorem ipsum</td>
            </tr>
            <tr>
              <td><a href="#" class="btn btn-success btn-block">Purchase</a></td>
              <td><a href="#" class="btn btn-info btn-block">Purchase</a></td>
              <td><a href="#" class="btn btn-danger btn-block">Purchase</a></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</section>
<section id="newsletter" class="text-center">
  <h4>Stay connected with us. Join the newsletter to receive fresh info.</h4>
  <form class="form-inline" method="POST">
    <div class="form-group">
      <input class="form-control" placeholder="You name">
    </div>
    <div class="form-group">
      <input class="form-control" placeholder="Your email">
    </div>
    <button type="submit" class="btn btn-primary">Join now!</button>
  </form>
</section>
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

