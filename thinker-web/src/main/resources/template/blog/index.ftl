<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${r'$'}{pageContext.request.contextPath}" />
<html>
<head>
<title>rguess's博客|互联网技术个人博客</title>
<meta name="decorator" content="cms_blog"/>
</head>
<body>
	<div id="art_main" class="fl">
		<div class="sticky_list">
			<ul>
				<li>
					<h2>
						<span class="date fr">2014-05-26</span>
						<span class="zhiding">[置顶]</span>
						<a href="${r'$'}{ctx }/blog/article/35.html" title="关于我"> 关于我
						</a>			
					</h2>
				</li>
				<li>
					<h2>
						<span class="date fr">2014-05-26</span>
						<span class="zhiding">[置顶]</span>
						<a href="http://git.oschina.net/rguess/thinker" target="_blank" title="打硬广...我的开源 thinker">打硬广...我的开源 thinker
						</a>
					</h2>
				</li>
			</ul>
		</div>
		<#list list as article>
		<div class="art_img_box clearfix">
 			<div class="fr box_content">
				<h2>
					<a href="${r'$'}{ctx}/blog/article/${article.id}.html" title="${article.title}" target="_blank">${article.title}</a>
				</h2>
	            <div class="jiange"></div>
				<p class="intro">
					${article.description}
				</p>
				<ul class="clearfix"></ul>
				<div class="info">
					<table width="650" border="0" cellspacing="0" cellpadding="0">
	                	<tbody>
	                    	<tr>
	                        	<td width="570">&nbsp;&nbsp;
	                   				<span> 时间 : ${article.createDate?string('yyyy-MM-dd')}</span>| 
									<span>栏目 : <a href="#" title="查看${(article.category.name)!}中的全部文章">${(article.category.name)!}</a></span>| 
									<span>浏览 :  ${article.hits}</span>|
									<span>标签：<a href="#">${article.keywords}</a></span>    
									<span></span>
								</td>
	                           	<td width="80"><span><a href="${r'$'}{ctx}/blog/article/${article.id}.html" title="${article.title}" target	="_blank">[阅读全文]</a></span>
	                           	</td>
	                        </tr>
	                     </tbody>
	            	</table>
				</div>
    		</div>
     	</div>
 	</#list>
 	<div class="page_navi">
 		<#list sliders as s>
 			<#if s == 1>
			    <a href="http://www.rguess.com" class="current">${s}</a>
			<#else>
				<a href="${r'$'}{ctx}/blog/page/${s}">${s}</a>
			</#if>
 		</#list>
	</div>
 	</div>
</body>
</html>