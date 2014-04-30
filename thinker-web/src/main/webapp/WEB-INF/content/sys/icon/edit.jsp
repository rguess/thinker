<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="page" />
<c:set var="pageTitle" value="${empty obj ? '添加图标':'修改图标' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="系统管理-图标管理-${pageTitle }" titleIcon="icon-home" />
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
							<form action="${ctx }/sys/icon/edit" class="form-horizontal form_sync"
								method="post" id="form1">
								<!-- 角色ID -->
								<input type="hidden" value="${obj.id }" name="id">
								<div class="control-group">
									<label class="control-label">标识符 :</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="mark" value="${obj.mark }" />
									</div>
								</div>
								<!-- 名称 -->
								<div class="control-group">
									<label class="control-label">类型:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="type" value="${obj.type }" />
									</div>
								</div>
								<!-- 备注 -->
								<div class="control-group">
									<label class="control-label">描述:</label>
									<div class="controls">
										<textarea rows="3" cols="6" class="span6 m-wrap" name="remark">${obj.description }</textarea>
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
<script type="text/javascript">
	$(function(){
		App.activeMenu("sys/icon/list");
	});
</script>
</body>
</html>