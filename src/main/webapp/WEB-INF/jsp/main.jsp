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
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>

	<body>
		<div class="left">
			<div class="bigTitle">大学生运动会管理系统</div>
			<div class="lines">
				<c:if test="${user.userState == 2}">
				<div onclick="pageClick(this,'user/gameInfo')" class="active"><img src="img/icon-1.png" />
					赛事信息
				</div>
				<div onclick="pageClick(this,'userMenu/userInfo')"><img src="img/icon-3.png" />
					个人信息
				</div>
				<div onclick="pageClick(this,'userMenu/gameResult')"><img src="img/icon-4.png" />
					赛事成绩
				</div>
				<div onclick="pageClick(this,'user/resultPrint')"><img src="img/icon-5.png" />
					成绩打印
				</div>
				</c:if>
				<c:if test="${user.userState == 1}">
					<div onclick="pageClick(this,'admin/gameInfo')" class="active"><img src="img/icon-1.png" />
						赛事信息
					</div>
					<div onclick="pageClick(this,'admin/entryResult')"><img src="img/icon-5.png" />
						录入成绩
					</div>
                    <div onclick="pageClick(this,'admin/userManage')"><img src="img/icon-3.png" />
                        用户管理
                    </div>
				</c:if>
			</div>
		</div>
		<div class="top">
			<div class="leftTiyle" id="flTitle">欢迎登陆</div>
			<div class="thisUser">
				当前用户：${user.name}&nbsp;&nbsp;
				<a href="user/logout" target="_parent">退出</a>
			</div>
		</div>
		<div class="content">
			<iframe name="content" id="content" src="hello.html" width="100%" height="88%" frameborder="0">
			</iframe>
		</div>

	</body>

</html>