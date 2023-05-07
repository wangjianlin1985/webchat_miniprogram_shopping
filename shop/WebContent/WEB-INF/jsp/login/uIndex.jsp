<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/index.css" />
<link type="text/css" href="${ctx}/resource/css/97zzw.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/resource/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/resource/js/js.js"></script>
	<style type="text/css">
		.banner{width:1000px;margin:0 auto;}
		#focus{width:1000px;height:280px;overflow:hidden;position:relative;}
#focus ul{height:380px;position:absolute;}
#focus ul li{float:left;width:1000px;height:280px;overflow:hidden;position:relative;background:#000;}
#focus ul li div{position:absolute;overflow:hidden;}
#focus .btnBg{position:absolute;width:1000px;height:20px;left:0;bottom:0;background:#000;}
#focus .btn{position:absolute;width:1080px;height:10px;padding:5px 10px;right:0;bottom:0;text-align:right;}
#focus .btn span{display:inline-block;_display:inline;_zoom:1;width:25px;height:10px;_font-size:0;margin-left:5px;cursor:pointer;background:#fff;}
#focus .btn span.on{background:#fff;}
#focus .preNext{width:45px;height:100px;position:absolute;top:90px;background:url(img/sprite.png) no-repeat 0 0;cursor:pointer;}
#focus .pre{left:0;}
#focus .next{right:0;background-position:right top;}
		
		</style>
			<script src="${ctx}/resource/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	var sWidth = $("#focus").width(); //获取焦点图的宽度（显示面积）
	var len = $("#focus ul li").length; //获取焦点图个数
	var index = 0;
	var picTimer;
	
	//以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
	var btn = "<div class='btnBg'></div><div class='btn'>";
	for(var i=0; i < len; i++) {
		btn += "<span></span>";
	}
	btn += "</div><div class='preNext pre'></div><div class='preNext next'></div>";
	$("#focus").append(btn);
	$("#focus .btnBg").css("opacity",0.5);

	//为小按钮添加鼠标滑入事件，以显示相应的内容
	$("#focus .btn span").css("opacity",0.4).mouseover(function() {
		index = $("#focus .btn span").index(this);
		showPics(index);
	}).eq(0).trigger("mouseover");

	//上一页、下一页按钮透明度处理
	$("#focus .preNext").css("opacity",0.2).hover(function() {
		$(this).stop(true,false).animate({"opacity":"0.5"},300);
	},function() {
		$(this).stop(true,false).animate({"opacity":"0.2"},300);
	});

	//上一页按钮
	$("#focus .pre").click(function() {
		index -= 1;
		if(index == -1) {index = len - 1;}
		showPics(index);
	});

	//下一页按钮
	$("#focus .next").click(function() {
		index += 1;
		if(index == len) {index = 0;}
		showPics(index);
	});

	//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
	$("#focus ul").css("width",sWidth * (len));
	
	//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
	$("#focus").hover(function() {
		clearInterval(picTimer);
	},function() {
		picTimer = setInterval(function() {
			showPics(index);
			index++;
			if(index == len) {index = 0;}
		},4000); //此4000代表自动播放的间隔，单位：毫秒
	}).trigger("mouseleave");
	
	//显示图片函数，根据接收的index值显示相应的内容
	function showPics(index) { //普通切换
		var nowLeft = -index*sWidth; //根据index值计算ul元素的left值
		$("#focus ul").stop(true,false).animate({"left":nowLeft},300); //通过animate()调整ul元素滚动到计算出的position
		//$("#focus .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
		$("#focus .btn span").stop(true,false).animate({"opacity":"0.4"},300).eq(index).stop(true,false).animate({"opacity":"1"},300); //为当前的按钮切换到选中的效果
	}
});

</script>
<title>首页</title>
</head>
<body>
<%@ include file="/common/menu.jsp" %>
<!--头部 end-->
<div class="banner box">
<!--banner start-->
		<div class="banner" style="">
			<div id="focus">
			<ul>
              <c:forEach items="${lbs}" var="man" varStatus="l">
                  <li><a><img src="${man.purl}"  style="height: 280px;width: 100%;"/></a>
              </li>
		     </c:forEach>
			</ul>
		</div><!--focus end-->
		</div>
 <div style="margin: 20 auto;width: 1000px;"> 
     <marquee width="1000px" height="28px"  direction="left" scrollamount="3" 
          onmouseover="this.stop()" onmouseout="this.start()">
          <span>${gg.content }</span>
     </marquee>
  </div> 
