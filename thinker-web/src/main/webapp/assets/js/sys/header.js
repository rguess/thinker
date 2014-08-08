var Header = {
	changeSite : function(name){
		blockUI();
		$.ajax({
			type : "GET",
			url : ctx+"/cms/site/changeSite",
			data :{name:name},
			success : function(data){
				window.location.reload();
			},
			error : function(error) {
				unBlockUI();
			}
		});
	},
	tips : function(){
		alert("还没做0.0!");
	}
}