<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function(){
		<c:if test="${not empty obj }">
			$("select[name=color] option[value=${obj.color}]").attr("checked","checked");
		</c:if>
	});
</script>
<!--ID -->
<input type="hidden" value="${obj.id }" name="id">
<input type="hidden" value="${obj.category.id }" name="category.id" id="caId">
<div class="control-group">
	<label class="control-label">标题:</label>
	<div class="controls">
		<input type="text" class="span6 m-wrap"
			validate="{required:true,minlength:2,maxlength:40}" name="title"
			value="${obj.title }" />
	</div>
</div>
<div class="control-group">
	<label class="control-label">栏目:</label>
	<div class="controls">
		<input type="text" class="span6 m-wrap"
			validate="{required:true,minlength:2,maxlength:10}" 
			value="${obj.category.name }" onfocus="showCaTree()" id="caName"/>
	</div>
</div>
<div class="control-group">
	<label class="control-label">标题颜色:</label>
	<div class="controls">
		<select class="medium m-wrap" tabindex="1" name="color">
			<option value="black">黑色</option>
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
		<input type="text" class="span6 m-wrap tags" name="keywords" value="${obj.keywords }" />
	</div>
</div>
<div class="control-group">
	<label class="control-label">描述、摘要:</label>
	<div class="controls">
		<textarea rows="3" cols="6" class="span6 m-wrap" name="description">${obj.description }</textarea>
	</div>
</div>


