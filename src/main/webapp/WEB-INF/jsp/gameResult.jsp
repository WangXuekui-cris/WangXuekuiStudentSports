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
    <title>赛事成绩</title>
    <link rel="stylesheet" href="css/page.css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div style="text-align: center; font-size: 30pt; margin-top: 50px;">
        <table class="table table-bordered" align="center">
            <thead>
            <tr>
                <th>学生账号</th>
                <th>学生姓名</th>
                <th>赛事名称</th>
                <th>赛事成绩</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${scores}" var="score">
                <tr>
                    <td>${user.account}</td>
                    <td>${user.name}</td>
                    <td>${score.game.gameName}</td>
                    <td>${score.score}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
