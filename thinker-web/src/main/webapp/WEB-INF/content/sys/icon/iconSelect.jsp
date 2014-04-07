<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>

<style>
	.iconLink{
		margin-left: 3px
	}
</style>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type : "GET",
			url : ctx+"/sys/icon/listAll",
			success : function(data){
				$.each(data,function(i,icon){
					$("#iconsBody").append('<a href="javascript:void(0);" class="iconLink" title="'
						+icon.description+'" onclick="javascript:selIcon(\''+icon.mark+'\')"><i class="'
						+icon.mark+'"></i></a>');
				});
			}
		});
	});
</script>

<div id="icons" class="modal hide fade" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<h3>图标选择</h3>
	</div>
	<div class="modal-body" id="iconsBody"></div>
	<div class="modal-footer">
		<button type="button" class="btn red" data-dismiss="modal"
			aria-hidden="true">关闭</button>
	</div>
</div>
