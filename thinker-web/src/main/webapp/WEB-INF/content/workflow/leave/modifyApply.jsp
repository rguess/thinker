<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>调整请假申请</title>
<%@ include file="/WEB-INF/content/common/plugins/datepicker.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/bootstrap-fileupload.jsp"%>
<script src="${ctx}/assets/js/workflow/leave.js"></script>
<script type="text/javascript">
	var taskId = "${taskId}";
	$(function(){
		App.activeMenu("workflow/todoTasks");
		Leave.modifyInit(taskId);
	});
</script>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="请假"
				pageTitleContent="工作流程-请假" titleIcon="icon-home" />
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
							<form action="${ctx }/workflow/leave/modifyApply" class="form-horizontal form_sync" method="post" id="form1">
								<%@ include file="/WEB-INF/content/workflow/leave/form.jsp" %>
								<input type="hidden" value="" name="id" id="leaveId">
								<input type="hidden" value="${taskId }" name="taskId">
								<input type="hidden" value="" name="processInstanceId" id="processInstanceId">
								<div class="control-group">
									<label class="control-label">部门经理审批意见:</label>
									<div class="controls">
										<textarea rows="3" cols="6" class="span6 m-wrap" name="depAuditOpinion" id="depAuditOpinion" readonly="readonly"></textarea>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">人力审批意见:</label>
									<div class="controls">
										<textarea rows="3" cols="6" class="span6 m-wrap" name="hrAuditOpinion" id="hrAuditOpinion" readonly="readonly"></textarea>
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" class="btn blue" name="reApply" value="true">重新申请</button>
									<button type="submit" class="btn red" name="reApply" value="false">结束流程</button>
									<a class='btn' href="${header.Referer }">返回</a>
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