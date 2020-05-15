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
                        location.reload();
                    }
                }
            });
        }

        //查看规则
        function rule(gameID) {
            var url = "userMenu/rule?gameID="+gameID;
            window.open(url,'height=400, width=400, top=100, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
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
                        <button type="button" class="btn btn-default" onclick="sign(${games.gameID})">报名</button>
                        <button type="button" class="btn btn-default" onclick="rule(${games.gameID})">查看</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%--   分页     --%>
        <div class="page" style="text-align: center">
            <ul class="pagination">
                <c:choose>
                <c:when test="${pageInfo.hasPreviousPage}">
                <li><a href="user/gameInfo?pageNum=1">首页</a>
                <li><a href="user/gameInfo?pageNum=${pageInfo.prePage}">上一页</a>
                    </c:when>
                    <c:otherwise>
                <li class="active"><span>首页</span>
                <li class="disabled"><span>上一页</span>
                    </c:otherwise>
                    </c:choose>
                    <c:forEach var = "index" begin="1" end="${pageInfo.pages}">
                <li class="active"
                    <c:if test="${index==pageInfo.pageNum}"></c:if>>
                    <a href="user/gameInfo?pageNum=${index}">${index}</a>

                    </c:forEach>
                    <c:choose>
                    <c:when test="${pageInfo.hasNextPage}">
                <li><a href="user/gameInfo?pageNum=${pageInfo.nextPage}">下一页</a>
                <li><a href="user/gameInfo?pageNum=${pageInfo.pages}">尾页</a>
                    </c:when>
                    <c:otherwise>
                <li class="disabled"><span>下一页</span>
                <li class="active"><span>尾页</span>
                    </c:otherwise>
                    </c:choose>
            </ul>
        </div>
</body>
</html>
