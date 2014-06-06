<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>${obj.title }</title>
<meta name="decorator" content="cms_blog"/>
<link href="${ctx }/assets/comp/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css" rel="stylesheet" type="text/css" />  
</head>
<body>
	<div id="breadcrumbs" class="con_box clearfix">
				<div class="bcrumbs"><strong>
					<a href="${ctx }/blog/index.html" title="返回首页">home</a></strong>
					<a href="#" title="查看随笔中的全部文章">${obj.category.name }</a>	
					<a>${obj.title }</a>
				</div>
			</div>
	<div id="art_main1" class="art_white_bg fl">
		<div class="art_title clearfix">        
			<h1 align="center">${obj.title }</h1>
			<div class="jiange"></div>
			<div class="b2"></div>
			<p class="info" align="center">
				<small>时间 : <fmt:formatDate value="${obj.createDate}" pattern="yyyy-MM-dd"/> </small>
				<small>栏目 : <a href="${ctx }/blog/list/${obj.category.id }.html" title="查看${obj.category.name }中的全部文章">${obj.category.name }</a> </small>
				<small>作者 : </small>
				<small>点击 :  ${obj.hits }次</small>
			</p>
		</div>
		<div class="article_content">
			<div class="clear"></div>
			<div id="topic_content">
				${obj.content }
			</div> 
			<div class="clear"></div>
			<p>
				<strong>本文标签</strong>： 
			</p>				
			<p> 转载请保留链接:
				<a href="<%=basePath %>blog/article/${obj.id}.html" title="${obj.title }"><%=basePath %>blog/article/${obj.id}.html</a>
			</p>
		</div>
		<!-- 评论 -->
		<div class="jiange2"></div>
		<h3 id="comments" class="mtitle">${obj.title }：目前有${fn:length(obj.comments)} 条留言</h3>
		<div class="b2"></div>
		<ol class="commentlist">
			<li class="comment even thread-even depth-1" id="comment-104">
				<div id="div-comment-104" class="comment-body">
					<div class="comment-author vcard">
						<img alt="" src="http://s.gravatar.com/avatar/e52e12ad624c399a43bf25b2ebfdc2a2?s=40" class="avatar avatar-40 photo avatar-default" height="40" width="40">
						<div class="floor">4楼</div>
						<strong>dsadsa</strong>
						<span class="commentmetadata">
							<a class="comment-reply-link" href="/105.html?replytocom=104#respond" onclick="return addComment.moveForm(&quot;div-comment-104&quot;, &quot;104&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a>
						</span>
					</div>		
					<span class="datetime">Post:2014-05-13 下午2:01 </span><div class="clear"></div>
					<p>???好的</p>
			  </div>
			</li>
		</ol>
		<div id="respond_box">
			<div id="respond">
				<h3>发表评论</h3>	
				<div class="b2"></div>
				<div class="jiange2"></div>
				<div class="cancel-comment-reply">
					<div id="real-avatar">
						<img alt="" src="http://s.gravatar.com/avatar/e52e12ad624c399a43bf25b2ebfdc2a1?s=40" class="avatar avatar-40 photo avatar-default" height="40" width="40">
					</div>	
					<a rel="nofollow" id="cancel-comment-reply-link" href="/105.html#respond" style="display:none;">点击这里取消回复。</a>
				</div>
		    	<form action="${ctx }/blog/comment" method="post"  id="commentform">
		    		<input type="hidden" name="article.id" value="${obj.id }">
      				<div id="comment-author-info">
						<p>
							<input type="text" name="name" class="commenttext" value="" size="22" tabindex="1">
							<label for="author">昵称(必填)</label>
						</p>
						<p>
							<input type="text" name="email" class="commenttext" value="" size="22" tabindex="2">
							<label for="email">邮箱</label>
						</p>
						<p>
							<input type="text" name="url" class="commenttext" value="" size="22" tabindex="3">
							<label for="url">网址</label>
						</p>
					</div>
            		<div class="clear"></div>
