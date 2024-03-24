
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.dormitorySystem.po.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script src="/layui_exts/excel.js"></script>

    <style>
        .o_div{
            background: url("/images/01.jpg") no-repeat;
        }
        .o_span{
            display: block;
            text-align: center;
            font-size: 20px;
            letter-spacing:8px
        }
    </style>
</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="">校园宿舍管理系统</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">${sessionScope.ad.s_username}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a onclick="x_admin_show('切换帐号','loginOut')">切换帐号</a></dd>
                <dd><a href="javascript:void(0);" onclick="logout()">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="/loginOut">前台首页</a></li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">

            <li>
                <a _href="/findDormRepair?d_id=${sessionScope.ad.s_dormitoryid}">
                    <%--点击在右侧出现动态的Tab--%>
                    <i class="iconfont">&#xe6a7;</i>
                    <cite>维修登记</cite>
                </a>
            </li >
            <li>
                <a _href="/findExchangeInfo?s_studentid=${sessionScope.ad.s_studentid}">
                    <%--点击在右侧出现动态的Tab--%>
                    <i class="iconfont">&#xe6a7;</i>
                    <cite>调换申请</cite>
                </a>
            </li >
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#59042;</i>
                    <cite>卫生管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>

                <ul class="sub-menu">
                    <li>
                        <a _href="/findDormClean?d_id=${sessionScope.ad.s_dormitoryid}">
                            <%--点击在右侧出现动态的Tab--%>
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>宿舍卫生</cite>
                        </a>
                    </li >
                </ul>

                <ul class="sub-menu">
                    <li>
                        <a _href="/findStudentClean?s_studentid=${sessionScope.ad.s_studentid}">
                            <%--点击在右侧出现动态的Tab--%>
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>学生卫生</cite>
                        </a>
                    </li >
                </ul>
            </li>



        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-tab-content" >
            <div class="layui-tab-item layui-show o_div" >
                <span class="o_span">${sessionScope.ad.s_username}同学，欢迎来到宿舍管理系统！</span>
                <div class="layui-col-md6" style="padding: 30px;left: 60px;background-color: #F2F2F2;">
                <div class="layui-card">
                <div class="layui-card-header">个人信息
                        </div>
                        <div class="layui-card-body">
                            <%--<div class="layui-form-label" style="text-align: left">你好</div>--%>
                           用户名：${sessionScope.ad.s_username}
                        </div>
                        <div class="layui-card-body">
                            宿舍：${sessionScope.ad.s_dormitoryid}
                        </div>
                        <div class="layui-card-body">
                            姓名：${sessionScope.ad.s_name}
                        </div>
                        <div class="layui-card-body">
                            学号：${sessionScope.ad.s_studentid}
                        </div>
                        <div class="layui-card-body">
                            电话：${sessionScope.ad.s_phone}
                        </div>
                </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright"></div>
</div>
<!-- 底部结束 -->

<script>

    function logout() {
        // 删除名为 "adInfo" 的 Cookie
        deleteCookie("adInfo");

        // 执行退出操作，例如跳转到登录页面
        window.location.href = "/loginOut";
    }

    // 删除 Cookie 的函数
    function deleteCookie(name) {
        document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
    }
    // 定义设置Cookie的函数
    function setCookie(cname, cvalue, exdays) {
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        var expires = "expires="+d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    }

    // 页面加载完成后调用设置Cookie的方法
    window.onload = function() {
        // 假设您有一个名为 adInfo 的变量包含用户信息
        // 获取sessionScope.ad中的用户信息
        <%
            Student student = (Student) session.getAttribute("ad");
            ObjectMapper mapper = new ObjectMapper();
            String adInfoJson = mapper.writeValueAsString(student);
        %>
        var adInfo = <%= adInfoJson %>;
        // 将 adInfo 存储到 Cookie 中
        setCookie("adInfo", JSON.stringify(adInfo), 10);
    };

    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });

</script>
</body>
</html>
