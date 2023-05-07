<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx}/resource/css/index.css" rel="stylesheet">
<link href="${ctx}/resource/css/main.css" rel="stylesheet">
<title>首页</title>
</head>
<body>
<%@ include file="/common/menu.jsp" %>
<!--头部 end-->
<!--头部 end-->
<article>
  <div class="tsjb">
    <h2><span class="location">当前位置：<a href="/">网站首页</a> >> 留言板</span>留言板</h2>
    <div class="note_show">
      <p class="ps_red">注：如您需要得到有关方面的答复，请您详细如实填写联系电话或联系地址！</p>
    </div>  
    <div class="notebook">
      <form action="message_exAdd.do" method="post" name="form1" id="form1">
        <div class="gbook left">
          <ul>
            <li>您的姓名：</li>
            <li>联系邮箱：</li>
            <li>联系电话：</li>
            <li class="bookarea">留言内容：</li>
            <li class="bookbtn"></li>
          </ul>
        </div>
        <div class="gform left">
          <ul>
            <li>
          <!--   private String content;
	private String xm;//
	private String yx;//邮箱
	private String phone;// -->
              <input name="xm" type="text" id="name">
              <span>*（必填）</span></li>
            <li>
              <input name="yx" type="text" id="email">
              <span>*（必填）</span></li>
            <li>
              <input name="phone" type="text" id="mycall">
            </li>
            <li class="bookare">
              <textarea name="content" cols="60" rows="12" id="lytext"></textarea>
            </li>
            <li class="bookbtn">
              <input type="submit" name="Submit3" value="提交" class="btn">
              <input type="reset" name="Submit22" value="重置" class="btn btnrest">
              <input name="enews" type="hidden" id="enews" value="AddGbook">
            </li>
          </ul>
        </div>
      </form>
    </div>
  </div>
</article>
<%@ include file="/common/footer.jsp" %>
</body>
</html>
