<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>部门经理审批</title>
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
<script src="${ctx}/assets/js/workflow/leave.js"></script>
<script type="text/javascript">

	var taskId = "${taskId}";
	
	$(function(){
		App.activeMenu("workflow/todoTasks");
		Leave.init({taskId:taskId});
	});
	
</script>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="部门经理审批"
				pageTitleContent="工作流程-请假-部门经理审批" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>审批
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<div class="form-horizontal form-view">
								<%@ include file="/WEB-INF/content/workflow/leave/formDetail.jsp"%>
							</div>
							<form action="${ctx }/workflow/leave/deptLeaderAudit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="" name="leaveId" id="leaveId">
								<input type="hidden" value="${taskId }" name="taskId">
								<div class="control-group">
									<label class="control-label">审批意见:</label>
									<div class="controls">
										<textarea rows="3" cols="6" class="span6 m-wrap" 
											validate="{required:true}"
											name="depAuditOpinion" id="depAuditOpinion"></textarea>
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" class="btn blue" name="deptLeaderPass" value="true">同意申请</button>
									<button type="submit" class="btn red" name="deptLeaderPass" value="false">驳回请求</button>
									<a class='btn purple' href="${header.Referer }">返回</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>