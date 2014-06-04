<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<h3 id="comments" class="mtitle">要靠自己，也要靠别人：目前有19 条留言</h3>
		<div class="b2"></div>
		<ol class="commentlist">
	<li class="comment even thread-even depth-1" id="comment-45">
   <div id="div-comment-45" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://1.gravatar.com/avatar/d764c50b665b2f1d102a4dd80e9e28da?s=40&amp;d=wavatar&amp;r=G" class="avatar avatar-40 photo" height="40" width="40">	<div class="floor">
	
	18楼	</div>
	<strong><a target="_blank" href="http://www.muchun.net/?url=http://times.eu.org" rel="external nofollow" class="url">梦野间</a></strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=45#respond" onclick="return addComment.moveForm(&quot;div-comment-45&quot;, &quot;45&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-02-15 下午11:51 </span><div class="clear"></div> <p>“新时代，不做创造者，做个整合者 ”值得思考    不过那个送礼的 哈哈 教唆小朋友行贿吗 <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_mrgreen.gif" alt=":mrgreen:" class="wp-smiley"> </p>
  </div>
</li><li class="comment odd alt thread-odd thread-alt depth-1" id="comment-62">
   <div id="div-comment-62" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://1.gravatar.com/avatar/fc78b124d53f4ce2d8997821d4c4fe5a?s=40&amp;d=wavatar&amp;r=G" class="avatar avatar-40 photo" height="40" width="40">	<div class="floor">
	
	17楼	</div>
	<strong>AA</strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=62#respond" onclick="return addComment.moveForm(&quot;div-comment-62&quot;, &quot;62&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-02-26 下午4:23 </span><div class="clear"></div> <p> <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_question.gif" alt=":?:" class="wp-smiley">   <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_razz.gif" alt=":razz:" class="wp-smiley"> </p>
  </div>
</li><li class="comment even thread-even depth-1" id="comment-63">
   <div id="div-comment-63" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://0.gravatar.com/avatar/007c38422f4ba4e9f5aa374087b52a9a?s=40&amp;d=wavatar&amp;r=G" class="avatar avatar-40 photo" height="40" width="40">	<div class="floor">
	
	16楼	</div>
	<strong><a target="_blank" href="http://www.muchun.net/?url=http://health.mhdhome.net" rel="external nofollow" class="url">中医养生</a></strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=63#respond" onclick="return addComment.moveForm(&quot;div-comment-63&quot;, &quot;63&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-02-26 下午9:38 </span><div class="clear"></div> <p>博客好久没更新了。</p>
  </div>
</li><li class="comment odd alt thread-odd thread-alt depth-1" id="comment-64">
   <div id="div-comment-64" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://0.gravatar.com/avatar/67e1ae76acb811f752772246619dd5e3?s=40&amp;d=wavatar&amp;r=G" class="avatar avatar-40 photo" height="40" width="40">	<div class="floor">
	
	15楼	</div>
	<strong><a target="_blank" href="http://www.muchun.net/?url=http://www.baidue.com" rel="external nofollow" class="url">而过</a></strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=64#respond" onclick="return addComment.moveForm(&quot;div-comment-64&quot;, &quot;64&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-02-27 上午9:15 </span><div class="clear"></div> <p>光天化日带上它</p>
  </div>
</li><li class="comment even thread-even depth-1" id="comment-65">
   <div id="div-comment-65" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://0.gravatar.com/avatar/67e1ae76acb811f752772246619dd5e3?s=40&amp;d=wavatar&amp;r=G" class="avatar avatar-40 photo" height="40" width="40">	<div class="floor">
	
	14楼	</div>
	<strong><a target="_blank" href="http://www.muchun.net/?url=http://www.baidue.com" rel="external nofollow" class="url">而过</a></strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=65#respond" onclick="return addComment.moveForm(&quot;div-comment-65&quot;, &quot;65&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-02-27 上午9:16 </span><div class="clear"></div> <p>http:\\www.baibe.co</p>
  </div>
</li><li class="comment odd alt thread-odd thread-alt depth-1" id="comment-66">
   <div id="div-comment-66" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://0.gravatar.com/avatar/?d=wavatar&amp;s=40" class="avatar avatar-40 photo avatar-default" height="40" width="40">	<div class="floor">
	
	13楼	</div>
	<strong>路过</strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=66#respond" onclick="return addComment.moveForm(&quot;div-comment-66&quot;, &quot;66&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-02-27 下午10:55 </span><div class="clear"></div> <p>不错</p>
  </div>
</li><li class="comment even thread-even depth-1" id="comment-67">
   <div id="div-comment-67" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://0.gravatar.com/avatar/?d=wavatar&amp;s=40" class="avatar avatar-40 photo avatar-default" height="40" width="40">	<div class="floor">
	
	12楼	</div>
	<strong>吴延麟</strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=67#respond" onclick="return addComment.moveForm(&quot;div-comment-67&quot;, &quot;67&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-03-01 下午10:36 </span><div class="clear"></div> <p>哥你这个分享功能没有整合好啊</p>
  </div>
