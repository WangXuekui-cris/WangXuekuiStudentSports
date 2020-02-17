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
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${regInfoList}" var="reg">
                    <tr>
                        <td>${reg.gameName}</td>
                        <td>${reg.startTime}</td>
                        <td>${reg.endTime}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>

</body>
</html>
