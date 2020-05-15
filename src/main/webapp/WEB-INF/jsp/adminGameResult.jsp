<%--
  Created by IntelliJ IDEA.
  User: 王学奎
  Date: 2020/5/6
  Time: 19:36
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
<%--    <link rel="stylesheet" href="css/page.css" />--%>
    <script type="text/javascript" src="js/index.js" ></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        //  跳往录入成绩界面
        function addGameScore() {
            location.href="admin/entryResult";
        }
    <%--   动态获取成绩     --%>
        function getGameScore() {
            $.ajax({
                url: "admin/getGameScore",
                data: "gameID=" + $("#gameID").val(),
                dataType: "json",
                success:function (responseContent) {
                    var obj=eval(responseContent);
                    var tbody=$('<tbody></tbody>');
                    $(obj).each(function (index){
                        var val=obj[index];
                        var tr=$('<tr></tr>');
                        tr.append('<td>'+ val.gameName + '</td>' + '<td>'+ val.account + '</td>' +'<td>'+ val.name + '</td>' + '<td>'+ val.score + '</td>' + '<td>'+ val.scoreNo + '</td>');
                        tbody.append(tr);
                    });
                    $('#table tbody').replaceWith(tbody);
                }
            });
        }
    </script>
</head>
<body>
<div class="form-group">
    <div class="col-sm-1">
        <label>赛事名称：</label>
    </div>
        <div class="col-sm-1" style="width: 15%">
            <select  style="width: 80%;height: 4%;border-color: #b0cdff; border-radius:4px" name="gID" id="gameID" onchange="getGameScore()">
            <c:forEach items="${gameList}" var="game">
                <option selected="selected" value="${game.gameID}">${game.gameName}</option>
            </c:forEach>
        </select>
    </div>
</div>

    <table class="table table-bordered" align="center" id="table">
        <thead>
            <th>赛事名称</th>
            <th>学生学号</th>
            <th>学生姓名</th>
            <th>学生成绩</th>
            <th>学生排名</th>
        </thead>
        <tbody>
            <tr></tr>
        </tbody>
    </table>
</div>
<div style="text-align: center">
    <button type="button" class="btn btn-success" onclick="addGameScore()">录入成绩</button>
</div>
</body>
</html>
