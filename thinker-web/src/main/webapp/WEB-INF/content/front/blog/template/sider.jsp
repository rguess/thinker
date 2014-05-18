<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div id="sider" class="fr">
	<div class="widget widget_recent_entries">
		<h3>近期文章</h3>	
		<ul id="hots">
			
		</ul>
	</div>
	<div class="widget widget_tag_cloud">
		<h3>标签</h3>
		<div class="tagcloud" id="ar_tags">
			
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		listHots();
		initTags();
	})
	function listHots(){
		$.ajax({
			type : "GET",
			dataType : "json",
			url : "${ctx}/cms/article/showHots",
			success : function(data){
				$.each(data,function(i,item){
					$("#hots").append($("<li></li>").append($("<a href='${ctx}/blog/article/"+item.id+".html'>"+item.title+"</a>")))
				})
			}
		});
	}
	function initTags(){
		var colors = ["#5fe0af","#4a4246","#c2c556","#df2778","#c0d0c3","#df836f","#55351d","#28c6ea","#8ba3fe","#54b220","#28f656","#ff5334","#54f17a","#18ff82","#16311f","#52a9be","#f4bf70","#ec3a98","#c1c8e5","#81161c","#4b6c85","color:#519f1d","#454bdc","color:#de5604","#6df35","#29f083"];
		var fontSizes = ["8pt","8pt","8pt","16pt","8pt"];
		$.ajax({
			type : "GET",
			dataType : "json",
			url : "${ctx}/cms/article/getTags",
			success : function(data){
				$.each(data,function(i,item){
					var color = colors[parseInt(Math.random()*colors.length)];
					var fontSize = fontSizes[parseInt(Math.random()*fontSizes.length)];
					$("#ar_tags").append('<a href="#" css="tags" style="color:'+color+';font-size: '+fontSize+';">'+item+'</a>&nbsp&nbsp&nbsp')
				})
			}
		});
	}
</script>