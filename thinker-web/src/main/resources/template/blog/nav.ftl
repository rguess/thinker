<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div class="gridNav">
	<div class="nav02">
		<ul class="ulBox02">
	    	<li class="current"><a href="${r'$'}{ctx }/blog/index.html">首页</a></li>
	    	<#list categorys as item>
				<li><a href="${r'$'}{ctx }/blog/list/${item.id}.html">${item.name}</a>
					<#if ((item.childList)?size>0)>
						<ul>
						<#list item.childList as child>
							<li><a href="${r'$'}{ctx }/blog/list/${child.id}.html">${child.name}</a></li>
			            </#list>
			            </ul>
					</#if>
				</li>
			</#list>
	    </ul>
	    <div class="scrollObj02"></div>
	</div>
</div>