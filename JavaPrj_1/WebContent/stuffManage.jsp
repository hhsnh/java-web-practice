<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE >
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>企业日常事务管理系统-消息列表</title>

	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/base.css" rel="stylesheet">
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js">
</script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js">
</script>
    <![endif]-->
</head>

<body>
	<div class="container">
	<h3>企业日常事务管理系统，为企业内部通信提供最简便的服务！</h3>
	<div ><img class="img-rounded img-thumbnail" src="images/banner.jpg" /></div>
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
		<li class="active">员工管理</li>
	</ol>
	<c:choose>
		<c:when test="${empty sessionScope.employee }">
			没有进行身份证，请先进行身份验证！
		</c:when>
		<c:when test="${!sessionScope.employee.lead }">
			你不是领导层，无管理权限
		</c:when>
		<c:otherwise>
		<div class="row">
			<div class="center-block">
			<table class="table table-hover  table-striped">
				<caption>员工列表</caption>
				<thead >
					<tr class="info">
					    <th class="text-center">工号</th>
					    <th>姓名</th>
					    <th>性别</th>
					    <th>生日</th>
					    <th>电话</th>
					    <th>地址</th>
					    <th>入职时间</th>
					    <th>是否领导</th>
					    <th colspan="2">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.employeeList}" var="employee">
					  <tr>
						<td>${employee.employeeID}</td>
					    <td>${employee.employeeName}</td>
					    <td>${employee.employeeSex ? "男" : "女"}</td>
					    <td>${employee.employeeBirth }</td>
					    <td>${employee.employeePhone }</td>
					    <td>${employee.employeePlace }</td>
					    <td>${employee.joinTime }</td>
					    <td>${employee.lead ? '是' : '否'}</td>
				    	<td><a onclick = deleteConfirm("${employee.employeeID}")>删除</a></td>
					    <td><a onclick='location.href=("PreUpdateEmployee?employeeID=${employee.employeeID}")'>更新</a></td>
					  </tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			</div>
		</c:otherwise>	
	</c:choose>	
	<div class="center-block">
	<button type="button" onclick='location.href=("addEmployee.jsp")' class="btn btn-primary">添加员工</button>
	</div>
	<div class="center-block">
	  <ul class="pagination">
	  	<li><a href="GetEmployee?currentPage=1">首页</a></li> 
	  	<c:choose>
			<c:when test="${page.hasPrePage}">
				<li><a href="GetEmployee?currentPage=${page.currentPage -1 }">上一页</a></li>
			</c:when>
			<c:otherwise>
				<li class="previous disabled"><a href="#">上一页</a></li>
			</c:otherwise>
		</c:choose>
			<li><a href="GetEmployee?currentPage=${page.currentPage}">${page.currentPage}</a></li>
		<c:choose>
			<c:when test="${page.hasNextPage}">
				<a href="GetEmployee?currentPage=${page.currentPage + 1 }">下一页</a> | 
			</c:when>
			<c:otherwise>
				<li class="next disabled"><a href="#">下一页</a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="GetEmployee?currentPage=${page.totalPage }">尾页</a></li>
	  </ul>
	  </div>
	
	<div class="copyright"><ul><li></li>
	<li>企业日常事务管理系统 &nbsp;&copy;2009-2010</li>
	</ul>
	</div>
	<div class="end"></div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
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
	function deleteConfirm(employeeID){
		debugger;
		var con;
		con = confirm("你确定要删除工号为："+employeeID+" 的员工吗？");
		if(con==true) window.location.href="DeleteEmployee?employeeID="+employeeID;
		else return;
	}
	</script>
</body>
</html>


