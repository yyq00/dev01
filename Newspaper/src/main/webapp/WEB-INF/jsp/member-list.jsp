<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>报刊列表页</title>
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
  <!-- 引入 Bootstrap -->
  <link rel="stylesheet" href="https://formden.com/static/assets/demos/bootstrap-iso/bootstrap-iso/bootstrap-iso.css" />
</head>

<body>
<div class="x-nav">
<%--      <span class="layui-breadcrumb">--%>
<%--        <a href="">首页</a>--%>
<%--      </span>--%>
  <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
    <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
  <div class="layui-row">
    <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/paper/queryPaper" method="post">
      <%--查询书籍为空时的提示信息--%>
      <span style="color: red;font-width: bold;">${error}</span>
      <input type="text" name="queryPaperName"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
      <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
    </form>
  </div>
  <xblock>
    <a class="layui-btn" href="${pageContext.request.contextPath}/paper/toAddPaper"><i class="layui-icon"> </i>添加</a>
    <a class="layui-btn" href="${pageContext.request.contextPath}/paper/queryPaper"><i class="layui-icon"> </i>显示所有报刊</a>
  </xblock>
  <table class="layui-table">
    <thead>
    <tr>
      <th>报刊编号</th>
      <th>报刊名字</th>
      <th>报刊数量</th>
      <th>报刊详情</th>
      <th>状态</th>
      <th>操作</th>
    </thead>
    <tbody>
    <c:forEach var="paper" items="${papers}">
      <tr>
        <td>${paper.paperID}</td>
        <td>${paper.getPaperName()}</td>
        <td>${paper.getPaperCounts()}</td>
        <td>${paper.getDetail()}</td>
        <td class="td-status">
          <span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>
        <td class="td-manage">
          <a onclick="member_stop(this,'10001')" href="javascript:;"  title="启用">
            <i class="layui-icon">&#xe601;</i>
          </a>
          <a title="编辑"  href="${pageContext.request.contextPath}/paper/toUpdate?id=${paper.paperID}">
            <i class="layui-icon">&#xe642;</i>
          </a>
          <a title="删除" href="${pageContext.request.contextPath}/paper/deletePaper/${paper.paperID}">
            <i class="layui-icon">&#xe640;</i>
          </a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
    <div class="bootstrap-iso">
      <div class="col-md-6 pageMessage">
        <br/>
        <br/>
        当前第${pageInfo.pageNum}页，总共${pageInfo.pages}页，共${pageInfo.total}条记录
      </div>
      <div class="col-md-6">
        <nav aria-label="Page navigation">
          <ul class="pagination">
            <li>
              <a href="/paper/listPapers?offest=1">首页</a>
            </li>
            <c:if test="${pageInfo.hasPreviousPage}">
              <li>
                <a href="/paper/listPapers?offest=${pageInfo.pageNum-1}" aria-label="Previous">
                  &laquo;
                </a>
              </li>
            </c:if>
            <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
              <c:if test="${page_Num == pageInfo.pageNum}">
                <li class="active"><a class="disabled">${page_Num}</a></li>
              </c:if>
              <c:if test="${page_Num != pageInfo.pageNum}">
                <li><a href="/paper/listPapers?offest=${page_Num}">${page_Num}</a></li>
              </c:if>
            </c:forEach>
            <c:if test="${pageInfo.hasNextPage}">
              <li>
                <a href="/paper/listPapers?offest=${pageInfo.pageNum+1}" aria-label="Next">
                  &raquo;
                </a>
              </li>
            </c:if>
            <li>
              <a href="/paper/listPapers?offest=${pageInfo.pages}">末页</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>

</div>
<script>
  layui.use('laydate', function(){
    var laydate = layui.laydate;

    //执行一个laydate实例
    laydate.render({
      elem: '#start' //指定元素
    });

    //执行一个laydate实例
    laydate.render({
      elem: '#end' //指定元素
    });
  });

  /*用户-停用*/
  function member_stop(obj,id){
    layer.confirm('确认要停用吗？',function(index){

      if($(obj).attr('title')=='启用'){

        //发异步把用户状态进行更改
        $(obj).attr('title','停用')
        $(obj).find('i').html('&#xe62f;');

        $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
        layer.msg('已停用!',{icon: 5,time:1000});

      }else{
        $(obj).attr('title','启用')
        $(obj).find('i').html('&#xe601;');

        $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
        layer.msg('已启用!',{icon: 5,time:1000});
      }

    });
  }
</script>
</body>
</html>