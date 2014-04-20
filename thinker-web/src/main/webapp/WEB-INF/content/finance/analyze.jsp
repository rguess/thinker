<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>财务分析</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="财务分析" pageTitleContent="功能演示-财务分析" titleIcon="icon-home"/>
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="diy_icon_02_31"></i>图表
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a><a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="tabbable tabbable-custom">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#tab_1_1" data-toggle="tab" id="runingTab">总体比例</a></li>
									<li><a href="#tab_1_2" data-toggle="tab" id="hisTab">时间推移</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tab_1_1">
										<div id="finance_pie_1"></div>
									</div>
									<div class="tab-pane" id="tab_1_2">
										2
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/common/plugins/highcharts.jsp"%>
	<script src="${ctx}/assets/js/finance/finance.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		App.activeMenu("finance/analyze");
		$.finance.analyze();
	});
	</script>
</body>
</html>