<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="page" />
<html>
<head>
<title>消息推送</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="终端服务"
				pageTitleContent="终端服务-消息推送-消息推送" titleIcon="icon-home" />
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
							<form action="${ctx }/mobile/push" class="form-horizontal"
								method="post" id="form1">
								<div class="control-group">
									<label class="control-label">标题:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}" name="title" />
									</div>
								</div>
								<!-- 备注 -->
								<div class="control-group">
									<label class="control-label">内容:</label>
									<div class="controls">
										<textarea rows="5" cols="6" class="span6 m-wrap" validate="{required:true}" name="content"></textarea>
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
		App.activeMenu("/mobile/push");
		App.initAsyncFormValidate("#form1",formSubmitCallback);
	});
	
	function formSubmitCallback(data){
		if(data == "success"){
			bootbox.alert("推送成功！");
		};
	}
</script>
</body>
</html>