<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<form action="${ctx }/cms/article/edit" class="form-horizontal form_sync" method="post" id="form1" enctype="multipart/form-data">
	<!--ID -->
	<input type="hidden" value="${obj.id }" name="id">
	<!-- 用户创建日期 -->
	<c:if test="${not empty obj }">
		<input type="hidden" value="<fmt:formatDate value='${obj.createDate }'/>" name="createDate">
	</c:if>
	<div class="control-group">
		<label class="control-label">标题:</label>
		<div class="controls">
			<input type="text" class="span6 m-wrap"
				validate="{required:true,minlength:2,maxlength:10}"
				name="title" value="${obj.title }" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">标题颜色:</label>
		<div class="controls">
			<select class="medium m-wrap" tabindex="1" name="color">
              	<option value="red">红色</option>
               	<option value="green">绿色</option>
               	<option value="blue">蓝色</option>
               	<option value="yellow">黄色</option>
               	<option value="orange">橙色</option>
             </select>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">关键字:</label>
		<div class="controls">
			<input type="text" class="span6 m-wrap"
				name="keywords" value="${obj.keywords }" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">描述、摘要:</label>
		<div class="controls">
			<textarea rows="3" cols="6" class="span6 m-wrap" name="description">${obj.description }</textarea>
		</div>
	</div>
	<div class="control-group" id="ueditor_comment">
		<input type="hidden" name="isWord" value="1">
		<label class="control-label">正文内容：</label>
		<div class="controls">
			<script id="ueditor" type="text/plain" name="content" style="width: 90%"></script>
		</div>
	</div>
	<div class="form-actions">
		<button type="submit" class="btn blue">提交</button>
		<a class='btn' href="${header.Referer }">返回</a>
	</div>
</form>


