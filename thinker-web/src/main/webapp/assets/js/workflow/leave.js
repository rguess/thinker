var Leave = {
	init : function(params){
		blockUI();
		$.ajax({
			type : "GET",
			url : ctx+"/workflow/leave/showByTaskId",
			data :{taskId:params.taskId},
			success : function(data){
				$("#sponsor").html(data.userName);
				$("#leaveType").html(data.leave.leaveType);
				$("#startTime").html(new Date(data.leave.startTime).format("yyyy-MM-dd hh:mm"));
				$("#endTime").html(new Date(data.leave.endTime).format("yyyy-MM-dd hh:mm"));
				$("#leaveDays").html(data.leave.leaveDays);
				$("#leaveReason").html(data.leave.reason);
				$("#leaveId").val(data.leave.id);
				$("#depAuditOpinion").val(data.leave.depAuditOpinion);
				$("#hrAuditOpinion").val(data.leave.hrAuditOpinion);
				$("#leavefile").html($("<a onclick='javascript:App.downloadFile(\""+data.leave.fileName+"\",\""+data.leave.fileId+"\")' href='javascript:void(0)'>"+data.leave.fileName+"</a>"));
				if(App.isNundef(params.otherCallback)){
					params.otherCallback(data);
				}
				unBlockUI();
			},
			error : function(error) {
				unBlockUI();
			}
		});
	},
	
	modifyInit : function(taskId){
		blockUI();
		$.ajax({
			type : "GET",
			url : ctx+"/workflow/leave/showByTaskId",
			data :{taskId:taskId},
			success : function(data){
				var leave = data.leave;
				if(!App.isNundef(data.leave)){
					unBlockUI();
					return;
				}
				var $radio = $("input:radio[name=leaveType][value="+leave.leaveType+"]");
				var $radios = $("input:radio[name=leaveType]");
				$radios.removeAttr("checked").parent().removeClass("checked");
				$radio.attr("checked","checked").parent().addClass("checked");
				$("input:radio[name=leaveType][value="+leave.leaveType+"]").attr("checked","checked").parent().addClass("checked");
				$("#startTime").val(new Date(leave.startTime).format("yyyy-MM-dd hh:mm"));
				$("#endTime").val(new Date(leave.endTime).format("yyyy-MM-dd hh:mm"));
				$("#leaveDays").val(leave.leaveDays);
				$("#reason").val(leave.reason);
				$("#depAuditOpinion").val(leave.depAuditOpinion);
				$("#hrAuditOpinion").val(leave.hrAuditOpinion);
				$("#processInstanceId").val(leave.processInstanceId);
				$("#leaveId").val(leave.id);
				unBlockUI();
			},
			error : function(error) {
				unBlockUI();
			}
		});
	}
};



















