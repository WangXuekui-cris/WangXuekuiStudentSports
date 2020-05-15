<%--
  Created by IntelliJ IDEA.
  User: 王学奎
  Date: 2020/2/20
  Time: 12:55
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
    <title>用户管理</title>
    <link rel="stylesheet" href="css/page.css" />
    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="js/index.js" ></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        <%--   跳往修改界面     --%>
        function modify(id) {
            location.href = "admin/modify?id="+id;
        }
    //删除用户
        function del() {
            if(confirm("确定要删除吗？")) {
                return true;
            }else {
                return false;
            }
        }
        function remove(account) {
            if(del()) {
                $.ajax({
                    url: "admin/removeUser",
                    data: "account=" + account,
                    dataType: "text",
                    success: function (responseContent) {
                        if(responseContent > 0){
                            alert("删除成功!");
                            location.reload();
                        }else{
                            alert("删除失败！")
                        }
                    }
                });
            }
        }
    </script>
</head>
<body>
<table class="table table-bordered" align="center">
    <thead>
    <tr>
        <th>用户账号</th>
        <th>用户姓名</th>
        <th>用户年龄</th>
        <th>用户性别</th>
        <th>用户学院</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="user" varStatus="status">
        <tr>
            <td style="display: none">${user.id}</td>
            <td>${user.account}</td>
            <td>${user.name}</td>
            <td>${user.age}</td>
            <td>${user.gender}</td>
            <td>${user.academy.academyName}</td>
            <td>
                <button type="button" class="btn btn-default" onclick="modify(${user.id})">修改</button>
                <button type="button" class="btn btn-default" onclick="remove(${user.account})">删除</button>
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
        <li><a href="admin/userManage?pageNum=1">首页</a>
        <li><a href="admin/userManage?pageNum=${pageInfo.prePage}">上一页</a>
            </c:when>
            <c:otherwise>
        <li class="active"><span>首页</span>
        <li class="disabled"><span>上一页</span>
            </c:otherwise>
            </c:choose>
            <c:forEach var = "index" begin="1" end="${pageInfo.pages}">
        <li class="active"
            <c:if test="${index==pageInfo.pageNum}"></c:if>>
            <a href="admin/userManage?pageNum=${index}">${index}</a>

            </c:forEach>
            <c:choose>
            <c:when test="${pageInfo.hasNextPage}">
        <li><a href="admin/userManage?pageNum=${pageInfo.nextPage}">下一页</a>
        <li><a href="admin/userManage?pageNum=${pageInfo.pages}">尾页</a>
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
