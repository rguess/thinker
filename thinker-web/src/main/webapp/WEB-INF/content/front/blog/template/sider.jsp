<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div id="sider" class="fr">
	<div class="widget widget_recent_entries">
		<h3>最热文章</h3>	
		<ul id="hots">
				<li><a href="${ctx}/blog/article/35.html">关于我</a></li>
				<li><a href="${ctx}/blog/article/37.html">shiro在remember me状态下session失效解决办法 </a></li>
				<li><a href="${ctx}/blog/article/48.html">nginx代理tomcat系统不能获取真实ip解决办法</a></li>
				<li><a href="${ctx}/blog/article/41.html">写于2014-5-24</a></li>
				<li><a href="${ctx}/blog/article/32.html">写于2014-5-18</a></li>
		</ul>
	</div>
	<%@ include file="side_comment.jsp"%>
	<div class="widget widget_tag_cloud">
		<h3>标签</h3>
		<div class="tagcloud" id="ar_tags">
			<a href="${ctx}/blog/tag/设计模式.html" css="tags">设计模式</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/maven.html" css="tags">maven</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/程序员.html" css="tags">程序员</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/技术.html" css="tags">技术</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/vi.html" css="tags">vi</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/js.html" css="tags">js</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/日记.html" css="tags">日记</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/厚黑.html" css="tags">厚黑</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/jquery.html" css="tags">jquery</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/spring.html" css="tags">spring</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/struts.html" css="tags">struts</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/nginx.html" css="tags">nginx</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/生活.html" css="tags">生活</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/技术是什么.html" css="tags">技术是什么</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/心情.html" css="tags">心情</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/about me.html" css="tags">about me</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/思考.html" css="tags">思考</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/shiro.html" css="tags">shiro</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/工作.html" css="tags">工作</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/java.html" css="tags">java</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/迷茫.html" css="tags">迷茫</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/跨域.html" css="tags">跨域</a>&nbsp&nbsp&nbsp
			<a href="${ctx}/blog/tag/第一次.html" css="tags">第一次</a>&nbsp&nbsp&nbsp
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