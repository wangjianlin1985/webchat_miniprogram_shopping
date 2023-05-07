<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!-- 评价界面 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%-- <link rel="stylesheet" type="text/css" href="${ctx }/resource/boot/css/bootstrap.min.css" /> --%>
<%--     <link rel="stylesheet" type="text/css" href="${ctx }/resource/css/bootstrap-responsive.css" /> --%>
<%--     <link rel="stylesheet" type="text/css" href="${ctx }/resource/css/style.css" /> --%>


<link href="${ctx }/resource/la/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx }/resource/la/css/datepicker3.css" rel="stylesheet">

<link href="css/styles.css" rel="stylesheet">
<script src="${ctx }/resource/la/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/resource/js/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${ctx}/resource/js/ueditor/ueditor.all.min.js"></script>
	<title>管理后台登陆</title>
  
	 <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }

.table th,
.table td {
  padding: 8px;
  line-height: 20px;
  text-align: left;
  vertical-align: top;
  border-top: 1px solid #dddddd;
}
    </style>

</head>
<body>

<!-- 1111111111111 -->

	<div class="col-sm-6 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">公告发布</h1>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">发布公告</div>
					<div class="panel-body">
						<div class="col-md-6">
							<form role="form" id="myForm" action="news_updatenew.do" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label>标题：</label>
									<input class="form-control" placeholder="请输入标题" name="title" value="${dddd.title }">
								</div>
								<div class="form-group">
									<label>内容：</label>
									<textarea class="form-control" rows="3" name="content">${dddd.content }</textarea>
								</div>	
								<button type="button" class="btn btn-primary" id="save">发布新闻</button>
								<button type="reset" class="btn btn-default">重置</button>
						</form>
					</div>
				</div>
			</div><!-- /.col-->
		</div><!-- /.row -->
		
	</div><!--/.main-->

	


</body>
<script>
$("#save").click(function(){
	$("#myForm").submit();
	
	
});
</script>