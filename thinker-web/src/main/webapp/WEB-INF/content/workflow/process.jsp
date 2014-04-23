<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>选择发起流程</title>
<script type="text/javascript">
	$(function() {
		App.activeMenu("workflow/process");
	});
</script>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="发起流程"
				pageTitleContent="工作流程-发起流程" titleIcon="icon-home" />
			<div class="row-fluid">
				<div class="tiles">
					<div class="tile double-down bg-blue" onclick="javascript:window.location.href = '${ctx}/workflow/leave/apply'">
						<div class="tile-body">
							<i class="icon-bell"></i>
						</div>
						<div class="tile-object">
							<div class="name">请假</div>
						</div>
					</div>
					<div class="tile bg-green" onclick="javascript:window.location.href = '${ctx}/workflow/freeLeave/apply'">
						<div class="tile-body">
							<i class="icon-calendar"></i>
						</div>
						<div class="tile-object">
							<div class="name">自由流</div>
						</div>
					</div>
					<div class="tile double selected bg-blue">
						<div class="corner"></div>
						<div class="check"></div>
						<div class="tile-body">
							<h4>support@metronic.com</h4>
							<p>Re: Metronic v1.2 - Project Update!</p>
							<p>24 March 2013 12.30PM confirmed for the project plan update
								meeting...</p>
						</div>
						<div class="tile-object">
							<div class="name">
								<i class="icon-envelope"></i>
							</div>
							<div class="number">14</div>
						</div>
					</div>
					<div class="tile selected bg-red">
						<div class="corner"></div>
						<div class="tile-body">
							<i class="icon-user"></i>
						</div>
						<div class="tile-object">
							<div class="name">Members</div>
							<div class="number">452</div>
						</div>
					</div>
					<div class="tile bg-yellow">
						<div class="tile-body">
							<i class="icon-shopping-cart"></i>
						</div>
						<div class="tile-object">
							<div class="name">Orders</div>
							<div class="number">121</div>
						</div>
					</div>
					<div class="tile bg-green">
						<div class="tile-body">
							<i class="icon-comments-alt"></i>
						</div>
						<div class="tile-object">
							<div class="name">Feedback</div>
							<div class="number">12</div>
						</div>
					</div>
					<div class="tile bg-blue">
						<div class="tile-body">
							<i class="icon-coffee"></i>
						</div>
						<div class="tile-object">
							<div class="name">Meetups</div>
							<div class="number">12 Jan</div>
						</div>
					</div>
					<div class="tile bg-green">
						<div class="tile-body">
							<i class="icon-bar-chart"></i>
						</div>
						<div class="tile-object">
							<div class="name">Reports</div>
							<div class="number"></div>
						</div>
					</div>
					<div class="tile bg-purple">
						<div class="tile-body">
							<i class="icon-briefcase"></i>
						</div>
						<div class="tile-object">
							<div class="name">Documents</div>
							<div class="number">124</div>
						</div>
					</div>
					<div class="tile bg-yellow selected">
						<div class="corner"></div>
						<div class="check"></div>
						<div class="tile-body">
							<i class="icon-cogs"></i>
						</div>
						<div class="tile-object">
							<div class="name">Settings</div>
						</div>
					</div>
					<div class="tile bg-purple">
						<div class="tile-body">
							<i class="icon-plane"></i>
						</div>
						<div class="tile-object">
							<div class="name">Projects</div>
							<div class="number">34</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>