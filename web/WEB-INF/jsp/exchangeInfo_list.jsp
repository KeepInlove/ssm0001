<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.dormitorySystem.po.ExchangeInfo" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="/layui_exts/excel.js"></script>

    <style type="text/css">
        .layui-table{
                text-align: center;
            }
        .layui-table th{
            text-align: center;
        }
    </style>
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="/findExchangeInfo">调换申请信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findExchangeInfo" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/findExchangeInfo" >
            <input class="layui-input" placeholder="请输入姓名" name="s_name" id="s_name">
            <input class="layui-input" placeholder="请输入学号" name="s_studentid" id="s_studentid">
            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>

    <xblock>
        <button id="addExchangeInfoBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加 </button>
        <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon">&#xe67c;</i>导出</button>
        <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
    </xblock>

    <%--添加模态框--%>
    <div class="layui-row" id="test" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addEmployeeFormExchangeInfo">

                <div class="layui-form-item">
                    <label class="layui-form-label">学号：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="s_id" id="s_id"  value=""  class="layui-input" placeholder="请输入学号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">申请人：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="s_name" id="s_names"  value=""  class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">交换人：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="e_name" id="e_name"  value="" class="layui-input" placeholder="请输入交换姓名">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">申请人楼栋：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="d_dormbuilding" id="d_dormbuilding"  value="" class="layui-input" placeholder="请输入楼栋">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">申请人床位：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="d_bed" id="d_bed"  value="" class="layui-input" placeholder="请输入床位">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">申请人宿舍：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="s_dormitoryid" id="s_dormitoryid"  value="" class="layui-input" placeholder="请输入宿舍">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">交换人宿舍：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="e_dormitoryid" id="e_dormitoryid"  value="" class="layui-input" placeholder="请输入宿舍">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">交换人楼栋：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="e_dormbuilding" id="e_dormbuilding"  value="" class="layui-input" placeholder="请输入楼栋">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">交换人床位：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="e_bed" id="e_bed"  value="" class="layui-input" placeholder="请输入床位">
                    </div>
                </div>

                <div id="div_audit_status_add" style="display:block;">
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
                        <input type="text"  name="e_remark" id="e_remark"  value="" class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="addForm">提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>



    <%--编辑模态框--%>
    <div class="layui-row" id="updteDiv" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addExchangeForm" >

                <div class="layui-form-item">
                    <label class="layui-form-label">学号：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="s_id" id="s_ids"  value=""  class="layui-input" placeholder="请输入学号">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">申请人：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="s_name" id="edit_sname"  value=""  class="layui-input" placeholder="请输入学号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">交换人：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="e_name" id="edit_ename"  value="" class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">申请人楼栋：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="d_dormbuilding" id="edit_dormbuilding"  value="" class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">申请人床位：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="d_bed" id="edit_bed"  value="" class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">交换人楼栋：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="e_dormbuilding" id="edit_edormbuilding"  value="" class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">交换人床位：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="e_bed" id="edit_ebed"  value="" class="layui-input" placeholder="请输入姓名">
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
                        <input type="text"  name="e_remark" id="edit_remark"  value="" class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="updateForm">提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>


    <%--表格数据--%>
    <table class="layui-table">
        <thead>
        <tr>
            <%--<th>--%>
                <%--<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>--%>
            <%--</th>--%>
            <th>ID</th>
            <th>申请人</th>
            <th>交换人</th>
            <th>申请人楼栋</th>
            <th>申请人床位</th>
            <th>交换人楼栋</th>
            <th>交换人床位</th>
            <th>审核状态</th>
            <th>备注</th>
            <th>操作</th>
        </thead>
        <tbody>
<c:forEach items="${pi.list}" var="exchangeInfo">
        <tr>
            <%--<td>--%>
                <%--<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>--%>
            <%--</td>--%>
            <td>${exchangeInfo.e_id}</td>
            <td>${exchangeInfo.s_name}</td>
            <td>${exchangeInfo.e_name}</td>
            <td>${exchangeInfo.d_dormbuilding}</td>
            <td>${exchangeInfo.d_bed}</td>
            <td>${exchangeInfo.e_dormbuilding}</td>
            <td>${exchangeInfo.e_bed}</td>
            <td>
                <c:if test="${exchangeInfo.e_status}==0">
                    未通过
                </c:if>
                <c:if test="${exchangeInfo.e_status}==1">
                    未通过
                </c:if>
            </td>
            <td>${exchangeInfo.e_remark}</td>
            <td>
                <a title="编辑"    id= "updateEdit"    href="/findExchangeInfoById?s_id=${exchangeInfo.e_id}">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" onclick="member_del(this,'${exchangeInfo.s_id}')" href="javascript:;">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
</c:forEach>
        </tbody>
    </table>

<div class="" >
    <input type="hidden" id="totalPageCount" value="${pi.pageTotalCount}"/>
    <c:import url="pageBtn.jsp">
        <c:param name="totalCount" value="${pi.totalCount}"/>
        <c:param name="currentPageNo" value="${pi.pageIndex}"/>
        <c:param name="totalPageCount" value="${pi.pageTotalCount}"/>
    </c:import>
</div>
</div>
<script>

    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });

    layui.use(['jquery', 'excel','form','layer','laydate'], function(){
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;
        var excel = parent.layui.excel;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        /*添加弹出框*/
        $("#addExchangeInfoBtn").click(function () {
            layer.open({
                type:1,
                title:"添加",
                skin:"myclass",
                area:["50%"],
                anim:2,
                content:$("#test").html()
            });
            $("#addEmployeeFormExchangeInfo")[0].reset();

            form.on('submit(addForm)', function(data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param=data.field;
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '/addExchangeInfo',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",

                    success:function(){
                            layer.msg('添加成功', {icon: 1, time: 3000});
                            setTimeout(function () {window.location.href='/findExchangeInfo';},2000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:3000});
                        setTimeout(function () {window.location.href='/findExchangeInfo';},2000);
                    }
                });


                // return false;
            });
        });


    });

    /*删除*/
    function member_del(obj,s_id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
           $.get("/deleteExchangeInfo",{"s_id":s_id},function (data) {
                if(data =true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                  setTimeout(function () {window.location.href='/findExchangeInfo';},2000);
                }else {
                    layer.msg('删除失败!',{icon:1,time:3000});
                    setTimeout(function () {window.location.href='/findExchangeInfo';},2000);
                }
            });
        });
    }
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
                document.getElementById('div_audit_status_add').style.display = 'none';
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