</li><li class="comment odd alt thread-odd thread-alt depth-1" id="comment-68">
   <div id="div-comment-68" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://1.gravatar.com/avatar/d6c0d437566ce16eccc6b647adf0a2d0?s=40&amp;d=wavatar&amp;r=G" class="avatar avatar-40 photo" height="40" width="40">	<div class="floor">
	
	11楼	</div>
	<strong><a target="_blank" href="http://www.muchun.net/?url=http://啊啊" rel="external nofollow" class="url">啊啊</a></strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=68#respond" onclick="return addComment.moveForm(&quot;div-comment-68&quot;, &quot;68&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-03-02 下午6:12 </span><div class="clear"></div> <p> <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_cool.gif" alt=":cool:" class="wp-smiley"> </p>
  </div>
</li><li class="comment even thread-even depth-1" id="comment-74">
   <div id="div-comment-74" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://0.gravatar.com/avatar/?d=wavatar&amp;s=40" class="avatar avatar-40 photo avatar-default" height="40" width="40">	<div class="floor">
	
	10楼	</div>
	<strong>测试</strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=74#respond" onclick="return addComment.moveForm(&quot;div-comment-74&quot;, &quot;74&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-03-18 下午1:02 </span><div class="clear"></div> <p> <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_rolleyes.gif" alt=":roll:" class="wp-smiley">   <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_rolleyes.gif" alt=":roll:" class="wp-smiley">   <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_rolleyes.gif" alt=":roll:" class="wp-smiley">   <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_rolleyes.gif" alt=":roll:" class="wp-smiley">   <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_rolleyes.gif" alt=":roll:" class="wp-smiley"> </p>
  </div>
</li><li class="comment odd alt thread-odd thread-alt depth-1" id="comment-77">
   <div id="div-comment-77" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://1.gravatar.com/avatar/b3a56a8b5234b275afa892a9607cc189?s=40&amp;d=wavatar&amp;r=G" class="avatar avatar-40 photo" height="40" width="40">	<div class="floor">
	
	9楼	</div>
	<strong><a target="_blank" href="http://www.muchun.net/?url=http://没看见" rel="external nofollow" class="url">hydr</a></strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=77#respond" onclick="return addComment.moveForm(&quot;div-comment-77&quot;, &quot;77&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-03-25 下午5:00 </span><div class="clear"></div> <p>结局</p>
  </div>
</li><li class="comment even thread-even depth-1" id="comment-86">
   <div id="div-comment-86" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://1.gravatar.com/avatar/d615d5793929e8c7d70eab5f00f7f5f1?s=40&amp;d=wavatar&amp;r=G" class="avatar avatar-40 photo" height="40" width="40">	<div class="floor">
	
	8楼	</div>
	<strong>1</strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=86#respond" onclick="return addComment.moveForm(&quot;div-comment-86&quot;, &quot;86&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-04-24 下午12:36 </span><div class="clear"></div> <p> <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_question.gif" alt=":?:" class="wp-smiley"> </p>
  </div>
</li><li class="comment odd alt thread-odd thread-alt depth-1" id="comment-88">
   <div id="div-comment-88" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://0.gravatar.com/avatar/?d=wavatar&amp;s=40" class="avatar avatar-40 photo avatar-default" height="40" width="40">	<div class="floor">
	
	7楼	</div>
	<strong>阿来博客</strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=88#respond" onclick="return addComment.moveForm(&quot;div-comment-88&quot;, &quot;88&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-04-29 下午2:09 </span><div class="clear"></div> <p>是的</p>
  </div>
</li><li class="comment even thread-even depth-1" id="comment-99">
   <div id="div-comment-99" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://0.gravatar.com/avatar/?d=wavatar&amp;s=40" class="avatar avatar-40 photo avatar-default" height="40" width="40">	<div class="floor">
	
	6楼	</div>
	<strong>123</strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=99#respond" onclick="return addComment.moveForm(&quot;div-comment-99&quot;, &quot;99&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-05-10 下午9:11 </span><div class="clear"></div> <p> <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_biggrin.gif" alt=":grin:" class="wp-smiley"> </p>
  </div>
</li><li class="comment odd alt thread-odd thread-alt depth-1" id="comment-100">
   <div id="div-comment-100" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://0.gravatar.com/avatar/?d=wavatar&amp;s=40" class="avatar avatar-40 photo avatar-default" height="40" width="40">	<div class="floor">
	
	5楼	</div>
	<strong>来也匆匆</strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=100#respond" onclick="return addComment.moveForm(&quot;div-comment-100&quot;, &quot;100&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-05-10 下午9:11 </span><div class="clear"></div> <p>支持楼主</p>
  </div>
