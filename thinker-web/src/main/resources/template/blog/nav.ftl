<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div class="gridNav">
	<div class="nav02">
		<ul class="ulBox02">
	    	<li class="current"><a href="http://www.rguess.com">首页</a></li>
	    	<#list categorys as item>
				<li>
					<#if ((item.childList)?size>0)>
						<a href="${r'$'}{ctx }/blog/list/${item.id}.html">${item.name}</a>
						<ul>
						<#list item.childList as child>
							<#if item.module == "link">
							    <li><a href="${child.url}">${child.name}</a></li>
							    <#else>
							    <li><a href="${r'$'}{ctx }/blog/list/${child.id}.html">${child.name}</a></li>
							</#if>
			            </#list>
			            </ul>
			        <#else>
			            <#if item.module == "link">
						    <a href="${item.url}">${item.name}</a>
						    <#else>
						    <a href="${r'$'}{ctx }/blog/list/${item.id}.html">${item.name}</a>
						</#if>
					</#if>
				</li>
			</#list>
	    </ul>
	    <div class="scrollObj02"></div>
	</div>
</div>