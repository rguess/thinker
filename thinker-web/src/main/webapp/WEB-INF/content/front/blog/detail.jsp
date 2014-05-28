<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>${obj.title }</title>
<meta name="decorator" content="cms_blog"/>
<link href="${ctx }/assets/comp/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css" rel="stylesheet" type="text/css" />  
</head>
<body>
	<div id="breadcrumbs" class="con_box clearfix">
				<div class="bcrumbs"><strong>
					<a href="${ctx }/blog/index.html" title="返回首页">home</a></strong>
					<a href="#" title="查看随笔中的全部文章">${obj.category.name }</a>	
					<a>${obj.title }</a>
				</div>
			</div>
	<div id="art_main1" class="art_white_bg fl">
		<div class="art_title clearfix">        
			<h1 align="center">${obj.title }</h1>
			<div class="jiange"></div>
			<div class="b2"></div>
			<p class="info" align="center">
				<small>时间 : <fmt:formatDate value="${obj.createDate}" pattern="yyyy-MM-dd"/> </small>
				<small>栏目 : <a href="${ctx }/blog/list/${obj.category.id }.html" title="查看${obj.category.name }中的全部文章">${obj.category.name }</a> </small>
				<small>作者 : </small>
				<small>点击 :  ${obj.hits }次</small>
			</p>
		</div>
		<div class="article_content">
			<div class="clear"></div>
			<div id="topic_content">
				${obj.content }
			</div> 
			<div class="clear"></div>
			<p>
				<strong>本文标签</strong>： 
			</p>				
			<p> 转载请保留链接:
				<a href="<%=basePath %>blog/article/${obj.id}.html" title="要靠自己，也要靠别人"><%=basePath %>blog/article/${obj.id}.html</a>
			</p>
		</div>
	</div>
<script type="text/javascript" src="${ctx }/assets/comp/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>  
<script type="text/javascript">    
	SyntaxHighlighter.all();
</script>
</body>
</html>