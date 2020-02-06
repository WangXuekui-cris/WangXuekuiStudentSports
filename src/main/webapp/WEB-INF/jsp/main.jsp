<%--
  Created by IntelliJ IDEA.
  User: 王学奎
  Date: 2020/2/3
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>

	<head>
		<meta charset="utf-8" />
		<title>首页</title>
		<link rel="stylesheet" href="css/page.css" />
		<script type="text/javascript" src="js/jquery.min.js" ></script>
		<script type="text/javascript" src="js/index.js" ></script>
	</head>

	<body>
		<div class="left">
			<div class="bigTitle">大学生运动会管理系统</div>
			<div class="lines">
				<div onclick="pageClick(this)" class="active"><img src="img/icon-1.png" />赛事信息</div>
				<div onclick="pageClick(this)"><img src="img/icon-2.png" />代理商品管理</div>
				<div onclick="pageClick(this)"><img src="img/icon-3.png" />个人信息</div>
				<div onclick="pageClick(this)"><img src="img/icon-4.png" />赛事成绩</div>
				<div onclick="pageClick(this)"><img src="img/icon-5.png" />用户管理</div>
			</div>
		</div>
		<div class="top">
			<div class="leftTiyle" id="flTitle">业务人员管理</div>
			<div class="thisUser">当前用户：小UU</div>
		</div>
		<div class="content">HELLO WORD</div>
	</body>

</html>