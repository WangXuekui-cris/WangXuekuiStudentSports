<%--
  Created by IntelliJ IDEA.
  User: 王学奎
  Date: 2020/2/2
  Time: 14:24
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
    <title>登录</title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".regBut").click(function () {
                location.href="user/show_reg";
            })
        })
    </script>
    <script>
        //判断账号非空并校验账号格式
        function checkAccount() {
            //学号格式为至少9位的纯数字
            var reg = /^\d{9,}$/;
            var username = $("#userAccount_id").val();
            if (username == null || username == "") {
                alert("账户不能为空！");
                return false;
            } else if (!reg.test(username)) {
                alert("请输入符合格式的账号！")
                return false;
            }else{
                return true;
            }
        }
        //判断密码非空
        function  checkPWD() {
            var password = $("#password_id").val();
            if(password == null || password == ""){
                alert("密码不能为空");
                return false;
            }else{
                return true;
            }
        }
    </script>
    <script type="text/javascript">
        //检查表单
        function checkForm() {
            if(checkAccount()&&checkPWD()){
                return true;
            }else {
                return false;
            }
        }
    </script>

</head>

<body>
<div class="top">运功会&nbsp;·&nbsp;用实力说明一切</div>
<div class="content">
    <div class="login">
        <div class="title">登录</div>
        <form action="user/login" method="post" onsubmit="return checkForm();">
            <div class="line">
                <img class="smallImg" src="img/icon1.png" />
                <input placeholder="请输入账号" value="${user.account}" type="text" name="userAccount" onchange="checkAccount()" id="userAccount_id" />
            </div>
            <div class="line">
                <img class="smallImg" src="img/icon2.png" />
                <input placeholder="请输入密码" type="password" name="password" onchange="checkPWD()" id="password_id" />
            </div>
            <div>
            <span style="color: red">${msg}</span>
            </div>
            <input type="submit" class="userBut" value="用户登录"/>
        </form>
            <button type="button" class="regBut">注册</button>
    </div>
</div>
</body>

</html>