</div>
<div class="box">
  <div class="blank"></div>
  <div class="ad left"></div>
  <!--  -->
  <div class="blank"></div>
  <div class="linews left">
    <h3><span><a href="news_newList2.do?type=1" class="more">更多..</a></span>环境质量</h3>
            <ul>
              <c:forEach items="${ns1}" var="man" varStatus="l">
                   <li><a href="news_info.do?id=${man.id}" target="_blank">${man.title}</a></li>
		     </c:forEach>
    </ul>
  </div>
  <div class="linews left ln">
    <h3><span><a href="news_newList2.do?type=2" class="more">更多..</a></span>污染防治</h3>
    <ul>
             <c:forEach items="${ns2}" var="man" varStatus="l">
                   <li><a href="news_info.do?id=${man.id}" target="_blank">${man.title}</a></li>
		     </c:forEach>
    </ul>
  </div>
  <div class="linews right">
    <h3><span><a href="news_newList2.do?type=3" class="more">更多..</a></span>生态保护</h3>
    <ul>
              <c:forEach items="${ns3}" var="man" varStatus="l">
                   <li><a href="news_info.do?id=${man.id}" target="_blank">${man.title}</a></li>
		     </c:forEach>
    </ul>
  </div>
  
  
  <div class="blank"></div>
  <div class="linews left">
    <h3><span><a href="news_newList2.do?type=4" class="more">更多..</a></span>绿色产品</h3>
    <ul>
             <c:forEach items="${ns4}" var="man" varStatus="l">
                   <li><a href="news_info.do?id=${man.id}" target="_blank">${man.title}</a></li>
		     </c:forEach>
    </ul>
  </div>
  <div class="linews left ln">
    <h3><span><a href="news_newList2.do?type=5" class="more">更多..</a></span>节能技术</h3>
    <ul>
    <c:forEach items="${ns5}" var="man" varStatus="l">
                   <li><a href="news_info.do?id=${man.id}" target="_blank">${man.title}</a></li>
		     </c:forEach>
    </ul>
  </div>
  <div class="linews right">
    <h3><span><a href="news_newList2.do?type=6" class="more">更多..</a></span>投资</h3>
    <ul>
    <c:forEach items="${ns6}" var="man" varStatus="l">
                   <li><a href="news_info.do?id=${man.id}" target="_blank">${man.title}</a></li>
		     </c:forEach>
    </ul>
  </div>
    <div class="blank"></div>
  <div class="linews left">
    <h3><span><a href="news_newList2.do?type=7" class="more">更多..</a></span>项目</h3>
    <ul>
    <c:forEach items="${ns7}" var="man" varStatus="l">
                   <li><a href="news_info.do?id=${man.id}" target="_blank">${man.title}</a></li>
		     </c:forEach>
    </ul>
  </div>
  <div class="linews left ln">
    <h3><span><a href="news_newList2.do?type=8" class="more">更多..</a></span>品牌企业</h3>
    <ul>
     <c:forEach items="${ns8}" var="man" varStatus="l">
                   <li><a href="news_info.do?id=${man.id}" target="_blank">${man.title}</a></li>
		     </c:forEach>
    </ul>
  </div>
  <div class="linews right">
    <h3><span><a href="news_newList2.do?type=9" class="more">更多..</a></span>公益进行中</h3>
    <ul>
      <c:forEach items="${ns9}" var="man" varStatus="l">
                   <li><a href="news_info.do?id=${man.id}" target="_blank">${man.title}</a></li>
		     </c:forEach>
    </ul>
  </div>
    <div class="blank"></div>
  <div class="linews left">
    <h3><span><a href="news_newList2.do?type=10" class="more">更多..</a></span>精彩回顾</h3>
    <ul>
    <c:forEach items="${ns10}" var="man" varStatus="l">
                   <li><a href="news_info.do?id=${man.id}" target="_blank">${man.title}</a></li>
		     </c:forEach>
    </ul>
  </div>
  <div class="linews left ln">
    <h3><span><a href="news_newList2.do?type=11" class="more">更多..</a></span>国家法规</h3>
    <ul>
     <c:forEach items="${ns11}" var="man" varStatus="l">
                   <li><a href="news_info.do?id=${man.id}" target="_blank">${man.title}</a></li>
		     </c:forEach>
    </ul>
  </div>
  <div class="linews right">
    <h3><span><a href="news_newList2.do?type=12" class="more">更多..</a></span>地方法规</h3>
    <ul>
      <c:forEach items="${ns12}" var="man" varStatus="l">
                   <li><a href="news_info.do?id=${man.id}" target="_blank">${man.title}</a></li>
		     </c:forEach>
    </ul>
  </div>
  
  <div class="blank"></div>
  <div class="blank"></div>
  <div class="blank"></div>
</div>
<!-- 代码开始 -->
<div id="tbox">
	<a id="gotop" href="javascript:void(0)"></a>
</div>
<!-- 代码结束 -->
<%@ include file="/common/footer.jsp" %>
</body>
</html>