</li><li class="comment even thread-even depth-1" id="comment-104">
   <div id="div-comment-104" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://0.gravatar.com/avatar/?d=wavatar&amp;s=40" class="avatar avatar-40 photo avatar-default" height="40" width="40">	<div class="floor">
	
	4楼	</div>
	<strong>dsadsa</strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=104#respond" onclick="return addComment.moveForm(&quot;div-comment-104&quot;, &quot;104&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-05-13 下午2:01 </span><div class="clear"></div> <p>???好的</p>
  </div>
</li><li class="comment odd alt thread-odd thread-alt depth-1" id="comment-105">
   <div id="div-comment-105" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://0.gravatar.com/avatar/?d=wavatar&amp;s=40" class="avatar avatar-40 photo avatar-default" height="40" width="40">	<div class="floor">
	
	地板	</div>
	<strong>范德萨</strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=105#respond" onclick="return addComment.moveForm(&quot;div-comment-105&quot;, &quot;105&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-05-13 下午2:01 </span><div class="clear"></div> <p> <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_redface.gif" alt=":oops:" class="wp-smiley">   <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_redface.gif" alt=":oops:" class="wp-smiley">   <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_redface.gif" alt=":oops:" class="wp-smiley">   <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_redface.gif" alt=":oops:" class="wp-smiley"> </p>
  </div>
</li><li class="comment even thread-even depth-1" id="comment-106">
   <div id="div-comment-106" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://0.gravatar.com/avatar/?d=wavatar&amp;s=40" class="avatar avatar-40 photo avatar-default" height="40" width="40">	<div class="floor">
	
	板凳	</div>
	<strong>范德萨</strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=106#respond" onclick="return addComment.moveForm(&quot;div-comment-106&quot;, &quot;106&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-05-13 下午2:02 </span><div class="clear"></div> <p> <img src="http://www.muchun.net/wp-content/themes/muchun/images/smilies/icon_mad.gif" alt=":mad:" class="wp-smiley"> </p>
  </div>
</li><li class="comment odd alt thread-odd thread-alt depth-1" id="comment-124">
   <div id="div-comment-124" class="comment-body">
      		<div class="comment-author vcard"><img alt="" src="http://1.gravatar.com/avatar/d5e2f27ad9cdd2ac3089784a1dba657a?s=40&amp;d=wavatar&amp;r=G" class="avatar avatar-40 photo" height="40" width="40">	<div class="floor">
	
	沙发	</div>
	<strong><a target="_blank" href="http://www.muchun.net/?url=http://www.yublogs.com/" rel="external nofollow" class="url">yuchaopeng</a></strong> <span class="commentmetadata"><a class="comment-reply-link" href="/105.html?replytocom=124#respond" onclick="return addComment.moveForm(&quot;div-comment-124&quot;, &quot;124&quot;, &quot;respond&quot;, &quot;105&quot;)">[回复]</a></span></div>
	    		
		<span class="datetime">Post:2014-05-29 下午7:40 </span><div class="clear"></div> <p>支持博主，<br>
其实跟我们工作中一样，憋着一天什么都没折腾出来，也许就别人一句话就搞定了，<br>
我也经历过问别人和别人问的情况，<br>
所以交流最重要。</p>
  </div>
</li>	</ol>
<div class="navigation">
		<div class="page_navi"></div>
	</div>
	<div id="respond_box">
	<div id="respond">
		<h3>发表评论</h3>	
		<div class="b2"></div>
		<div class="jiange2"></div>
		<div class="cancel-comment-reply">
		<div id="real-avatar">
			<img alt="" src="http://0.gravatar.com/avatar/?d=wavatar&amp;s=40" class="avatar avatar-40 photo avatar-default" height="40" width="40">	</div>	
			<a rel="nofollow" id="cancel-comment-reply-link" href="/105.html#respond" style="display:none;">点击这里取消回复。</a>		</div>
		    <form action="http://www.muchun.net/wp-comments-post.php" method="post" id="commentform">
      		<div id="comment-author-info">
		<p>
			<input type="text" name="author" id="author" class="commenttext" value="" size="22" tabindex="1">
			<label for="author">昵称(必填)</label>
		</p>
		<p>
			<input type="text" name="email" id="email" class="commenttext" value="" size="22" tabindex="2">
			<label for="email">邮箱</label>
		</p>
		<p>
			<input type="text" name="url" id="url" class="commenttext" value="" size="22" tabindex="3">
			<label for="url">网址</label>
		</p>
	</div>
            <div class="clear"></div>
      <p><script type="text/javascript" language="javascript">
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
<br></p>
	    <div id="post-comment-text">
		<p><textarea name="w" id="comment" tabindex="4"></textarea><div id="loading" style="display: none;"><img src="http://www.muchun.net/wp-admin/images/wpspin_light.gif" style="vertical-align:middle;" alt=""> 正在提交, 请稍候...</div><div id="error" style="display: none;">#</div><textarea name="comment" cols="100%" rows="4" style="display:none"></textarea></p>
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