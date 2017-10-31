<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>企业日常事务管理系统-消息列表</title>
<link href="css.css" type="text/css" rel="stylesheet" media="all" />
<link href="css/channel.css" type="text/css" rel="stylesheet" media="all" />
<script src="menu.js" type="text/javascript"></script>
<style type="text/css">
<!--
.STYLE2 {	color: #CCCCCC;
	font-size: 14px;
}
-->
</style>
</head>

<body>
<div id="topexplain">企业日常事务管理系统，为企业内部通信提供最简便的服务！</div>
<div id="topmenu"><img src="images/banner.jpg" width="970" height="147" /></div>
<div id="bookmunu">
<div class="jsmenu" id="jsmenu">
<ul>
  <li class="normal"><a href="index.jsp" urn="#jsmenu1" rel="conmenu">首页</a></li>
  <li class="active"><a urn="#default_Info" rel="conmenu" href="GetMessageList">消息列表</a></li>
  <li class="normal"><a urn="jsmenu2" rel="conmenu" href="publishNewMsg.jsp">发布新消息</a></li>
  <li class="normal"><a urn="jsmenu3" rel="conmenu" href="statusRecognise.jsp">身份识别</a></li>
    <c:if test="${employee.lead}">
  <li class="normal"><a urn="jsmenu4" rel="conmenu" href="stuffManage.jsp">员工管理</a></li>
  </c:if>
  </ul>
</div>
<div id="conmenu"></div>
<div id="place">当前位置：[<a href="index.jsp">首页</a>] - [员工管理]</div>
<div id="channelcont">
<div id="channelleft">
<div class="channelinleft">
<div class="channeltit"></div>
<div id = "employeeList">
	<c:choose>
		<c:when test="${empty sessionScope.employee }">
			没有进行身份证，请先进行身份验证！
		</c:when>
		<c:when test="${!sessionScope.employee.lead }">
			你不是领导层，无管理权限
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
				    <th>工号</th>
				    <th>姓名</th>
				    <th>性别</th>
				    <th>生日</th>
				    <th>电话</th>
				    <th>地址</th>
				    <th>入职时间</th>
				    <th>是否领导</th>
				    <th colspan="2">操作</th>
				  </tr>
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
			    	<td><a href="DeleteEmployee?employeeID=${employee.employeeID}">删除</a></td>
				    <td><a href="PreUpdateEmployee?employeeID=${employee.employeeID}">更新</a></td>
				  </tr>
				</c:forEach>
			</table>
		</c:otherwise>	
	</c:choose>	
	<div>
		<input type="button" onclick='location.href=("addEmployee.jsp")' value="添加员工" ></input>
	</div>
</div>


<div>
  <div align="center">
	<c:choose>
		<c:when test="${page.hasPrePage}">
			<a href="GetEmployee?currentPage=1">首页</a> | 
			<a href="GetEmployee?currentPage=${page.currentPage -1 }">上一页</a>
		</c:when>
		<c:otherwise>
			首页 | 上一页
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${page.hasNextPage}">
			<a href="GetEmployee?currentPage=${page.currentPage + 1 }">下一页</a> | 
			<a href="GetEmployee?currentPage=${page.totalPage }">尾页</a>
		</c:when>
		<c:otherwise>
			下一页 | 尾页
		</c:otherwise>
	</c:choose>
	当前为第${page.currentPage}页,共${page.totalPage}页
  </div>
</div>

</div>
</div>
<div class="copyright"><ul><li></li>
<li>企业日常事务管理系统 &nbsp;&copy;2009-2010</li>
</ul>
</div>
<div class="end"></div>
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


