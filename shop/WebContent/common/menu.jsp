<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/common/taglibs.jsp"%>
   
   <header>
   <style type="text/css">
.searchinput{
    height:30px;
	border-right-width: 0px;
	padding-left: 3px;
	width: 168px;
	font-family: arial;
	float: left;
	border-top-width: 0px;
	border-bottom-width: 0px;
	color: #636365;
	margin-left: 4px;
	font-size: 8pt;
	vertical-align: middle;
	border-left-width: 0px;
	margin-right: 3px;
}
.tab_search{
	border-bottom: #cccccc 1px solid;
	border-left: #cccccc 1px solid;
	border-top: #cccccc 1px solid;
	border-right: #cccccc 1px solid;

}
.searchaction{
	width: 21px;
	float: left;
}
</style>
  <div class="headtop">
  </div>
<!-- /**
	 * 大类--
	 *  走进环保
	 *    --环境质量 1
	 *    --污染防治 2
	 *    --生态保护 3
	 *  资讯
	 *    --绿色产品 4
	 *    --节能技术 5
	 *  市场
	 *    --投资 6
	 *    --项目 7
	 *  品牌企业 
	 *    --品牌企业 8
	 *  公益
	 *    --进行中 9
	 *    --精彩回顾 10
	 *  相关法规
	 *    --国家法规 11
	 *    --地方法规 12
	 */ -->
  <div class="box">
   <h1>
    <span style="color: #0772c5;font-size: 40px;line-height: 60px;display: block;margin-top: 5px;margin-bottom: 10px;font-family: '微软雅黑'"> 新乡市绿色环保网站</span>
   </h1>
   <div class="ser" style="float: right;margin-top:-30px;margin-bottom: 10px">
		  <form action="news_newList2.do" id="dd" method="post">
				<table border="0" align="center" cellpadding="0" cellspacing="0" class="tab_search">
				  <tr>
						<td>
							<input type="text" name="title" title="Search" class="searchinput" value="${Obj.title }"  placeholder="请输入标题"  height="50" id="searchinput"  size="10"/>
						</td>
						<td height="">
							<input type="image" width="21" height="" id="Search" class="searchaction" onclick="" alt="Search" src="${ctx}/resource/images/magglass.gif" border="0" hspace="2"/>
						</td>
					</tr>
				</table>		  
		  </form>
  </div>
  </div>
  <nav id="nav" class="box">
    <ul>
      <li><a href="login_uIndex.do">网站首页</a></li>
      <li><a href="news_newList2.do?type=1">走进环保</a></li>
      <li><a href="news_newList2.do?type=4">资讯</a></li>
      <li><a href="news_newList2.do?type=6">市场</a></li>
      <li><a href="news_newList2.do?type=8">品牌企业</a></li>
      <li><a href="news_newList2.do?type=9">公益</a></li>
      <li><a href="news_newList2.do?type=11"> 相关法规</a></li>
    </ul>
  </nav>
  <script type="text/javascript">
  $(function(){
	  $("#Search").click(function(){
			$("#dd").submit();
		});
  });
  
  </script>
  <script src="js/silder.js"></script> 
</header>
