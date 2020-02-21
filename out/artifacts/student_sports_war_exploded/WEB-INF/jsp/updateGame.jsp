<%--
  Created by IntelliJ IDEA.
  User: 王学奎
  Date: 2020/2/21
  Time: 15:01
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
    <title>修改赛事</title>
    <link rel="stylesheet" href="css/page.css" />
    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="js/index.js" ></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var reg =  /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\s+(20|21|22|23|[0-1]\d):[0-5]\d:[0-5]\d$/
        //校验开始日期的格式
        function checkStartTime() {
            //获取输入框的日期
            var startTime = $("#startTime").val();
            //获取系统日期
            var currentDate = new Date().valueOf();
            var start = new Date(startTime).valueOf();
            if(!reg.test(startTime)){
                alert("格式错误！");
                window.setTimeout (function(){
                    $("#startTime").css("border-color","red");
                });
                return false;
            }else if(start <= currentDate){
                alert("开始时间不能小于当前时间！");
                    $("#startTime").css("border-color","red");
                return false;
            }else{
                $("#startTime").css("border-color","green");
                return true;
            }
        }

        //检查结束日期
        function checkEndTime() {
            //获取输入框的日期
            var endTime = $("#endTime").val();
            var startTime = $("#startTime").val();
            var start = new Date(startTime).valueOf();
            var end = new Date(endTime).valueOf();
            if(!reg.test(endTime)){
                alert("格式错误！");
                $("#endTime").css("border-color","red");
                return false;
            }else if(end <= start){
                alert("结束时间应大于开始时间！");
                $("#endTime").css("border-color","red");
                return false;
            }else {
                $("#endTime").css("border-color","green");
                return true;
            }
        }

    </script>

    <script type="text/javascript">
        //检查表单 即如果用户不处理红色提示，点击保存之后没有反应
        function checkForm() {
            if(checkStartTime()&&checkEndTime()){
                return true;
            }else {
                return false;
            }
        }
    </script>
</head>
<body>
<div class="container" id="a">
    <form class="form-horizontal" role="form"  method="post" onsubmit="return checkForm()" action="admin/update">
        <div class="form-group">
            <label class="col-sm-2 control-label">ID</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="gameID" readonly="readonly" value="${game.gameID}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">赛事名称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="gameName" value="${game.gameName}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">赛事开始时间</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="startTime" name="startTime" onblur="checkStartTime()" value="${game.startTime}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">赛事结束时间</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="endTime" name="endTime" onblur="checkEndTime()" value="${game.endTime}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">预计报名人数</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="totalNum" value="${game.totalNum}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">已报名人数</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="signNum" readonly="readonly" value="${game.signNum}">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" class="btn btn-primary" value="保存"/>
            </div>
        </div>
    </form>
</div>

</body>
</html>
