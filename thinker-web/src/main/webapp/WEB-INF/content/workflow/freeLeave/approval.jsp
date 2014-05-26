<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>自由流审批</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="自由流"
				pageTitleContent="工作流程-自由流-审批" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>审批
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> 
								<a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<div class="form-horizontal form-view">
								<h3></h3>
								<div class="span12">
									<div class="control-group">
										<label class="control-label">流程发起人：</label>
										<div class="controls">
											<span class="text" id="sponsor"></span>
										</div>
									</div>
								</div>
								<div class="span12">
									<div class="control-group">
										<label class="control-label">原因：</label>
										<div class="controls">
											<span class="text" id="leaveReason"></span>
										</div>
									</div>
								</div>
							</div>
							<form action="${ctx }/workflow/freeLeave/complete" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${taskId }" name="taskId">
								<div class="control-group">
                                   <label class="control-label">提交到:</label>
                                   <div class="controls">
                                      <select class="medium m-wrap" tabindex="1" name="approvalUser" id="approcalUsers">
                                      	
                                      </select>
                                   </div>
                                </div>
								<div class="control-group">
									<label class="control-label">审批意见:</label>
									<div class="controls">
										<textarea rows="3" cols="6" 
											class="span6 m-wrap"
											validate="{required:true}"
											name="auditOpinion"></textarea>
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" name="handle" class="btn blue" value="agree">同意</button>
									<button type="submit" name="handle" class="btn green" value="agreeAndEnd">同意并结束</button>
									<button type="submit" name="handle" class="btn red" value="reject">驳回请求</button>
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
<script src="${ctx}/assets/js/workflow/freeLeave.js"></script>
<script type="text/javascript">
	$(function(){
		App.activeMenu("workflow/todoTasks");
		FreeLeave.init({taskId:taskId});
	});
	var taskId = "${taskId}";
</script>
</body>
</html>