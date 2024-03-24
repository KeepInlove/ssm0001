<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/usersLogin.css">
    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <script src="/js/jquery-1.3.2.min.js"></script>
    <script src="js/login.js"></script>

    <title>前台首页</title>
</head>
<body>

<div class="header">

</div>

<div class="body">
    <h1 style="text-align: center">校园宿舍管理系统</h1>
    <div class="panel">
        <div class="top">
            <p>账户登陆</p>
        </div>

        <div class="middle">
            <form action="/login" method="post">
                <span class="erro">${msg}</span>
                <span class="s1"></span>
                <span class="s2"></span>
                <input type="text" name="a_username" value=""  class="iputs"/>
                <input type="password" name="a_password" value="" class="iputs"/>
                <div class="layui-form-item">
                    <label>
                        <input type="radio" name="role" value="admin" class="iputs"/>
                        宿管
                    </label>
                    <label>
                        <input type="radio" name="role" value="user" class="iputs"/>
                        学生
                    </label>
                </div>
                <input type="submit" value="登陆"/>
            </form>
        </div>
    </div>
</div>

<div class="footer">
    <span> </span>
</div>
</body>
</html>
