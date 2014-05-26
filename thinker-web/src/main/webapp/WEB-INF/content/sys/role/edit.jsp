<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="page" />
<c:set var="pageTitle" value="${empty obj ? '添加角色':'修改角色' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="系统管理-角色管理-${pageTitle }" titleIcon="icon-home" />
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
							<form action="${ctx }/sys/role/edit" class="form-horizontal form_sync"
								method="post" id="form1">
								<!-- 角色ID -->
								<input type="hidden" value="${obj.id }" name="id">
								<input id="recids" type="hidden" value="${obj.id }" name="recids">
								<div class="control-group">
									<label class="control-label">角色名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true,
													   remote:{type:'POST',
													   		   url:'${ctx }/sys/role/isAvailable',
													   		   data:{oldValue:'${obj.name }'}},
													   messages:{remote:'该角色名称已存在'}}"
											name="name" value="${obj.name }" />
									</div>
								</div>
								<!-- 名称 -->
								<div class="control-group">
									<label class="control-label">名称:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="realName" value="${obj.realName }" />
									</div>
								</div>
								<!-- 名称 -->
								<div class="control-group">
									<label class="control-label">勾选权限:</label>
									<div class="controls ztree" id="role_rec">
									
									</div>
								</div>
								<!-- 备注 -->
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
<%@ include file="/WEB-INF/content/common/plugins/ztree.jsp"%>
<script type="text/javascript">

	var recIds = new Array();
	<c:if test="${not empty obj }">
		<c:forEach var="rec" items="${obj.resources }">
			recIds.push(${rec.id });
		</c:forEach>
	</c:if>
	
	$(function(){
		App.activeMenu("sys/role/list");
		//初始化资源树
		initTree();
		//初始化隐藏域中recids
		$("#recids").val(recIds);
	});
	
	/* 初始化树 */
	function initTree(){
		var setting = {
			data :{
				key:{
					children:"childRes",
					name:"name"
				}
			},
			check: {
				enable: true,
				chkStyle: "checkbox",
				chkboxType: { "Y": "ps", "N": "ps"}
			},
			callback: {
				onCheck: zTreeOnCheck
			}
		};
		$.ajax({
			type : "GET",
			dataType : "json",
			url : "${ctx}/sys/resource/showTree",
			success : function(data){
				$.fn.zTree.init($("#role_rec"), setting, operData(data));
			}
		});
	}
	
	/* 资源选中或取消选中更新资源ids */
	function zTreeOnCheck(event, treeId, treeNode){
		var treeObj = $.fn.zTree.getZTreeObj(treeId);
		var nodes = treeObj.getCheckedNodes(true);
		recIds = [];
		$.each(nodes,function(i,item){
			recIds.push(item.id);
		});
		$("#recids").val(recIds);
	}
	
	//数据加工
	function operData(data){
		$.each(data,function(i,item){
			//删除icon属性,避免与ztree的icon属性冲突
			delete item.icon;
			//添加属性
			item.open = true;
			//添加checked属性
			if(App.in_array(item.id,recIds)){
				item.checked=true;
			}
			if(item.childRes.length > 0){
				operData(item.childRes);
			}
		});
		return data;
	}
</script>
</body>
</html>