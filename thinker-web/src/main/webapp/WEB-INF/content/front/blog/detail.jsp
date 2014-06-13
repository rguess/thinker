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
<title>${obj.title }|rguess's 博客</title>
<meta name="decorator" content="cms_blog"/>
<link href="${ctx }/assets/comp/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.c_s_face{
		display: none;
		position: absolute;
		z-index: 20000;
		padding: 2px;
		border: 1px solid rgb(221, 221, 221);
		background: rgb(255, 255, 255);
	}
	.c_s_face img{
		cursor: pointer;
	}
	.c_s_face img.hover{
		border: 1px solid red;
	}
</style>
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
				<a href="http://www.rguess.com/blog/article/${obj.id}.html" title="${obj.title }">http://www.rguess.com/blog/article/${obj.id}.html</a>
			</p>
		</div>
		<!-- 评论 -->
		<div class="jiange2"></div>
		<h3 id="comments" class="mtitle">${obj.title }：目前有${fn:length(obj.comments)} 条留言</h3>
		<div class="b2"></div>
		<ol class="commentlist">
			<c:forEach var="item" items="${obj.comments }" varStatus="status">
				<li class="comment even thread-even depth-1" id="comment-${item.id }">
					<div id="comment-${item.id }" class="comment-body">
						<div class="comment-author vcard">
							<img alt="" src="${ctx }${item.headPath}" class="avatar avatar-40 photo avatar-default" height="40" width="40">
							<div class="floor">${status.index +1}楼</div>
							<strong>${item.name }</strong>
						</div>		
						<span class="datetime">Post:${item.createDate } </span><div class="clear"></div>
						<p>${item.content }</p>
				  </div>
				</li>
			</c:forEach>
		</ol>
		<div id="respond_box">
			<div id="respond">
				<h3>发表评论</h3>	
				<div class="b2"></div>
				<div class="jiange2"></div>
				<div class="cancel-comment-reply">
					<div id="real-avatar" onmouseover="javascript:showFaces();" onmouseout="javascript:hideFaces();" style="cursor: pointer;">
						<img id="sub_face" alt="" 
							src="${ctx }/assets/img/face/1.png"
							class="avatar avatar-40 photo avatar-default" 
							height="40" width="40">
						<!-- 选择图片区div -->
						<div class="c_s_face" id="faces">
							<div>
								<img src="${ctx }/assets/img/face/1.png" height="40" width="40">
								<img src="${ctx }/assets/img/face/2.png" height="40" width="40">
								<img src="${ctx }/assets/img/face/3.png" height="40" width="40">
								<img src="${ctx }/assets/img/face/4.png" height="40" width="40">
								<img src="${ctx }/assets/img/face/5.png" height="40" width="40">
								<img src="${ctx }/assets/img/face/6.png" height="40" width="40">
							</div>
							<div style="margin-top: 2px">
								<img src="${ctx }/assets/img/face/7.png" height="40" width="40">
								<img src="${ctx }/assets/img/face/8.png" height="40" width="40">
								<img src="${ctx }/assets/img/face/9.png" height="40" width="40">
								<img src="${ctx }/assets/img/face/10.png" height="40" width="40">
								<img src="${ctx }/assets/img/face/11.png" height="40" width="40">
								<img src="${ctx }/assets/img/face/12.png" height="40" width="40">
							</div>
						</div>
					</div>
					<a rel="nofollow" id="cancel-comment-reply-link" href="/105.html#respond" style="display:none;">点击这里取消回复。</a>
				</div>
		    	<form action="${ctx }/blog/comment" method="post" id="commentform" onsubmit="return validate();">
		    		<input type="hidden" name="article.id" value="${obj.id }">
		    		<input id="face_path" type="hidden" name="headPath" value="${ctx }/assets/img/face/1.png">
      				<div id="comment-author-info">
						<p>
							<input type="text" name="name" class="commenttext" value="" size="22" tabindex="1" id="c_name">
							<label for="author">昵称(必填)</label>
						</p>
						<p>
							<input type="text" name="email" class="commenttext" value="" size="22" tabindex="2">
							<label for="email">邮箱</label>
							<!-- <label for="email" style="color: red">注：请填写真实邮箱，可显示您在gravatar.com注册的全球统一头像</label> -->
						</p>
						<p>
							<input type="text" name="url" class="commenttext" value="" size="22" tabindex="3">
							<label for="url">网址</label>
						</p>
					</div>
            		<div class="clear"></div>
				    <div id="post-comment-text">
						<textarea class="xheditor" name="content" id="ceditor" rows="12" cols="80" style="width: 100%"></textarea>
					</div>
		<p>
			<input class="submit" name="submit" type="submit" id="submit" tabindex="5" value="提交[Ctrl+Enter]">
			<input class="reset" name="reset" type="reset" id="reset" tabindex="6" value="重写">
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
			
			function isNotBlank(str){
				if(str == null || str == "" || typeof(str) == "undefined"){
					return false;
				}
				return true;
			}
			
			//提交前验证
			function validate(){
				var name = $("#c_name").val();
				if(!isNotBlank(name)){
					alert("请填写昵称！");
					return false;
				}
				
				var editor=$('#ceditor').xheditor();
				var content = editor.getSource();
				if(!isNotBlank(content)){
					alert("请填写内容！");
					return false;
				}
				
				return true;
			}
			
			$(function(){
				face();
				bindSelFaceE();
			})
			
			function face(){
				var r = parseInt(Math.random()*12)+1;
				var img = "${ctx}/assets/img/face/"+r+".png";
				var path = "/assets/img/face/"+r+".png";
				$("#sub_face").attr("src",img);
				$("#face_path").val(path);
			}
			
			//显示选择头像框
			function showFaces(){
				var top = $("#sub_face").position().top+40;
				var left = $("#sub_face").position().left
				$("#faces").css({"left":left+"px","top":top+"px"});
				$("#faces").show();
			}
			
			//隐藏选择头像框
			function hideFaces(){
				$("#faces").hide();
			}
			
			//绑定选择头像时间
			function bindSelFaceE(){
				$("#faces img").mouseover(function(){
					$(this).addClass("hover");
				}).mouseout(function(){
					$(this).removeClass("hover");
				}).click(function(){
					var path = $(this).attr("src").replace(new RegExp("${ctx}","gm"),"");
					$("#sub_face").attr("src",$(this).attr("src"));
					$("#face_path").val(path);
					$("#faces").hide();
				})
			}
		</script>
		    </form>

		<div class="clear"></div>
      	</div>
  </div>
  <div class="clear"></div>
	</div>
	
<script type="text/javascript" src="${ctx }/assets/comp/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
<script type="text/javascript" src="${ctx }/assets/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx }/assets/comp/xheditor/xheditor-1.2.1.min.js"></script>
<script type="text/javascript" src="${ctx }/assets/comp/xheditor/xheditor_lang/zh-cn.js"></script>
<script type="text/javascript">
	SyntaxHighlighter.all();
</script>
</body>
</html>