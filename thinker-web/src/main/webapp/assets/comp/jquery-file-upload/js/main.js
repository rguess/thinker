/**
 * 文件上传 jquery file-upload
 */
$(function() {
	
	$('#fileupload').fileupload({
		url : ctx + "/file/upload"
		/*done: function (e, data) {
			$(this).fileupload('option', 'done')
            	.call(this, null, {result: data.result});
		}*/
	});
});
