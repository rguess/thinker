<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>用户信息</title>
<script type="text/javascript">
	$(function(){
		App.activeMenu("sys/user/list");
	});
</script>
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
						<div class="portlet-body">
							<div class="row-fluid">
								<div class="profile-classic">
									<ul class="unstyled">
										<li><span>姓名:</span> ${obj.name }</li>
										<li><span>邮箱:</span><a href="#"> ${obj.email }</a></li>
										<li><span>用户名:</span> ${obj.loginId }</li>
										<li><span>创建时间:</span><fmt:formatDate value="${obj.createDate }"/></li>
										<li><span>手机号:</span> ${obj.mobilePhone }</li>
										<li><span>地址:</span> ${obj.address }</li>
										<li><span>状态:</span> ${obj.status }</li>
										<li><span>备注:</span> ${obj.remark }</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>