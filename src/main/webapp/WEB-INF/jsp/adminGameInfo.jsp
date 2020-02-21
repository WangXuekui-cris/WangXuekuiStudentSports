<%--
  Created by IntelliJ IDEA.
  User: 王学奎
  Date: 2020/2/20
  Time: 13:37
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
    <title>赛事信息</title>
    <link rel="stylesheet" href="css/page.css" />
    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="js/index.js" ></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript">
    // 判断赛事状态
        function state(id,startTime,endTime) {
            var currentDate = new Date().valueOf();
            var start = new Date(startTime).valueOf();
            var end = new Date(endTime).valueOf();
            if(end > currentDate && currentDate > start){
                $("#" +id).text("进行中");
            }else if(currentDate > end){
                $("#" +id).text("已结束");
            }else{
                $("#" +id).text("未进行");
            }
        }
    // 提交到修改界面
        function modify(gameID,startTime) {
            var currentDate = new Date().valueOf();
            var start = new Date(startTime).valueOf();
            if(currentDate > start){
                alert("赛事进行中或已结束，禁止修改！")
            }else{
                location.href = "admin/updateGame?gameID="+gameID;
            }
        }
    //  删除指定赛事
        function del() {
            if(confirm("确定要删除吗？")) {
                return true;
            }else {
                return false;
            }
        }

        function remove(gameID,startTime,sinNum) {
            //获取当前时间
            var currentDate = new Date().valueOf();
            var start = new Date(startTime).valueOf();
            //判断赛事状态
            if(currentDate >= start){
                alert("当前赛事状态不允许删除！");
            }else if(sinNum > 0){
                alert("比赛已有学生报名，无法删除！");
            }else{
                if(del()) {
                    location.href = "admin/delete?gameID=" + gameID;
                }
            }

        }
    </script>
</head>
<body>
<table class="table table-bordered" align="center">
    <thead>
    <tr>
        <th>赛事名称</th>
        <th>开始时间</th>
        <th>结束时间</th>
        <th>预计人数</th>
        <th>报名人数</th>
        <th>赛事状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${gameList}" var="games" varStatus="status">
        <tr>
            <td style="display: none">${games.gameID}</td>
            <td>${games.gameName}</td>
            <td>${games.startTime}</td>
            <td>${games.endTime}</td>
            <td>${games.totalNum}</td>
            <td>${games.signNum}</td>
            <td >
                <div  id="${status.index + 1}">
                    <script type="text/javascript">
                        state("${status.index + 1}","${games.startTime}","${games.endTime}");
                    </script>
                </div>
            </td>
            <td>
                <button type="button" class="btn btn-default" onclick="modify('${games.gameID}','${games.startTime}')">修改</button>
                <button type="button" class="btn btn-default" onclick="remove('${games.gameID}','${games.startTime}','${games.signNum}')">删除</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
