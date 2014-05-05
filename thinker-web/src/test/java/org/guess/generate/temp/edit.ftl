<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${r"${empty obj ? '添加测试':'修改测试' }"}" scope="page" />
<html>
<head>
<title>${r"${pageTitle }"}</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${r"${pageTitle }"}"
				pageTitleContent="系统管理-测试管理-${r"${pageTitle }"}" titleIcon="icon-home" />
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
							<form action="${r"${ctx}"}/${moduleName}/${className}/edit" class="form-horizontal form_sync"
								method="post" id="form1">
								
								<input type="hidden" value="${r"${obj.id}"}" name="id">
								<#list fields as item>
								<div class="control-group">
									<label class="control-label">${item}:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="${item}" value="${r"$"}{obj.${item} }" />
									</div>
								</div>
								</#list>
								
								
								<div class="form-actions">
									<button type="submit" class="btn blue">提交</button>
									<a class='btn' href="${r"${header.Referer }"}">返回</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
<script type="text/javascript">
	$(function(){
		App.activeMenu("${moduleName}/${className}/list");
	});
</script>
</body>
</html>