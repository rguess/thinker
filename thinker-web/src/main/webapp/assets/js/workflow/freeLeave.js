var FreeLeave = {
	init : function(params){
		blockUI();
		$.ajax({
			type : "GET",
			url : ctx+"/workflow/freeLeave/showByTaskId",
			data :{taskId:params.taskId},
			success : function(data){
				unBlockUI();
				$("#sponsor").html(data.sponsor);
				$("#leaveReason").html(data.reason);
			},
			error : function(error) {
				unBlockUI();
			}
		});
		FreeLeave.initUserSelects();
	},
	initUserSelects : function(){
		$.ajax({
			type : "GET",
			url : ctx+"/sys/user/getAllUsers",
			success : function(data){
				$.each(data,function(i,item){
					$("#approcalUsers").append($("<option value='"+item.loginId+"'>"+item.name+"</option>"))
				});
			},
			error : function(error) {
			}
		});
	}
};



