<p>
<script type="text/javascript" language="javascript">
/* <![CDATA[ */
    function grin(tag) {
    	var myField;
    	tag = ' ' + tag + ' ';
        if (document.getElementById('comment') && document.getElementById('comment').type == 'textarea') {
    		myField = document.getElementById('comment');
    	} else {
    		return false;
    	}
    	if (document.selection) {
    		myField.focus();
    		sel = document.selection.createRange();
    		sel.text = tag;
    		myField.focus();
    	}
    	else if (myField.selectionStart || myField.selectionStart == '0') {
    		var startPos = myField.selectionStart;
    		var endPos = myField.selectionEnd;
    		var cursorPos = endPos;
    		myField.value = myField.value.substring(0, startPos)
    					  + tag
    					  + myField.value.substring(endPos, myField.value.length);
    		cursorPos += tag.length;
    		myField.focus();
    		myField.selectionStart = cursorPos;
    		myField.selectionEnd = cursorPos;
    	}
    	else {
    		myField.value += tag;
    		myField.focus();
    	}
    }
/* ]]> */
</script>
<a href="javascript:grin(':?:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_question.gif" alt=""></a>
<a href="javascript:grin(':razz:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_razz.gif" alt=""></a>
<a href="javascript:grin(':sad:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_sad.gif" alt=""></a>
<a href="javascript:grin(':evil:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_evil.gif" alt=""></a>
<a href="javascript:grin(':!:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_exclaim.gif" alt=""></a>
<a href="javascript:grin(':smile:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_smile.gif" alt=""></a>
<a href="javascript:grin(':oops:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_redface.gif" alt=""></a>
<a href="javascript:grin(':grin:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_biggrin.gif" alt=""></a>
<a href="javascript:grin(':eek:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_surprised.gif" alt=""></a>
<a href="javascript:grin(':shock:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_eek.gif" alt=""></a>
<a href="javascript:grin(':???:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_confused.gif" alt=""></a>
<a href="javascript:grin(':cool:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_cool.gif" alt=""></a>
<a href="javascript:grin(':lol:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_lol.gif" alt=""></a>
<a href="javascript:grin(':mad:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_mad.gif" alt=""></a>
<a href="javascript:grin(':twisted:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_twisted.gif" alt=""></a>
<a href="javascript:grin(':roll:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_rolleyes.gif" alt=""></a>
<a href="javascript:grin(':wink:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_wink.gif" alt=""></a>
<a href="javascript:grin(':idea:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_idea.gif" alt=""></a>
<a href="javascript:grin(':arrow:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_arrow.gif" alt=""></a>
<a href="javascript:grin(':neutral:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_neutral.gif" alt=""></a>
<a href="javascript:grin(':cry:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_cry.gif" alt=""></a>
<a href="javascript:grin(':mrgreen:')"><img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_mrgreen.gif" alt=""></a>
<br>
</p>
	    <div id="post-comment-text">
			<p>
				<textarea name="w" id="comment" tabindex="4"></textarea>
				<div id="loading" style="display: none;"><img src="http://www.muchun.net/wp-admin/images/wpspin_light.gif" style="vertical-align:middle;" alt=""> 正在提交, 请稍候...</div>
				<div id="error" style="display: none;">#</div>
				<textarea name="comment" cols="100%" rows="4" style="display:none"></textarea>
			</p>
		</div>
		<p>
			<input class="submit" name="submit" type="submit" id="submit" tabindex="5" value="提交[Ctrl+Enter]">
			<input class="reset" name="reset" type="reset" id="reset" tabindex="6" value="重写">
			<input type="hidden" name="comment_post_ID" value="105" id="comment_post_ID">
			<input type="hidden" name="comment_parent" id="comment_parent" value="0">
		</p>
		<script type="text/javascript">	//Crel+Enter
			$(document).keypress(function(e){
				if(e.ctrlKey && e.which == 13 || e.which == 10) { 
					$(".submit").click();
					document.body.focus();
				} else if (e.shiftKey && e.which==13 || e.which == 10) {
					$(".submit").click();
				}          
			})
		</script>
		    </form>

		<div class="clear"></div>
      	</div>
  </div>
  <div class="clear"></div>
	</div>
	
<script type="text/javascript" src="${ctx }/assets/comp/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>  
<script type="text/javascript">    
	SyntaxHighlighter.all();
</script>
</body>
</html>