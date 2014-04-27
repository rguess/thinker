<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加文章':'修改文章' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
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
								<div class="control-group">
									<label class="control-label">上传文件</label>
									<div class="controls">
										<div class="fileupload fileupload-new" data-provides="fileupload">
										   <span class="btn btn-file">
											   <span class="fileupload-new">选择</span>
											   <span class="fileupload-exists">修改</span>
											   <input type="file" class="default" name="articleFile" validate="{required:true}"/>
										   </span>
										   <span class="fileupload-preview"></span>
										   <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none"></a>
									   </div>
									</div>
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
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/bootstrap-fileupload.jsp"%>
<script type="text/javascript">
	$(function(){
		App.activeMenu("cms/article/list");
	});
</script>
</body>
</html>