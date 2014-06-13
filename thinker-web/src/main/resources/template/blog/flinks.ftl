<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div class="f_links" id="f_links" onmouseover="javascript:linksOver()" onmouseout="javascript:linksOut();">
	<div class="f_links_content" id="f_links_content">
		<ul>
			<#list list as link>
				<li><a href="${link.href}" target="_blank"><img src="${link.image}" style="height: 20px"/>${link.title}</a></li>
			</#list>
		</ul>
	</div>
	<img class="f_links_img" src="${r'$'}{ctx}/assets/xyz/bg/images/links.jpg" alt="" />
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