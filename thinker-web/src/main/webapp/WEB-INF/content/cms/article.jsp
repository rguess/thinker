<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>demo</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<!-- 基础样式 -->
<link href="${ctx}/assets/comp/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/css/metro.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/css/style.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/xyz/xiz/css/style.css" type="text/css" rel="stylesheet" />
</head>
<body
	style="background: url(${ctx}/assets/xyz/xiz/img/bg.jpg) no-repeat top center">
	<div class="container">
		<div class="row-fluid">
			<div class="span6">今天是：2014年4月27日 星期日 农历甲午年 三月廿八</div>
			<div class="pull-right">
				<a href="javascript:;">设置主页</a> &nbsp;|&nbsp; <a href="javascript:;">加入收藏</a>
			</div>
		</div>
		<div>
			<%-- <img src="${ctx}/assets/xyz/xiz/img/cover.png" /> --%>
		</div>
		<div class="top-nav">
			<div class="nav-m">
				<ul class="white">
					<li><a href="index.html">首页</a></li>
	                <li><a href="list.html">各地动态</a></li>
	                <li><a href="list.html">队伍建设</a></li>
	                <li><a href="list.html">专项工作</a></li>
	                <li><a href="list.html">情报研判</a></li>
	                <li><a href="list.html">执法规范</a></li>
	                <li><a href="list.html">协作追查</a></li>
	                <li><a href="list.html">案件动态</a></li>
	                <li><a href="list.html">留言簿</a></li>
				</ul>
				<form class="search">
					<div class=".input-box">
						<input type="text" class="span2" placeholder="关键字"/>
						<button type="submit" class="submit">搜索</button>
					</div>
				</form>
			</div>
			<div class="nav-r"></div>
		</div>
		<div class="row-fluid" style="margin-top: 10px;">
			<div class="span3">
				<div class="portlet box blue">
					<div class="portlet-title">
						<h4><i class="icon-reorder"></i>最新新闻</h4>
					</div>
					<div class="portlet-body">
						<ul class="unstyled">
							<li>Lorem ipsum dolor sit amet</li>
							<li>Consectetur adipiscing elit</li>
							<li>Integer molestie lorem at massa</li>
							<li>Facilisis in pretium nisl aliquet</li>
							<li>Faucibus porta lacus fringilla vel</li>
							<li>Aenean sit amet erat nunc</li>
							<li>Eget porttitor lorem</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="span9 article">
				<div class="article_herder">
					<h2 style="color: ${article.color}">${article.title }</h2>
				</div>
				<div class="article_content">
					<c:choose>
						<c:when test="${article.isWord ==0 }">
							<iframe src="${ctx }/upload/article/${article.htmlid }/index.htm" id="article_iframe"></iframe>
						</c:when>
						<c:otherwise>
							${article.content }
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<script src="${ctx}/assets/js/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			<c:choose>
				<c:when test="${article.isWord ==0 }">
					setArticleContentHeight();
				</c:when>
			</c:choose>
		});
		
		function setArticleContentHeight(){
			$("#article_iframe").load(function(){
				var height = $(document.getElementById('article_iframe').contentWindow.document).height();
				$(".article_content").css("height",height+20+"px");
			})
		}
	</script>
</body>
</html>