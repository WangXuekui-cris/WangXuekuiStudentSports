<%--
  Created by IntelliJ IDEA.
  User: 王学奎
  Date: 2020/2/2
  Time: 22:42
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
    <title>注册</title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="top">运功会&nbsp;·&nbsp;用实力说明一切</div>
        <div class="register">
            <div class="title">注册</div>
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="userAccount" class="col-sm-2 control-label">学号：</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="userAccount" placeholder="请输入学号">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码：</label>
                    <div class="col-sm-7">
                        <input type="password" class="form-control" id="password" placeholder="请输入6-10位的密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="con_password" class="col-sm-10 control-label">确认密码：</label>
                    <div class="col-sm-7">
                        <input type="password" class="form-control" id="con_password" placeholder="确认密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="userName" class="col-sm-2 control-label">姓名：</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="userName" placeholder="请输入姓名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="userAge" class="col-sm-2 control-label">年龄：</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="userAge" placeholder="请输入15-120之间的年龄">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">性别：</label>
                    <div class="radio">
                        <label>
                            <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked> 男
                        </label>
                        <label>
                            <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">女
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label>学院</label>
                    <div class="col-sm-5">
                        <select class="form-control">
                            <option>信控学院</option>
                            <option>外国语学院</option>
                            <option>机械学院</option>
                            <option>通信学院</option>
                            <option>自动化学院</option>
                        </select>
                    </div>
                </div>
            </form>
            <button type="button" class="userBut">确认</button>
        </div>
</body>
</html>
