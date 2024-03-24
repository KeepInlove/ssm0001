<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>修改信息</title>
    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/pg_btn.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
</head>

<body>

<div class="x-body">

    <form class="layui-form" action="/updateExchangeInfo" method="post"  id="f_auto" accept-charset="UTF-8">
        <input type="hidden" value="${sessionScope.s.e_id}" name="e_id" id="e_id"/>
        <div class="layui-form-item">
            <label class="layui-form-label">学号：</label>
            <div class="layui-input-block">
                <input type="text"  name="s_id" id="s_ids"  value="${sessionScope.s.s_id}"  class="layui-input" placeholder="请输入学号">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">申请人：</label>
            <div class="layui-input-block">
                <input type="text"  name="s_name" id="edit_sname"  value="${sessionScope.s.s_name}"  class="layui-input" placeholder="请输入学号">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">交换人：</label>
            <div class="layui-input-block">
                <input type="text"  name="e_name" id="edit_ename"  value="${sessionScope.s.e_name}" class="layui-input" placeholder="请输入姓名">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">申请人楼栋：</label>
            <div class="layui-input-block">
                <input type="text"  name="d_dormbuilding" id="edit_dormbuilding"  value="${sessionScope.s.d_dormbuilding}" class="layui-input" placeholder="请输入姓名">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">申请人床位：</label>
            <div class="layui-input-block">
                <input type="text"  name="d_bed" id="edit_bed"  value="${sessionScope.s.d_bed}" class="layui-input" placeholder="请输入姓名">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">申请人宿舍：</label>
            <div class="layui-input-block">
                <input type="text"  name="s_dormitoryid" id="s_dormitoryid"  value="${sessionScope.s.s_dormitoryid}" class="layui-input" placeholder="请输入宿舍">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">交换人宿舍：</label>
            <div class="layui-input-block">
                <input type="text"  name="e_dormitoryid" id="e_dormitoryid"  value="${sessionScope.s.e_dormitoryid}" class="layui-input" placeholder="请输入宿舍">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">交换人楼栋：</label>
            <div class="layui-input-block">
                <input type="text"  name="e_dormbuilding" id="edit_edormbuilding"  value="${sessionScope.s.e_dormbuilding}" class="layui-input" placeholder="请输入姓名">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">交换人床位：</label>
            <div class="layui-input-block">
                <input type="text"  name="e_bed" id="edit_ebed"  value="${sessionScope.s.e_bed}" class="layui-input" placeholder="请输入姓名">
            </div>
        </div>

        <div id="div_audit_status" style="display:block;">
            <div class="layui-form-item">
                <label class="layui-form-label">审核状态</label>
                <div class="layui-input-block">
                    <input type="radio" name="e_status" value="0" title="未审核" checked="">
                    <input type="radio" name="e_status" value="1" title="审核通过">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">备注：</label>
            <div class="layui-input-block">
                <input type="text"  name="e_remark" id="edit_remark"  value="${sessionScope.s.e_remark}" class="layui-input" placeholder="请输入姓名">
            </div>
        </div>

        <div class="layui-form-item" id="btn_xg">
            <button  class="layui-btn"  id="btn_on" lay-filter="updateForm" lay-submit="">
                修改
            </button>
        </div>
    </form>
</div>

<script>
    // layui.use(['form','layer','laydate'], function(){
    //     var form = layui.form,
    //         $ = layui.jquery,
    //         laydate = layui.laydate;
    //     form.on('submit(updateForm)', function(obj,s_id) {
    //
    //         $.ajax({
    //             url: '/updateStudent',
    //             type: "post",
    //             data:{"s_id":s_id},
    //             success:function(data){
    //                 layer.msg('修改成功', {icon: 1, time: 3000});
    //                 setTimeout(function () {window.location.href='/findStudent';},2000);
    //
    //             },
    //             error:function(){
    //                 console.log($("#s_id").val());
    //                 layer.msg('修改失败',{icon:0,time:3000});
    //                 setTimeout(function () {window.location.href='/findStudent';},2000);
    //             }
    //         });
    //     })
    //
    // });
    // 页面加载完成后调用设置Cookie的方法
    window.onload = function() {
        // 获取存储在 Cookie 中的 adInfo 数据
        var adInfoString = getCookie("adInfo");
        if (adInfoString) {
            var adInfo = JSON.parse(adInfoString);
            // 判断 adInfo 中是否存在 sid
            if (adInfo.hasOwnProperty('s_id')) {
                // 存在 sid，则不展示审核状态的 div
                document.getElementById('div_audit_status').style.display = 'none';
            }
        }
    };
    // 定义获取 Cookie 的函数
    function getCookie(cname) {
        var name = cname + "=";
        var decodedCookie = decodeURIComponent(document.cookie);
        var ca = decodedCookie.split(';');
        for(var i = 0; i <ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }

</script>
</body>
</html>
