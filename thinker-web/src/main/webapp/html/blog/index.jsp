<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
<title>thinker</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<link href="${ctx}/assets/comp/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/xyz/bg/css/scrollNav.css" type="text/css" rel="stylesheet" />
</head>
<body >
	<div class="container">
		<div class="nav">
			<ul class="ulBox">
		    	<li><a href="http://www.haw86.com">首页</a></li>
		    	<li><a href="http://www.haw86.com">导航条二</a>
		        	<ul>
		            	<li><a href="http://www.haw86.com">二级导航</a></li>
		            	<li><a href="http://www.haw86.com">二级导航</a></li>
		            	<li><a href="http://www.haw86.com">二级导航</a></li>
		            	<li><a href="http://www.haw86.com">二级导航</a></li>
		            </ul>
		        </li>
		    	<li><a href="http://www.haw86.com">导航条三</a></li>
		    	<li class="current" style="width:108px"><a href="http://www.haw86.com">导航条四</a>
		        	<ul>
		            	<li><a href="http://www.haw86.com">二级导航</a></li>
		            	<li><a href="http://www.haw86.com">二级导航</a></li>
		            	<li><a href="http://www.haw86.com">二级导航</a></li>
		            	<li><a href="http://www.haw86.com">二级导航</a></li>
		            	<li><a href="http://www.haw86.com">二级导航</a></li>
		            	<li><a href="http://www.haw86.com">二级导航</a></li>
		            	<li><a href="http://www.haw86.com">二级导航</a></li>
		            	<li><a href="http://www.haw86.com">二级导航</a></li>
		            </ul>
		        </li>
		    	<li><a href="http://www.haw86.com">导航条五</a></li>
		    	<li><a href="http://www.haw86.com">导航条六</a></li>
		    	<li><a href="http://www.haw86.com">导航条七</a></li>
		    	<li><a href="http://www.haw86.com">导航条八</a></li>
		    </ul>
		    <div class="scrollObj"></div>
		</div>
	</div>
<script src="${ctx}/assets/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/xyz/bg/js/navScroll.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$(".nav > ul > li").ScrollNav({
		scrollObj:".nav > .scrollObj", //滑动的对象
		speed:"fast" //速度
	});
});
</script>
</body>
</html>