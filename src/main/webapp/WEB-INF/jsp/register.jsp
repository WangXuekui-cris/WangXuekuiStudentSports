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
    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
            //判断用户是否存在
            function isExists() {
                //学号格式为至少9位的纯数字
                var reg = /^\d{9,}$/;
                //获取用户输入的账号
                var account = $("#userAccount").val();
                if(account == null || account == ""){
                    alert("学号不能为空");
                    //重新获取焦点并将text中border设置为红色
                    window.setTimeout (function(){
                        $("#userAccount").select().css("border-color","red");
                        });
                }else if(!reg.test(account)){//不符合格式提示弹窗
                    alert("请输入正确的学号");
                    window.setTimeout (function(){
                        $("#userAccount").select().css("border-color","red");
                    });
                }else {
                    $.ajax({
                        url: "user/check",//请求路径
                        type: "post", //请求方式
                        data: "account=" + account, //传给后台的值
                        dataType: "text", //返回类型
                        success: function (responseContent) {
                            //如果返回值为"true" 提示信息；反之不提示；
                            if (responseContent == "true") {
                                $("#account_msg").text("该账户已存在");
                                window.setTimeout (function(){
                                    $("#userAccount").select().css("border-color","red");
                                });
                            } else {
                                $("#account_msg").text("");
                                $("#userAccount").css("border-color","green");
                            }
                        }
                    });
                }
            }

            //校验密码的长度
            function checkPwdLength(){
                //获取用户输入的密码
                var password = $("#password").val();
                var length = password.length;
                if(length >= 6 && length <= 10){
                    $("#password_msg").text("");
                    $("#password").css("border-color","green");
                    return true;
                }else{
                    $("#password_msg").text("密码长度应该在6-10位");
                    $("#password").css("border-color","red");
                    return false;

                }
            }
            //校验两次密码是否一致
            function confirmPwd() {
                var password = $("#password").val();
                var conPassword = $("#con_password").val();
                if(conPassword != password){
                    $("#conPwd_msg").text("两次密码不一致");
                    $("#con_password").css("border-color","red");
                    return false;
                }else{
                    $("#conPwd_msg").text("");
                    $("#con_password").css("border-color","green");
                    return true;
                }
            }
            //校验姓名格式：要么全中文要么英文含有英文空格和英文点
            function checkName() {
                //姓名格式:中英文不能同时出现，英文可以包含英文的点，长度在20个以内
                var reg = /^([\u4e00-\u9fa5]{1,20}|[a-zA-Z\.\s]{1,20})$/;
                //获取用户输入的姓名
                var name = $("#userName").val();
                if(!reg.test(name)){
                    alert("请输入正确的姓名！不能含有特殊符号！");
                    $("#userName").css("border-color","red");
                    return false;
                }else{
                    $("#userName").css("border-color","green");
                    return true;
                }

            }
            //校验年龄是否满足在15-120之间
            function checkAge() {
                //年龄必须为纯数字
                var reg = /^[0-9]*$/;
                //获取用户输入的年龄
                var userAge = $("#userAge").val();
                if(!reg.test(userAge)){
                    alert("年龄必须为纯数字");
                }else if(userAge <= 15 || userAge >= 120){
                    $("#age_msg").text("年龄应该在15-120之间");
                    $("#userAge").css("border-color","false");
                    return false;
                }else{
                    $("#age_msg").text("");
                    $("#userAge").css("border-color","green");
                    return true;
                }
            }
    </script>

    //检查表单 即如果用户不处理红色提示，点击注册之后没有反应
    <script type="text/javascript">
        function checkForm() {
            if(checkPwdLength()&&confirmPwd()&&checkName()&&checkAge()){
                return true;
            }else {
                return false;
            }
        }
    </script>
</head>
<body>
<div class="top">运功会&nbsp;·&nbsp;用实力说明一切</div>
        <div class="register">
            <div class="title">注册</div>
            <form class="form-horizontal" role="form" method="post" onsubmit="return checkForm();" action="user/reg">
                <div class="form-group">
                    <label for="userAccount" class="col-sm-2 control-label">学号：</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="userAccount" name="account" placeholder="请输入学号" onblur="isExists()">
                        <span style="color: red" id="account_msg"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码：</label>
                    <div class="col-sm-7">
                        <input type="password" class="form-control" id="password" name="password" placeholder="请输入6-10位的密码" onblur="checkPwdLength()">
                        <span style="color: red" id="password_msg"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="con_password" class="col-sm-10 control-label">确认密码：</label>
                    <div class="col-sm-7">
                        <input type="password" class="form-control" id="con_password" placeholder="确认密码" onblur="confirmPwd()">
                        <span style="color: red" id="conPwd_msg"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="userName" class="col-sm-2 control-label">姓名：</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="userName" name="name" placeholder="请输入姓名" onblur="checkName()">
                    </div>
                </div>
                <div class="form-group">
                    <label for="userAge" class="col-sm-2 control-label">年龄：</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="userAge" name="age" placeholder="请输入15-120之间的年龄" onblur="checkAge()">
                        <span style="color: red" id="age_msg"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">性别：</label>
                    <div class="radio">
                        <label>
                            <input type="radio" name="gender" id="optionsRadios1" value="男" checked> 男
                        </label>
                        <label>
                            <input type="radio" name="gender" id="optionsRadios2" value="女">女
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label>学院</label>
                    <div class="col-sm-5">
                        //因为user类的academy属性为一对象
                        <select class="form-control" name="academy.academyId">
                            <c:forEach items="${academyList}" var="item">
                                <option selected="selected" value="${item.academyId}">${item.academyName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <input type="submit" class="userBut" value="注册"/>
            </form>
        </div>
</body>
</html>
