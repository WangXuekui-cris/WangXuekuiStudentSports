<%--
  Created by IntelliJ IDEA.
  User: 王学奎
  Date: 2020/2/13
  Time: 19:07
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
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%--	判断赛事状态	--%>
    <script type="text/javascript">
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
        //报名
        function sign(gameID) {
            $.ajax({
                url:"userMenu/sign?gameID="+gameID,
                type:"post",
                dataType:"text",
                success:function (responseContent) {
                    if("已报名" == responseContent){
                        alert("不可重复报名");
                    }else if("不能报名" == responseContent){
                        alert("当前阶段不能报名");
                    }else {
                        alert("报名成功");
                    }
                }
            });
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
                <th>剩余人数</th>
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
                    <td>${games.ptcpNum}</td>
                    <td>${games.spNum}</td>
                    <td >
                        <div  id="${status.index + 1}">
                            <script type="text/javascript">
                                state("${status.index + 1}","${games.startTime}","${games.endTime}");
                            </script>
                        </div>
                    </td>
                    <td>
                        <button type="button" class="btn btn-default" onclick="sign(${games.gameID})">报名</button>
                        <button type="button" class="btn btn-default">查看</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
</body>
</html>
