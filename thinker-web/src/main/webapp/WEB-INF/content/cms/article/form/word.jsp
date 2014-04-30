<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div class="control-group" id="word_comment" style="display: none;">
	<input type="hidden" name="isWord" value="0">
	<label class="control-label">上传文件</label>
	<div class="controls">
		<div class="fileupload fileupload-new" data-provides="fileupload">
		   <span class="btn btn-file">
			   <span class="fileupload-new">选择</span>
			   <span class="fileupload-exists">修改</span>
			   <input type="file" class="default" name="articleFile" validate="{required:true}"/>
		   </span>
		   <span class="fileupload-preview"></span>
		   <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none"></a>
	   </div>
	</div>
</div>