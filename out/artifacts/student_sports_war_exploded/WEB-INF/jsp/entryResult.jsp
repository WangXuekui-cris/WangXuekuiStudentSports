<%--
  Created by IntelliJ IDEA.
  User: 王学奎
  Date: 2020/2/20
  Time: 12:54
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
    <title>录入成绩</title>
    <link rel="stylesheet" href="css/page.css" />
    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="js/index.js" ></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<form class="form-horizontal" role="form"  method="post" action="admin/entry">
    <div class="form-group">
        <label class="col-sm-2 control-label">学生账号</label>
        <div class="col-sm-10" style="width: 30%">
            <input type="text" class="form-control" name="sAccount" value="学生账号">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">赛事名称：</label>
        <div class="col-sm-10" style="width: 30%">
            <select class="form-control" name="gID">
                <c:forEach items="${gameList}" var="game">
                    <option selected="selected" value="${game.gameID}">${game.gameName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">赛事成绩</label>
        <div class="col-sm-10" style="width: 30%">
            <input type="text" class="form-control" name="score" value="赛事成绩">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <input type="submit" class="btn btn-primary" value="录入"/>
            <span style="color: red">${msg}</span>
            <span style="color: green">${sMsg}</span>
        </div>
    </div>
</form>
</body>
</html>
