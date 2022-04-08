<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台登录-X-admin2.0</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <style>
        h1 {
            text-align: center;
            margin-top: 50px;
            font-size: 39px;
            color: white;
        }
    </style>

</head>
<body class="login-bg">
<h1>报刊管理系统</h1>
<div class="login">
    <div class="message">用户注册
    </div>
    <div id="darkbannerwrap"></div>
    <span style="color: red;font-width: bold;">${error}</span>
    <form class="layui-form" action="${pageContext.request.contextPath}/user/addUser" method="post" >
        <input name="userName" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" lay-verify="nikename">
        <hr class="hr15">
        <input name="userPwd" lay-verify="required" placeholder="密码"  type="text" class="layui-input" lay-verify="pass">
        <hr class="hr15">
        <input value="注册" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20" >
    </form>
</div>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        //自定义验证规则
        form.verify({
            nikename: function(value){
                if(value.length < 1){
                    return '昵称不能为空';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
        });

    });
</script>
</body>
</html>