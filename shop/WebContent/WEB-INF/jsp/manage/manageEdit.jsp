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


<link rel="stylesheet" type="text/css" href="${ctx}/resource/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resource/static/h-ui/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resource/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resource/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resource/static/h-ui/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${ctx}/resource/static/h-ui/css/style.css" />
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
<title>管理员列表</title>
</head>
<body>
<article class="page-container">
	<div style="width: 400px;">
	 <form class="form form-horizontal" id="form-admin-add" action="manage_editmanage.do" method="post">
	 <input type="hidden" name="id" value="${ma.id }">
	  <input type="hidden" name="type" value="${ma.type }">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>账号：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="${ma.name }" placeholder="" id="adminName" name="name">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>真实姓名：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="${ma.realName}" placeholder="" id="adminName" name="realName">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>初始密码：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" autocomplete="off" value="" placeholder="密码" id="password" name="passWord">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>新密码：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" autocomplete="off" value="" placeholder="新密码" id="new1" name="new1">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" autocomplete="off" value="" placeholder="确认密码" id="new2" name="new2">
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" id="dd" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
	</form>
	</div>
</article>

<!--_footer 作为公共模版分离出去--> 
<script type="text/javascript" src="${ctx}/resource/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${ctx}/resource/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${ctx}/resource/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="${ctx}/resource/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script> 
<script type="text/javascript" src="${ctx}/resource/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${ctx}/resource/lib/jquery.validation/1.14.0/messages_zh.min.js"></script> 
<script type="text/javascript" src="${ctx}/resource/static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="${ctx}/resource/static/h-ui.admin/js/H-ui.admin.js"></script> 
<!--/_footer /作为公共模版分离出去--> 

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#dd").click(function(){
		if($("#password").val()==null){
			alert("初始密码不能为空");
			return;
		}
		var new1 = $("#new1").val();
		var new2 = $("#new2").val();
		if(new1 != new2){
			alert("两次密码输入不正确");
			$("#new1").val("");
			$("#new2").val("")
			return;
		}
		$.ajax({
			  type : 'post',
			  url : ctx+"/manage_editmanage.do",
			  dataType : "json",
			  data:$('#form-admin-add').serialize(),// 
			  success : function(data) {
				//添加提交
				    alert(data.result);
					var index = parent.layer.getFrameIndex(window.name);
					parent.$('.btn-refresh').click();
					parent.layer.close(index);
					//manage
					window.location.href=ctx+"/manage_manageEdit.do";
			},
			error : function() {
				alert("error");
			}
		});
		
	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
