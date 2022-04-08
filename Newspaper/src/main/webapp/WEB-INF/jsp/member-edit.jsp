<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>报刊修改页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" action="${pageContext.request.contextPath}/paper/updatePaper" method="post">
            <%--前端传递隐藏域--%>
            <input type="hidden" name="paperID" value="${QPaper.paperID}">
          <div class="layui-form-item">
              <div class="layui-form-item">
                  <label for="L_username" class="layui-form-label">
                      <span class="x-red">*</span>报刊名称
                  </label>
                  <div class="layui-input-inline">
                      <input type="text" id="L_username" name="paperName" value="${QPaper.paperName}" required="" lay-verify="nikename"
                             autocomplete="off" class="layui-input">
                  </div>
              </div>
              <div class="layui-form-item">
                  <label for="L_username" class="layui-form-label">
                      <span class="x-red">*</span>报刊数量
                  </label>
                  <div class="layui-input-inline">
                      <input type="text" id="L_bookCounts" name="paperCounts" value="${QPaper.paperCounts}" required="" lay-verify="nikename"
                             autocomplete="off" class="layui-input">
                  </div>
              </div>
              <div class="layui-form-item">
                  <label for="L_username" class="layui-form-label">
                      <span class="x-red">*</span>报刊描述
                  </label>
                  <div class="layui-input-inline">
                      <input type="text" id="L_detail" name="detail" value="${QPaper.detail}" required="" lay-verify="nikename"
                             autocomplete="off" class="layui-input">
                  </div>
              </div>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <a class="layui-btn" href="javascript:window.location.href=document.referrer;">返回</a>
              <button class="layui-btn" lay-filter="add" lay-submit="">
                  修改
              </button>
          </div>
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
              return '必填项不能为空';
            }
          }

        });
       });
  </script>
  </body>

</html>