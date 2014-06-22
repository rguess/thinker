<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div class="f_links" id="f_links" onmouseover="javascript:linksOver()" onmouseout="javascript:linksOut();">
	<div class="f_links_content" id="f_links_content">
		<ul>
							<li><a href="http://www.aipp.me/" target="_blank"><img src="http://www.aipp.me/favicon.ico" style="height: 20px"/>b0y's blog</a></li>
				<li><a href="http://www.super-man.cc/" target="_blank"><img src="http://www.super-man.cc/content/templates/loper/images/favicon.ico" style="height: 20px"/>陌小染's blog</a></li>
				<li><a href="http://www.scyy520.cc/" target="_blank"><img src="http://www.scyy520.cc/favicon.ico" style="height: 20px"/>苏晨‘s Blog</a></li>
				<li><a href="http://114.215.121.37:8080/meileche/" target="_blank"><img src="http://114.215.121.37:8080/meileche/image/meileche.jpg" style="height: 20px"/>美乐车</a></li>
				<li><a href="http://www.tiejiang.org/" target="_blank"><img src="http://www.google.com/s2/favicons?domain=www.tiejiang.org" style="height: 20px"/>铁匠Linux</a></li>
				<li><a href="http://www.duoluosb.com/" target="_blank"><img src="http://www.duoluosb.com/Favicon.ico" style="height: 20px"/>堕络's Blog</a></li>
				<li><a href="http://0ol.org/" target="_blank"><img src="http://www.google.com/s2/favicons?domain=0ol.org" style="height: 20px"/>星少‘S Blog</a></li>
				<li><a href="http://www.bccsafe.com/" target="_blank"><img src="http://www.bccsafe.com/wp-content/themes/20130801171447/images/favicon.ico" style="height: 20px"/>BccSafe's Blog</a></li>
				<li><a href="http://www.hkzn.cn/" target="_blank"><img src="http://www.hkzn.cn/wp-content/themes/fengying/images/favicon.ico" style="height: 20px"/>指南针Sec</a></li>
				<li><a href="http://prsec.ml/" target="_blank"><img src="http://www.google.com/s2/favicons?domain=www.prsec.ml" style="height: 20px"/>Passer's Blog</a></li>
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