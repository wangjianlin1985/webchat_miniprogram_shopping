<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <link href="${ctx}/resource/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/resource/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/resource/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/resource/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/resource/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${ctx}/resource/static/h-ui/js/H-ui.js"></script> 
<link rel="stylesheet" type="text/css" href="${ctx}/resource/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resource/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resource/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resource/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resource/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${ctx}/resource/static/h-ui.admin/css/style.css" />
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
<head>
<style>
#doc-topbar-collapse-3 a{
font-weight: bold;
font-size: 14px;
}
.headers{
height: 30px;width: 200px;
z-index:999;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 品牌管理 <span class="c-gray en">&gt;</span> 品牌列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
   <form action="manage_manage.do">
  <%--  <div class="text-c"> 
		<input type="text" class="input-text" style="width:250px" placeholder="输入名称" id="" name="name" value="${Obj.name}"  >
		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div> --%>
   </form>
	<form action="">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	    <span class="l">  
	                      <a href="javascript:;" onclick="admin_add('添加品牌','${ctx}/pp_add.do?lbId=${lbId}','600','300')" class="btn btn-primary radius">
	                      <i class="Hui-iconfont">&#xe600;</i>  添加品牌</a></span>
	                     <span class="r">
	                     </span> </div>
	<table class="table table-border table-bordered table-bg">
		<thead>
	<!-- 		private Integer id;
	
	private String purl;
	
	private String ms;//描述 -->
			<tr class="text-c">
				<th width="150">缩略图</th>
				<th width="90">名称</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		 <c:forEach items="${pagers}" var="man" varStatus="l">
		 <tr class="text-c">
				<td>
				<img alt="" src="${man.cpUrl}" style="width: 150px;height: 80px;">
				</td>
				<td>${man.name}</td>
				<td class="td-manage">
				 <a title="编辑" href="${ctx }/pp_update.do?id=${man.id}&lbId=${lbId}" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				  <a title="删除" href="javascript:;" onclick="admin_del('${man.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr>
		 </c:forEach>
		</tbody>
		
	</table>
	</form>
</div>
<script type="text/javascript" src="${ctx}/resource/lib/jquery/1.9.1/jquery.min.js"></script>  
<script type="text/javascript" src="${ctx}/resource/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${ctx}/resource/lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript" src="${ctx}/resource/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${ctx}/resource/static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="${ctx}/resource/static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript">
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function admin_add(title,url,w,h){
	window.location.href=url;
}
/*管理员-删除*/
function admin_del(id){
	layer.confirm('确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		/* 
		$(obj).parents("tr").remove();
		
		
		layer.msg('已删除!',{icon:1,time:1000}); */
		window.location.href=ctx+"/pp_delete.do?id="+id+"&lbId="+${lbId};
	});
}
/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*管理员-停用*/
function admin_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*管理员-启用*/
function admin_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!', {icon: 6,time:1000});
	});
}
</script>
</body>
</html>
