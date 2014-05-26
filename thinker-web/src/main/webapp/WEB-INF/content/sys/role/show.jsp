<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>角色信息</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="用户信息" pageTitleContent="系统管理-用户管理-用户信息" titleIcon="icon-home"/>
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box green">
						<div class="portlet-title">
							<h4>
								<i class="icon-globe"></i>详细信息
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a><a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<!-- BEGIN FORM-->
							<div class="form-horizontal form-view">
								<h3 class="form-section">角色信息<a class='btn purple pull-right' href="${header.Referer }">返回</a></h3>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" for="firstName">名称:</label>
											<div class="controls">
												<span class="text">${obj.name }</span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" for="lastName">中文名称:</label>
											<div class="controls">
												<span class="text">${obj.realName }</span>
											</div>
										</div>
									</div>
									<!--/span-->
								</div>
								<!--/row-->
								<div class="row-fluid">
									<div class="span12 ">
										<div class="control-group">
											<label class="control-label">用户:</label>
											<div class="controls">
												<c:forEach var="user" items="${obj.users }">
													<span class="text bold">
														<a href="${ctx }/sys/user/show/${user.id}" title="点击查看">${user.loginId }(${user.name })</a>
													</span>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">拥有菜单:</label>
											<div class="controls ztree" id="role_rec">
									
											</div>
										</div>
									</div>
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">备注:</label>
											<div class="controls">
												<span class="text bold">${obj.remark }</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/common/plugins/ztree.jsp"%>
<script type="text/javascript">
	var recIds = new Array();
	<c:forEach var="rec" items="${obj.resources }">
		recIds.push(${rec.id });
	</c:forEach>
	
	$(function() {
		App.activeMenu("sys/role/list");
		initTree();
	});
	/* 初始化树 */
	function initTree(){
		var setting = {
			data :{
				key:{
					children:"childRes",
					name:"name"
				}
			}
		};
		$.ajax({
			type : "GET",
			dataType : "json",
			url : "${ctx}/sys/resource/showTree",
			success : function(data){
				$.fn.zTree.init($("#role_rec"), setting, operData(data));
				var treeObj = $.fn.zTree.getZTreeObj("role_rec");
				var nodes = treeObj.getNodes();
				delUnPermRecs(treeObj,nodes);
			}
		});
	}
	
	//数据加工
	function operData(data){
		$.each(data,function(i,item){
			//删除icon属性,避免与ztree的icon属性冲突
			delete item.icon;
			//添加属性
			item.open = true;
			if(item.childRes.length > 0){
				operData(item.childRes);
			}
		});
		return data;
	}
	
	//删除没有权限的节点
	function delUnPermRecs(treeObj,nodes){
		$.each(nodes,function(i,item){
			if(!recIds.isContainsValue(item.id)){
				treeObj.removeNode(nodes[i]);
			}
			if(item.childRes.length > 0){
				delUnPermRecs(treeObj,item.childRes)
			}
		})
	}
</script>
</body>
</html>