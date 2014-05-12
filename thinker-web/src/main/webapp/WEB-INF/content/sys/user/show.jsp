<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>用户信息</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="用户信息" pageTitleContent="系统管理-用户管理-用户信息"
				titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="portlet box blue">
				<div class="portlet-title">
					<h4>
						<i class="icon-reorder"></i>用户信息
					</h4>
					<div class="tools">
						<a href="javascript:;" class="collapse"></a> <a
							href="javascript:;" class="remove"></a>
					</div>
				</div>
				<div class="portlet-body form">
					<!-- BEGIN FORM-->
					<div class="form-horizontal form-view">
						<h3>系统用户- ${obj.name }</h3>
						<h3 class="form-section">个人信息<a class='btn purple pull-right' href="${header.Referer }">返回</a></h3>
						<div class="row-fluid">
							<div class="span6 ">
								<div class="control-group">
									<label class="control-label" for="firstName">邮箱:</label>
									<div class="controls">
										<span class="text">${obj.email }</span>
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="span6 ">
								<div class="control-group">
									<label class="control-label" for="lastName">用户名:</label>
									<div class="controls">
										<span class="text">${obj.loginId }</span>
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row-fluid">
							<div class="span6 ">
								<div class="control-group">
									<label class="control-label">创建时间:</label>
									<div class="controls">
										<span class="text"><fmt:formatDate
												value="${obj.createDate }" /></span>
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="span6 ">
								<div class="control-group">
									<label class="control-label">手机号:</label>
									<div class="controls">
										<span class="text">${obj.mobilePhone }</span>
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row-fluid">
							<div class="span6 ">
								<div class="control-group">
									<label class="control-label">地址:</label>
									<div class="controls">
										<span class="text bold">${obj.address }</span>
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="span6 ">
								<div class="control-group">
									<label class="control-label">状态:</label>
									<div class="controls">
										<span class="text bold">${obj.status eq 1 ? '启用':'禁用' }</span>
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<div class="row-fluid">
							<div class="span12 ">
								<div class="control-group">
									<label class="control-label">角色:</label>
									<div class="controls">
										<c:forEach var="role" items="${obj.roles }">
											<span class="text bold">
												<a href="${ctx }/sys/role/show/${role.id}" title="点击查看">${role.name }(${role.realName })</a>
											</span>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12 ">
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
				<!-- END FORM-->
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(function() {
		App.activeMenu("sys/user/list");
	});
</script>
</body>
</html>