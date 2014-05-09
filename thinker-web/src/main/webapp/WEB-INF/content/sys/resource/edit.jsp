<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加资源':'修改资源' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	
	<!-- 图标选择弹出框 -->
	<%@ include file="/WEB-INF/content/sys/icon/iconSelect.jsp" %>
	<%@ include file="/WEB-INF/content/sys/resource/tree.jsp" %>
	
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="系统管理-资源管理-${pageTitle }" titleIcon="icon-home" />
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
							<form action="${ctx }/sys/resource/edit" class="form-horizontal form_sync"
								method="post" id="form1">
								<!-- 资源 -->
								<input type="hidden" value="${obj.id }" name="id">
								<input type="hidden" value="${obj.parent.id }" name="parent.id" id="parentId">
								<!-- 资源名称 -->
								<div class="control-group">
									<label class="control-label">名称：</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true,byteRangeLength:[4,20]}"
											name="name" value="${obj.name }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">父节点：</label>
									<div class="controls">
										<input id="parentName" type="text" class="span6 m-wrap" value="${obj.parent.name }" onfocus="javascript:showTree();"/>
									</div>
								</div>
								<!-- 资源图标 -->
								<c:choose>
									<c:when test="${empty obj.icon }">
										<c:set var="iconMark" value="icon-cog" scope="page"></c:set>
									</c:when>
									<c:otherwise>
										<c:set var="iconMark" value="${obj.icon }" scope="page"></c:set>
									</c:otherwise>
								</c:choose>
								
								<div class="control-group">
									<label class="control-label">图标：</label>
									<div class="controls">
										<a href="#" class="btn blue" onclick="javascript:showIcons();">
											&nbsp<i id="btnIconI" class="${iconMark }"></i>&nbsp
										</a>
										<input type="hidden" id="iconVal" value="${iconMark }" name="icon">
									</div>
								</div>
								<!-- 资源url -->
								<div class="control-group">
									<label class="control-label">资源url：</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true,isNotChinese:true}"
											name="resString" value="${obj.resString }" />
									</div>
								</div>
								<!-- 权限标识 -->
								<div class="control-group">
									<label class="control-label">权限标识：</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true,isNotChinese:true}"
											name="permsString" value="${obj.permsString }" />
									</div>
								</div>
								<!-- 序号 -->
								<div class="control-group">
									<label class="control-label">序号：</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true,digits:true}"
											name="orderNo" value="${obj.orderNo }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">备注:</label>
									<div class="controls">
										<textarea rows="3" cols="6" class="span6 m-wrap" name="remark">${obj.remark }</textarea>
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
		App.activeMenu("sys/resource/list");
	});
	
	function showIcons(){
		$('#icons').modal();
	}
	
	function selIcon(mark){
		$('#icons').modal('hide');
		
		var oldVal = $("#iconVal").val();
		$("#btnIconI").removeClass(oldVal).addClass(mark);
		$("#iconVal").val(mark);
	}
	
	function showTree(){
		$("#rcTree").modal();
	}
	
	function selRec(){
		
		$obj = $("#tree_1").find("a.selected:first");
		
		$('#rcTree').modal('hide');
		
		$('#parentName').val($obj.text());
		$('#parentId').val($obj.attr("data-id"));
	}
	
</script>
</body>
</html>