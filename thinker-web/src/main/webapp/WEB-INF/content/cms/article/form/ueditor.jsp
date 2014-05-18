<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<form action="${ctx }/cms/article/edit" class="form-horizontal form_sync" method="post" id="form1" enctype="multipart/form-data">
	<%@ include file="/WEB-INF/content/cms/article/form/inputs.jsp"%>
	<div class="control-group" id="ueditor_comment">
		<input type="hidden" name="isWord" value="1">
		<label class="control-label">正文内容：</label>
		<div class="controls">
			<script id="ueditor" type="text/plain" name="content" style="width: 90%">${obj.content}</script>
		</div>
	</div>
	<div class="form-actions">
		<button type="submit" class="btn blue">提交</button>
		<a class='btn' href="${header.Referer }">返回</a>
	</div>
</form>