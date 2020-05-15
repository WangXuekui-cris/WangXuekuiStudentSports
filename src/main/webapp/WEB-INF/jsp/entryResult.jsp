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
    <script type="text/javascript">
        function checkAccount() {
            //学号格式为至少9位的纯数字
            var reg = /^\d{9,}$/;
            var sAccount = $("#sAccount").val();
            if(sAccount == null || sAccount == ""){
                alert("学生账号不能为空！");
                return false;
            }else if(!reg.test(sAccount)){
                alert("学生账号不符合要求！");
                return false;
            }else{
                return true;
            }
        }

        //检查该账号在该赛事中是否有报名
        function checkAccountByGid() {
            var account = $("#sAccount").val();
            var gID = $("#gID").val();
            $.ajax({
                url:"admin/check",
                data: {"account":account,"gID":gID},
                dataType: "text",
                success: function (responseContent) {
                    if(responseContent == 0){
                        $("#msg").html("该学生并未参加此项比赛！");
                        return false;
                    }else {
                        return true;
                    }
                }
            });

        }
        //检查表单
        function checkForm() {
            if(checkAccount()&&checkAccountByGid()){
                return true;
            }else {
                return false;
            }
        }
    </script>
</head>
<body>
<form class="form-horizontal" role="form" onsubmit="checkForm()"  method="post" action="admin/entry">
    <div class="form-group">
        <label class="col-sm-2 control-label">学生账号</label>
        <div class="col-sm-10" style="width: 30%">
            <input type="text" class="form-control" name="sAccount" id="sAccount" onblur="checkAccount()" placeholder="学生账号">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">赛事名称：</label>
        <div class="col-sm-10" style="width: 30%">
            <select class="form-control" name="gID" id="gID">
                <c:forEach items="${gameList}" var="game">
                    <option selected="selected" value="${game.gameID}">${game.gameName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">赛事成绩</label>
        <div class="col-sm-10" style="width: 30%">
            <input type="text" class="form-control" name="score" onfocus="checkAccountByGid()" placeholder="赛事成绩">
            <span id="msg" style="color: red"></span>
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
