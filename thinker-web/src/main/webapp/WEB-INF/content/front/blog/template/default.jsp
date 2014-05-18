<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
<title>thinker's blog</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<link href="${ctx}/assets/xyz/bg/css/scrollNav.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/xyz/bg/css/style.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/xyz/bg/rguess.ico" rel="shortcut icon"/>
<script type="text/javascript" src="${ctx}/assets/xyz/bg/js/jquery-1.8.3.min.js"></script>
<sitemesh:head />
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="nav.jsp"%>
	<div id="wrapper" class="clearfix">	
		<sitemesh:body />
		<%@ include file="sider.jsp"%>
	</div>
<%@ include file="footer.jsp"%>
<script type="text/javascript" src="${ctx}/assets/xyz/bg/js/jquery_muchun.js"></script>
<script type="text/javascript" src="${ctx}/assets/xyz/bg/js/navScroll.js"></script>
<script type="text/javascript">
	$(".nav02 > ul > li").ScrollNav({
		scrollObj:".nav02 > .scrollObj02", //滑动的对象
		speed:"fast" //速度
	});
</script>
</body>
</html>