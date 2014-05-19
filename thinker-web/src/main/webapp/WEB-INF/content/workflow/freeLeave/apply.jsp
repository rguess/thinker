<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>发起自由流程</title>
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
<script type="text/javascript">
	$(function(){
		App.activeMenu("workflow/process");
	});
</script>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="自由流"
				pageTitleContent="工作流程-自由流-发起流程" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>请填写表单
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> 
								<a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx }/workflow/freeLeave/start" class="form-horizontal form_sync" method="post" id="form1">
								<div class="control-group">
                                   <label class="control-label">提交到</label>
                                   <div class="controls">
                                      <select class="medium m-wrap" tabindex="1" name="approvalUser">
                                      	<c:forEach var="user" items="${users }">
                                      		<option value="${user.loginId }">${user.name }</option>
                                      	</c:forEach>
                                      </select>
                                   </div>
                                </div>
								<div class="control-group">
									<label class="control-label">原因:</label>
									<div class="controls">
										<textarea rows="3" cols="6" class="span6 m-wrap" name="reason"></textarea>
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
</body>
</html>