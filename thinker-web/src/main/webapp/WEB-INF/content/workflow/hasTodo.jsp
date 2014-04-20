<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>已办任务</title>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	
	App.activeMenu("workflow/hasTodo");
	
	Page.initData(
		{
			url:"${ctx}/workflow/hasTodo/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
		 //{cName:"id",cValue:"任务ID ",noSort:true},
		 {cName:"definitionName",cValue:"流程名称",noSort:true},
		 {cName:"sponsor",cValue:"发起人",noSort:true},
		 //{cName:"taskKey",cValue:"任务Key",noSort:true},
		 {cName:"taskName",cValue:"任务名称",noSort:true},
		 //{cName:"processDefinitionId",cValue:"流程定义ID",noSort:true},
		 //{cName:"processInstanceId",cValue:"流程实例ID",noSort:true},
		 //{cName:"priority",cValue:"优先级",noSort:true},
		 {cName:"startTime",cValue:"开始日期",noSort:true},
		 {cName:"endTime",cValue:"结束日期",noSort:true},
		 //{cName:"description",cValue:"任务描述",noSort:true},
		 //{cName:"owner",cValue:"任务所属人",noSort:true},
		 {cName:"oper",cValue:"操作",noSort:true,format:function(i,value,item){
			 return $("<a href='javascript:void(0)' onclick='javascript:alert(this)'>详细</a>");
		 }}
		 ]
	);
});
</script>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="图标列表" pageTitleContent="工作流程-已办" titleIcon="icon-home"/>
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
							<table class="table table-striped table-bordered table-hover" id="sample_1">
								
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>