<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div class="f_links" id="f_links" onmouseover="javascript:linksOver()" onmouseout="javascript:linksOut();">
	<div class="f_links_content" id="f_links_content">
		<ul>
							<li><a href="http://www.aipp.me/" target="_blank"><img src="http://www.aipp.me/favicon.ico" style="height: 20px"/>b0y's blog</a></li>
				<li><a href="http://www.super-man.cc/" target="_blank"><img src="http://www.super-man.cc/content/templates/loper/images/favicon.ico" style="height: 20px"/>陌小染's blog</a></li>
				<li><a href="http://www.scyy520.cc/" target="_blank"><img src="http://www.scyy520.cc/favicon.ico" style="height: 20px"/>苏晨‘s Blog</a></li>
				<li><a href="http://114.215.121.37:8080/meileche/" target="_blank"><img src="http://114.215.121.37:8080/meileche/image/meileche.jpg" style="height: 20px"/>美乐车</a></li>
		</ul>
	</div>
	<img class="f_links_img" src="${ctx}/assets/xyz/bg/images/links.jpg" alt="" />
</div>
<script type="text/javascript">
	function linksOver(){
		document.getElementById( "f_links" ).style.width = "200px";
		var c_style = document.getElementById( "f_links_content" ).style
		c_style.width = "200px";
		c_style.display = "block";
	}
	function linksOut(){
		document.getElementById( "f_links" ).style.width = "0px";
		var c_style = document.getElementById( "f_links_content" ).style
		c_style.width = "0px";
		c_style.display = "none";
	}
</script>