/**
 * 文件上传 jquery file-upload
 */
$(function() {
	
	$('#fileupload').fileupload({
		url : ctx + "/file/upload"
	});
});
