<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加文章':'修改文章' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
<style type="text/css">
	.navbar-fixed-top{
		z-index: 1000;
	}
</style>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="cms-文章管理-${pageTitle }" titleIcon="diy_icon_01_46" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>请填写表单
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<div class="tabbable tabbable-custom">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#tab_1_1" data-toggle="tab" id="word_type">上传word方式</a></li>
									<li><a href="#tab_1_1" data-toggle="tab" id="ueditor_type">富文本方式</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tab_1_1">
										<form action="${ctx }/cms/article/edit" class="form-horizontal" method="post" id="form1" enctype="multipart/form-data">
											<!--ID -->
											<input type="hidden" value="${obj.id }" name="id">
											<!-- 用户创建日期 -->
											<c:if test="${not empty obj }">
												<input type="hidden" value="<fmt:formatDate value='${obj.createDate }'/>" name="createDate">
											</c:if>
											<div class="control-group">
												<label class="control-label">标题:</label>
												<div class="controls">
													<input type="text" class="span6 m-wrap"
														validate="{required:true,minlength:2,maxlength:10}"
														name="title" value="${obj.title }" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">标题颜色:</label>
												<div class="controls">
													<select class="medium m-wrap" tabindex="1" name="color">
				                                      	<option value="red">红色</option>
				                                      	<option value="green">绿色</option>
				                                      	<option value="blue">蓝色</option>
				                                      	<option value="yellow">黄色</option>
				                                      	<option value="orange">橙色</option>
				                                    </select>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">关键字:</label>
												<div class="controls">
													<input type="text" class="span6 m-wrap"
														name="keywords" value="${obj.keywords }" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">描述、摘要:</label>
												<div class="controls">
													<textarea rows="3" cols="6" class="span6 m-wrap" name="description">${obj.description }</textarea>
												</div>
											</div>
											<div id="add_article_type">
												
											</div>
											<div class="form-actions">
												<button type="submit" class="btn blue">提交</button>
												<a class='btn' href="${header.Referer }">返回</a>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/cms/article/form/word.jsp"%>
<%@ include file="/WEB-INF/content/cms/article/form/ueditor.jsp"%>

<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/bootstrap-fileupload.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/ueditor.jsp"%>
<script type="text/javascript" src="${ctx }/assets/js/cms/article.js"></script>
<script type="text/javascript">
	$(function(){
		App.activeMenu("cms/article/list");
		Article.init();
	});
</script>
</body>
</html>