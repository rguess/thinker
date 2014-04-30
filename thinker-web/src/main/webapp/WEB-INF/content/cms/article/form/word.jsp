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
		</div>
	</div>
	<div class="form-actions">
		<button type="submit" class="btn blue">提交</button>
		<a class='btn' href="${header.Referer }">返回</a>
	</div>
</form>