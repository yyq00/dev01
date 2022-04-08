<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员登录页</title>
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
        h1{
            text-align: center;
            margin-top: 50px;
            font-size: 39px;
            color:white;
        }
    </style>

</head>
<body class="login-bg">
<h1>报刊管理系统</h1>

<div class="login">
    <div class="message">管理员登录
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a class="message" href="${pageContext.request.contextPath}/admin/a">用户登录</a>
    </div>
    <div id="darkbannerwrap"></div>

    <form class="layui-form" action="${pageContext.request.contextPath}/admin/addAdmin" method="post" >
        <input name="adminName" placeholder="管理员用户名"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="adminPwd" lay-verify="required" placeholder="管理员密码"  type="text" class="layui-input">
        <hr class="hr15">
        <input value="管理员登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20" >
    </form>

</div>


<!-- 底部结束 -->
</body>
</html>