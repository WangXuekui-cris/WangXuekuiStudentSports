<%--
  Created by IntelliJ IDEA.
  User: 王学奎
  Date: 2020/2/22
  Time: 18:26
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
    <title>修改用户</title>
    <link rel="stylesheet" href="css/page.css" />
    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="js/index.js" ></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<form class="form-horizontal" role="form"  method="post" action="admin/modifyUser">
    <div class="form-group">
        <label class="col-sm-2 control-label">用户ID</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="id" readonly="readonly" value="${user.id}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">用户账号</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="account" readonly="readonly" value="${user.account}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">用户密码</label>
        <div class="col-sm-5">
            <input type="password" class="form-control" name="password" value="${user.password}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">用户姓名</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="name" value="${user.name}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">用户年龄</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="age" value="${user.age}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">用户性别</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="gender" value="${user.gender}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">学院：</label>
        <div class="col-sm-5">
            <%--因为user类的academy属性为一对象--%>
            <select class="form-control" name="academy.academyId">
                <c:forEach items="${academyList}" var="item">
                    <option value="${item.academyId}" <c:if test="${item.academyId == user.academy.academyId}">selected</c:if>>
                            ${item.academyName}
                    </option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <input type="submit" class="btn btn-primary" value="保存"/>
        </div>
    </div>
</form>
</body>
</html>
