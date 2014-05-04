<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<form action="${ctx }/cms/article/edit" class="form-horizontal form_sync" method="post" id="form1" enctype="multipart/form-data">
	<%@ include file="/WEB-INF/content/cms/article/form/inputs.jsp"%>
	<div class="control-group" id="word_comment">
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
		   <span style="color: red;margin-left: 5px">sssss</span><a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none"></a>
		</div>
	</div>
	<div class="form-actions">
		<button type="submit" class="btn blue">提交</button>
		<a class='btn' href="${header.Referer }">返回</a>
	</div>
</form>