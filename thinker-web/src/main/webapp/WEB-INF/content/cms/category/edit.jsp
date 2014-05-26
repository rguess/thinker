<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加栏目':'修改栏目' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<%@ include file="/WEB-INF/content/cms/category/tree.jsp" %>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="内容管理-栏目管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>请填写表单
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx }/cms/category/edit" class="form-horizontal form_sync"
								method="post" id="form1">
								<!-- 栏目ID -->
								<input type="hidden" value="${obj.id }" name="id">
								<c:if test="${not empty obj }">
								<input type="hidden" value="${obj.orderNo }" name="orderNo">
								</c:if>
								<input type="hidden" value="${obj.parent.id }" name="parent.id" id="parentId">
								
								<div class="control-group">
									<label class="control-label">名称:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true,minlength:2,maxlength:10}"
											name="name" value="${obj.name }" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">上级栏目：</label>
									<div class="controls">
										<input id="parentName" type="text" 
											validate="{required:true}"
											class="span6 m-wrap" 
											value="${obj.parent.name }" 
											onfocus="javascript:showTree();"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">栏目类型:</label>
									<div class="controls">
										<select class="medium m-wrap" tabindex="1" name="module">
							              	<option value="article">文章</option>
							               	<option value="picture">图片</option>
							               	<option value="download">下载</option>
							               	<option value="link">链接</option>
							               	<option value="special">专题</option>
							             </select>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">链接:</label>
									<div class="controls">
										<input type="text"
											name="url"
											validate="{url:true}"
											class="span6 m-wrap" 
											value="${obj.url }"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">是否显示：</label>
									<div class="controls">
										<label class="radio"> <input type="radio" name="isShow" value="0"  checked="checked"/>显示 </label>
										<label class="radio"> <input type="radio" name="isShow" value="1"/>隐藏 </label>
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
								
								<div class="form-actions">
									<button type="submit" class="btn blue">提交</button>
									<a class='btn' href="${header.Referer }">返回</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/bootstrap-tree.jsp"%>
<script type="text/javascript">

	$(function(){
		App.activeMenu("cms/category/list");
		<c:if test="${not empty obj }">
			initIsShowRadio();
			initIsShowRadio();
		</c:if>
	});
	
	function showTree(){
		$("#caTree").modal();
	}
	
	function selCategory(){
		
		$obj = $("#tree_1").find("a.selected:first");
		
		$('#caTree').modal('hide');
		
		$('#parentName').val($obj.text());
		$('#parentId').val($obj.attr("data-id"));
	}
	
	//初始化是否显示radio
	function initIsShowRadio(){
		var isShow = "${obj.isShow}"
		var $radio = $("input:radio[name=isShow][value="+isShow+"]");
		var $radios = $("input:radio[name=isShow]");
		$radios.removeAttr("checked").parent().removeClass("checked");
		$radio.attr("checked","checked").parent().addClass("checked");
		$("input:radio[name=leaveType][value="+isShow+"]").attr("checked","checked").parent().addClass("checked");
	}
	//初始化栏目类型类型
	function initIsShowRadio(){
		var module = "${obj.module}"
		$("select[name=module] option[value="+module+"]").attr("selected",true);
	}
</script>
</body>
</html>