<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>rguess's博客|互联网技术个人博客</title>
<meta name="decorator" content="cms_blog"/>
</head>
<body>
	<div id="breadcrumbs" class="con_box clearfix">
		<div class="bcrumbs"><strong>
			<a href="${ctx }/blog/index.html" title="返回首页">home</a></strong>
			<c:choose>
				<c:when test="${not empty category }">
					<a>栏目为${category.name }的文章</a>
				</c:when>
				<c:when test="${not empty tag }">
					<a>标签为${tag }的文章</a>
				</c:when>
			</c:choose>
		</div>
	</div>
	<div id="art_container clearfix">
		<div id="art_main1" class="art_white_bg fl">
			<div class="article_content">
				<div id="archives">
					<ul class="al_mon_list">
						<c:forEach var="obj" items="${articles }">
							<li>
								<a href="${ctx }/blog/article/${obj.id}.html">${obj.title }</a>
								<span class="date fr"><fmt:formatDate value="${obj.createDate}" pattern="yyyy-MM-dd"/></span>
								<em>(${obj.hits})</em>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>         
		</div>
	</div>
</body>
</html>