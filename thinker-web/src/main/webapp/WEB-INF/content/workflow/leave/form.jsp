<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<div class="control-group">
	<label class="control-label">请假类型：</label>
	<div class="controls">
		<label class="radio"> <input type="radio" name="leaveType" value="调休" /> 调休 </label>
		<label class="radio"> <input type="radio" name="leaveType" value="事假" checked="checked"/> 事假 </label>
		<label class="radio"> <input type="radio" name="leaveType" value="霸王假" /> 霸王假 </label>
	</div>
</div>

<div class="control-group">
	<label class="control-label">开始日期：</label>
	<div class="controls">
		<div class="input-append date form_datetime" data-date-format="yyyy-mm-dd hh:ii">
			<input class="m-wrap" id="startTime" name="startTime"
				type="text" validate="{required:true}" readonly="readonly">
			<span class="add-on">
				<i class="icon-th"></i>
			</span>
		</div>
	</div>
</div>

<div class="control-group">
	<label class="control-label">结束日期：</label>
	<div class="controls">
		<div class="input-append date form_datetime" data-date-format="yyyy-mm-dd hh:ii">
			<input class="m-wrap" id="endTime" name="endTime" type="text"
				validate="{required:true}" readonly="readonly"> 
			<span class="add-on"> <i class="icon-th"></i> </span>
		</div>
	</div>
</div>

<div class="control-group">
	<label class="control-label">请假天数：</label>
	<div class="controls">
		<input type="text" id="leaveDays" 
			class="m-wrap span6" 
			name="leaveDays"
			validate="{required:true,number:true}"
			id="leaveDays">
	</div>
</div>

<div class="control-group">
	<label class="control-label">上传文件</label>
	<div class="controls">
		<div class="fileupload fileupload-new" data-provides="fileupload">
		   <span class="btn btn-file">
			   <span class="fileupload-new">选择</span>
			   <span class="fileupload-exists">修改</span>
			   <input type="file" class="default" name="leavefile" validate="{required:true}"/>
		   </span>
		   <span class="fileupload-preview"></span>
		   <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none"></a>
	   </div>
	</div>
</div>

<div class="control-group">
	<label class="control-label">原因:</label>
	<div class="controls">
		<textarea rows="3" cols="6" 
			class="span6 m-wrap" 
			name="reason"
			validate="{required:true}"
			id="reason"></textarea>
	</div>
</div>