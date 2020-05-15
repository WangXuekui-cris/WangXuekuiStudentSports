<%--
  Created by IntelliJ IDEA.
  User: 王学奎
  Date: 2020/2/13
  Time: 20:16
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
    <title>个人信息</title>
    <link rel="stylesheet" href="css/page.css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        //取消报名
        function cancel(gameID) {
            $.ajax({
                url:"userMenu/cancel?gameID="+gameID,
                type:"post",
                dataType:"text",
                success:function (responseContent) {
                    if("false" == responseContent){
                        alert("当前阶段不能取消报名");
                    }else {
                        alert("取消报名成功");
                        location.reload();
                    }
                }
            });
        }
    </script>
</head>
<body>
    <div style="text-align: center; font-size: 20pt; margin-top: 10px;">
        姓名：${user.name}
        年龄：${user.age}
        性别：${user.gender}
    </div>
    <c:choose>
        <c:when test="${not empty msg}">
            <div style="text-align: center; font-size: 20pt;">
                ${msg}
            </div>
        </c:when>
        <c:otherwise>
            <table class="table table-bordered" align="center">
                <thead>
                <tr>
                    <th>赛事名称</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${regInfoList}" var="reg">
                    <tr>
                        <td style="display: none">${reg.gameID}</td>
                        <td>${reg.gameName}</td>
                        <td>${reg.startTime}</td>
                        <td>${reg.endTime}</td>
                        <td>
                            <button type="button" class="btn btn-default" onclick="cancel(${reg.gameID})">取消</button>
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
                    <li><a href="user/userInfo?pageNum=1">首页</a>
                    <li><a href="user/userInfo?pageNum=${pageInfo.prePage}">上一页</a>
                        </c:when>
                        <c:otherwise>
                    <li class="active"><span>首页</span>
                    <li class="disabled"><span>上一页</span>
                        </c:otherwise>
                        </c:choose>
                        <c:forEach var = "index" begin="1" end="${pageInfo.pages}">
                    <li class="active"
                        <c:if test="${index==pageInfo.pageNum}"></c:if>>
                        <a href="user/userInfo?pageNum=${index}">${index}</a>

                        </c:forEach>
                        <c:choose>
                        <c:when test="${pageInfo.hasNextPage}">
                    <li><a href="user/userInfo?pageNum=${pageInfo.nextPage}">下一页</a>
                    <li><a href="user/userInfo?pageNum=${pageInfo.pages}">尾页</a>
                        </c:when>
                        <c:otherwise>
                    <li class="disabled"><span>下一页</span>
                    <li class="active"><span>尾页</span>
                        </c:otherwise>
                        </c:choose>
                </ul>
            </div>
        </c:otherwise>
    </c:choose>

</body>
</html>
