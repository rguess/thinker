<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${r'$'}{pageContext.request.contextPath}" />
<div id="sider" class="fr">
	<div class="widget widget_recent_entries">
		<h3>最热文章</h3>	
		<ul id="hots">
			<#list hots as hot>
				<li><a href="${r'$'}{ctx}/blog/article/${hot.id}.html">${hot.title}</a></li>
			</#list>
		</ul>
	</div>
	<%@ include file="side_comment.jsp"%>
	<div class="widget widget_tag_cloud">
		<h3>标签</h3>
		<div class="tagcloud" id="ar_tags">
		<#list tags as tag>
			<a href="${r'$'}{ctx}/blog/tag/${tag}.html" css="tags">${tag}</a>&nbsp&nbsp&nbsp
		</#list>
		</div>
	</div>
	
	<div class="widget">
		<h3>百度广告</h3>	
		<div>
			<!-- <script type="text/javascript">BAIDU_CLB_fillSlot("923370");</script> -->
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		initTags();
	})
	function initTags(){
		var colors = ["#5fe0af","#4a4246","#c2c556","#df2778","#c0d0c3","#df836f","#55351d","#28c6ea","#8ba3fe","#54b220","#28f656","#ff5334","#54f17a","#18ff82","#16311f","#52a9be","#f4bf70","#ec3a98","#c1c8e5","#81161c","#4b6c85","color:#519f1d","#454bdc","color:#de5604","#6df35","#29f083"];
		var fontSizes = ["8pt","8pt","8pt","16pt","8pt"];
		
		$.each($("#ar_tags a"),function(i,item){
			var color = colors[parseInt(Math.random()*colors.length)];
			var fontSize = fontSizes[parseInt(Math.random()*fontSizes.length)];
			
			$(item).attr("href",encodeURI(encodeURI($(item).attr("href"))));
			$(item).attr("style","color:"+color+";font-size:"+fontSize+"");
		});
	}
</script>