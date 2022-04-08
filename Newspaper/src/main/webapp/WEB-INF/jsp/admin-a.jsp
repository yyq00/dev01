<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2021/5/8
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>

</head>
<style>
    /*body {*/
    /*    background-color: #FFA5A5;*/
    /*}*/

    .cen {
        width: 150px;
        height: 150px;
        background-color: #d5093c;
        box-shadow: 0px 0px 70px #d5093c;
        animation: 1s aj infinite;
        margin-left: 150px;
    }

    .aa {
        /*倒圆角 一个参数表示四个都要改，两个参数表示左上角和右下角要改，四个参数表示按顺时针4个都要改*/
        border-radius: 100px;
        position: absolute;
        top: 100px;
        left: 200px;
    }

    .bb {
        /*旋转角度*/
        transform: rotate(45deg);
        position: absolute;
        top: 166px;
        left: 267px;
    }

    .cc {
        border-radius: 100px;
        position: absolute;
        top: 100px;
        left: 333px;
    }

    /*.cen:hover{*/
    /*放大*/
    /*transform: scale(1.3);*/
    /*位移*/
    /*transform: translate(0px ,20px);*/
    /*transform: skew(45deg);*/
    /*}*/

    /*动画*/
    @keyframes aj {
        0% {
            transform: scale(1) rotate(45deg);
        }
        50% {
            transform: scale(1.1) rotate(45deg);
        }
        100% {
            transform: scale(1) rotate(45deg);
        }
    }

</style>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a>报刊管理系统</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav left fast-add" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">+新增</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a onclick="x_admin_show('资讯','http://www.baidu.com')"><i class="iconfont">&#xe6a2;</i>资讯</a></dd>
                <dd><a onclick="x_admin_show('图片','http://www.baidu.com')"><i class="iconfont">&#xe6a8;</i>图片</a></dd>
                <dd><a onclick="x_admin_show('用户','http://www.baidu.com')"><i class="iconfont">&#xe6b8;</i>用户</a></dd>
            </dl>
        </li>
    </ul>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">${QAdmin.adminName}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a href="${pageContext.request.contextPath}/paper/b">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="${pageContext.request.contextPath}/admin/admin">前台首页</a></li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>报刊管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/paper/listPapers">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>报刊列表</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>用户管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/user/listUsers">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>用户信息</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>管理员信息</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/admin/aa">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>信息修改</cite>
                        </a>
                    </li>
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
            <li>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="cen aa">
                    <br>
                    <br>
                    <p style="transform: rotate(-45deg);font-size: 15px;color: white">欢迎您:${QAdmin.adminName}</p>
                </div>
                <div class="cen bb">
                </div>
                <div class="cen cc">
                </div>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg">
</div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">软件2010二组</div>
</div>
</body>
</html>