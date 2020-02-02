<%--
  Created by IntelliJ IDEA.
  User: 王学奎
  Date: 2020/2/2
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录界面</title>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <link rel="stylesheet" type="text/css" href="images/style.css" />

</head>

<body>

<div id="content" class="outFrame">

    <div class="bj_3">
        <div class="login_box">
            <form id="form-login" method="post" onSubmit="return check();" action="">
                <div class="input1">
                    <input type="text" id="loginName" name="loginName" class="inputer" value=""/>
                </div>
                <div class="input2">
                    <input type="password" id="password" name="password" class="inputer" value=""/>
                </div>
                <div class="go"><input type="image" name="image"  src="images/go.png" value="" alt="单击此处登录"/></div>

                <div class="clear"></div>
            </form>
        </div>
    </div>

</div>

</body>
</html>

