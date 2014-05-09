(function ($) {
	
	/**
	 * 展示流程图
	 */
	$.fn.initFlowChart = function(pid){
		var $this = $(this);
		var imageUrl = ctx + "/workflow/process/trace/auto/"+pid;
//	    var imageUrl = ctx + "/workflow/resource/process-instance?pid=" + pid + "&type=image";
	    $this.find(".portlet-body").html($("<img src='" + imageUrl + "'/>"));
	};
	
	$.fn.showFlowChart = function (pid){
		var $this = $(this);
		blockUI();
		$this.initFlowChart(pid);
		$this.find(".portlet-body img").load(function(){
			$this.show().center().move();
			unBlockUI();
		});
	};
	
})(jQuery);

/**
 * 我的流程
 */
var MyProcess = {
		
	init : function(){
		MyProcess.initRunningData();
		$("#runingTab,#hisTab").click(function(){
			if($(this).parent().hasClass("active")){
				return;
			}
			var $obj = $(this);
			var id = $obj.attr("id");
			Page.clear();
			if(id == "runingTab"){
				MyProcess.initRunningData();
			}else if(id == "hisTab"){
				MyProcess.initHisData();
			}
		});
	},
	
	/**
	 * 初始化运行中数据
	 */
	initRunningData : function(){
		Page.initData(
			{
				url:ctx+"/workflow/myprocess/page/running",
				pageNo : 1,
				pageSize : 10,
				tableId : "#sample_1"
			},
			null,
			[{cName:"definitionName",cValue:"流程名称 ",noSort:true},
			 {cName:"taskname",cValue:"当前节点 ",noSort:true,format:function(i,value,item){
				 return $("<a href='javascript:void(0)' class='tooltips' data-original-title='点击查看流程图' data-placement='right' onclick='$(\"#rcs\").showFlowChart("+item.instanceId+")'>"+value+"</a>");
			 }},
			 {cName:"definitionKey",cValue:"key",noSort:true},
			 {cName:"instanceId",cValue:"实例ID",noSort:true},
			 {cName:"definitionVersion",cValue:"版本号",noSort:true}
			 ]
		);
	},
	
	/**
	 * 初始化已结束数据
	 */
	initHisData : function(){
		Page.initData(
			{
				url:ctx+"/workflow/myprocess/page/his",
				pageNo : 1,
				pageSize : 10,
				tableId : "#sample_1"
			},
			null,
			[{cName:"definitionName",cValue:"流程名称 ",noSort:true},
			 {cName:"definitionKey",cValue:"key",noSort:true},
			 {cName:"instanceId",cValue:"实例ID",noSort:true},
			 {cName:"definitionVersion",cValue:"版本号",noSort:true}
			 ]
		);
	}
};


var TodoTasks = {
	
	init : function(){
		Page.initData(
			{
				url:ctx+"/workflow/todoTasks/page",
				pageNo : 1,
				pageSize : 100,
				tableId : "#sample_1"
			},
			null,
			[
			 //{cName:"id",cValue:"任务ID ",noSort:true},
			 {cName:"definitionName",cValue:"流程名称",noSort:true},
			 {cName:"sponsor",cValue:"发起人",noSort:true},
			 //{cName:"taskKey",cValue:"任务Key",noSort:true},
			 {cName:"taskName",cValue:"任务名称",noSort:true,format:function(i,value,item){
				 return $("<a href='javascript:void(0)' class='tooltips' data-original-title='点击查看流程图' data-placement='right' onclick='$(\"#rcs\").showFlowChart("+item.processInstanceId+")'>"+value+"</a>");
			 }},
			 //{cName:"processDefinitionId",cValue:"流程定义ID",noSort:true},
			 //{cName:"processInstanceId",cValue:"流程实例ID",noSort:true},
			 //{cName:"priority",cValue:"优先级",noSort:true},
			 {cName:"createTime",cValue:"任务创建日期",noSort:true},
			 {cName:"dueDate",cValue:"任务逾期日",noSort:true},
			 //{cName:"description",cValue:"任务描述",noSort:true},
			 //{cName:"owner",cValue:"任务所属人",noSort:true},
			 {cName:"oper",cValue:"操作",noSort:true,format:function(i,value,item){
				 if(null == item.assignee){
					 return TodoTasks.operBtn(0,{taskId : item.id,definitionKey : item.definitionKey , taskKey : item.taskKey});
				 }
				 return TodoTasks.operBtn(1,{taskId : item.id,definitionKey : item.definitionKey , taskKey : item.taskKey});
			 }}
			 ]
		);
	},
	
	//生成签收或办理操作按钮type:0:签收,1:办理
	operBtn : function (type,params){
		if(type == 0){
			return $("<a href='javascript:void(0)' "
						+"data-definition-key="+params.definitionKey+" "
						+"data-task-key="+params.taskKey+" "
						+"data-task-id="+params.taskId+" "
						+"onclick='javascript:TodoTasks.claim(this)'>签收</a>");
		}
		return $("<a href='javascript:void(0)' "
					+"data-definition-key="+params.definitionKey+" "
					+"data-task-key="+params.taskKey+" "
					+"data-task-id="+params.taskId+" "
					+"onclick='javascript:TodoTasks.handle(this)'>办理</a>");
	},
	
	//签收任务
	claim : function (obj){
			blockUI();
			$.ajax({
				type : "POST",
				url : ctx+"/workflow/task/claim/"+$(obj).attr("data-task-id"),
				success : function(data){
					unBlockUI();
					if(data == "success"){
						App.alert("签收成功！");
						$(obj).replaceWith(TodoTasks.operBtn(1,{taskId : $(obj).attr("data-task-id"),
													  definitionKey : $(obj).attr("data-definition-key"),
													  taskKey : $(obj).attr("data-task-key")}));
					}
				},
				error : function(error) {
					unBlockUI();
				}
			});
		},
		
	//办理
	handle : function (obj){
		window.location.href = ctx+"/workflow/task/handle/"+$(obj).attr("data-definition-key")+"/"+$(obj).attr("data-task-key")+"/"+$(obj).attr("data-task-id");
	}
}