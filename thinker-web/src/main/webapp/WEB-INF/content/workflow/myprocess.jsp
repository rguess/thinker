<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>我的流程</title>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
<script type="text/javascript" src="${ctx}/assets/js/workflow/workflow.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	App.activeMenu("workflow/myprocess");
	MyProcess.init();
});

function show(pid){
	blockUI();
	$("#rcs").initFlowChart(pid);
	$("#rcs .portlet-body img").load(function(){
		$("#rcs").show().center().move();
		unBlockUI();
	})
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/content/workflow/flowChart.jsp" %>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="图标列表" pageTitleContent="工作流程-我的流程" titleIcon="icon-home"/>
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="icon-globe"></i>列表
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a><a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="tabbable tabbable-custom">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#tab_1_1" data-toggle="tab" id="runingTab">运行中</a></li>
									<li><a href="#tab_1_1" data-toggle="tab" id="hisTab">已结束</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tab_1_1">
										<table class="table table-striped table-bordered table-hover" id="sample_1">
									
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>