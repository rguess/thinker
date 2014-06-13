<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加测试':'修改测试' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="系统管理-测试管理-${pageTitle }" titleIcon="icon-home" />
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
							<form action="${ctx}/cms/link/edit" class="form-horizontal form_sync"
								method="post" id="form1">
								
								<input type="hidden" value="${obj.id}" name="id">
								<input type="hidden" value="${obj.category.id }" name="category.id" id="caId">
								
								<div class="control-group">
									<label class="control-label">栏目:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true,minlength:2,maxlength:10}" 
											value="${obj.category.name }" onfocus="showCaTree()" id="caName"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">链接名称:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="title" value="${obj.title }" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">标题颜色:</label>
									<div class="controls">
										<select class="medium m-wrap" tabindex="1" name="color">
											<option value="black">黑色</option>
											<option value="red">红色</option>
											<option value="green">绿色</option>
											<option value="blue">蓝色</option>
											<option value="yellow">黄色</option>
											<option value="orange">橙色</option>
										</select>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">链接图片:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="image" value="${obj.image }" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">链接地址:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="href" value="${obj.href }" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">权重，越大越靠前:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="weight" value="${obj.weight }" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">过期时间</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											name="weightDate" value="${obj.weightDate }" />
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
<%@ include file="/WEB-INF/content/cms/category/tree.jsp" %>
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/bootstrap-tree.jsp"%>
<script type="text/javascript">
	$(function(){
		App.activeMenu("cms/");
		App.cancleActiveMenu("/cms/category/list");
		App.cancleActiveMenu("/cms/site/list");
		App.cancleActiveMenu("/cms/comment/list");
	});
	function showCaTree(){
		$("#caTree").modal();
	}
	function selCategory(obj){
		$obj = $("#tree_1").find("a.selected:first");
		$('#caTree').modal('hide');
		$('input[id=caName]').val($obj.text());
		$('input[id=caId]').val($obj.attr("data-id"));
	}
</script>
</body>
</html>