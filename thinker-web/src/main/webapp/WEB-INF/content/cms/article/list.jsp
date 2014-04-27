<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>文章列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="文章列表" pageTitleContent="cms-文章管理-文章列表" titleIcon="icon-home"/>
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="diy_icon_04_38"></i>列表
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a><a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="row-fluid">
								
							</div>
							<table class="table table-striped table-bordered table-hover" id="sample_1">
								
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
<script type="text/javascript">
	$(function(){
		Page.initData(
			{
				url:"${ctx}/cms/article/page",
				tableId : "#sample_1",
				pageSize : 10
			},
			null,
			[{cName:"title",cValue:"标题"},
			 {cName:"description",cValue:"描述"},
			 {cName:"htmlid",cValue:"操作",noSort:true,format:function(i,value,item){
				 var $a = $("<a href='${ctx}/cms/article/view/"+value+"'>查看</a>");
				 return $a;
			 }}
			 ]
		);
	})
</script>
</body>
</html>