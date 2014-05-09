<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<form action="${ctx }/cms/article/edit" class="form-horizontal form_sync" method="post" id="form1" enctype="multipart/form-data">
	<%@ include file="/WEB-INF/content/cms/article/form/inputs.jsp"%>
	<div class="control-group" id="word_comment">
		<input type="hidden" name="isWord" value="0">
		<label class="control-label">${empty obj ?'上传文件':'重新上传'}</label>
		<div class="controls">
			<div class="fileupload fileupload-new" data-provides="fileupload">
			   <span class="btn btn-file">
				   <span class="fileupload-new">选择</span>
				   <span class="fileupload-exists">修改</span>
				   <input type="hidden" value="${obj.htmlid }" name="htmlid">
				   <input type="file" class="default" name="articleFile"
				   ${empty obj ?'validate="{required:true}"':''}
				   />
			   </span>
			   <span class="fileupload-preview"></span>
			   <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none"></a>
			   <c:if test="${not empty obj }">
			   <label generated="true" class="error help-inline" style="color: rgb(185, 74, 72)">注：重新上传会覆盖原来上传的内容</label>
			   </c:if>
		   </div>
		</div>
	</div>
	<div class="form-actions">
		<button type="submit" class="btn blue">提交</button>
		<a class='btn' href="${header.Referer }">返回</a>
	</div>
</form>