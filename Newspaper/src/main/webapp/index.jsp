<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <title>后台登录-X-admin2.0</title>
  <meta name="renderer" content="webkit|ie-comp|ie-stand">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
  <meta http-equiv="Cache-Control" content="no-siteapp" />

  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="D:\Maven-GitHub\dev01\Newspaper\src\main\webapp\css\font.css">
  <link rel="stylesheet" href="D:\Maven-GitHub\dev01\Newspaper\src\main\webapp\css\xadmin.css">
  <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
  <script src="D:\Maven-GitHub\dev01\Newspaper\src\main\webapp\lib\layui\layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="D:\Maven-GitHub\dev01\Newspaper\src\main\webapp\js\xadmin.js"></script>
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
<h1>
  报刊管理系统
</h1>
<div class="login">
  <div class="message">用户登录
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a class="message" href="${pageContext.request.contextPath}/admin/queryAdmin">管理员登录</a>
  </div>
  <div id="darkbannerwrap"></div>
  <span style="color: red;font-width: bold;">${error}</span>
  <form class="layui-form" action="${pageContext.request.contextPath}/user/queryUser" method="post" >
    <input name="name" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
    <hr class="hr15">
    <input name="pwd" lay-verify="required" placeholder="密码"  type="text" class="layui-input">
    <hr class="hr15">
    <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
    <hr class="hr20" >
  </form>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="${pageContext.request.contextPath}/user/toAddUser">没有账号吗？去注册吧！</a>
</div>
</body>
</html>