<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<%-- <img src="${r'$'}{ctx}/assets/xyz/xiz/img/cover.png" /> --%>
</div>
<div class="top-nav">
	<div class="nav-m">
		<ul class="white">
			<li><a href="${r'$'}{ctx }/front/index.html">首页</a></li>
			<#list categorys as item>
				<li><a href="${r'$'}{ctx }/front/list/${item.id}.html">${item.name}</a></li>
			</#list>
		</ul>
		<form class="search" style="float:right">
			<div class=".input-box">
				<input type="text" class="span2" placeholder="关键字"/>
				<button type="submit" class="submit">搜索</button>
			</div>
		</form>
	</div>
	<div class="nav-r"></div>
</div>