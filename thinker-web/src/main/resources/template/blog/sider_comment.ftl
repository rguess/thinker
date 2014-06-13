<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div class="widget hot_box"><h3>最新评论</h3>
	<div class="r_comments">
		<ul>
			<#list list as comment>
			<li>
				<img alt="${comment.name}" src="${r'$'}{ctx}${comment.headPath}" class="avatar avatar-30 photo" height="30" width="30">
				<a href="${r'$'}{ctx}/blog/article/${comment.article.id}.html#comment-${comment.id }" title="发表在：${(comment.article.title)! }">${comment.name }:<br>${comment.content }</a>
				<br>
			</li>
			</#list>
		</ul>
	</div>
</div>