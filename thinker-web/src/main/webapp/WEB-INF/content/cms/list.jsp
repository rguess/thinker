<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>内容发布</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="内容发布" pageTitleContent="cms-内容发布" titleIcon="icon-home"/>
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="span2">
						<div class="portlet box purple">
							<div class="portlet-title">
								<h4>
									<i class="diy_icon_04_38"></i>栏目列表
								</h4>
							</div>
							<div class="portlet-body ztree" id="cateTree">
								
							</div>
						</div>
					</div>
					<div class="span10">
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
									<form class="queryForm span8">
										<div class="span3">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="title" class="m-wrap span12" placeholder="名称">
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span5">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                         <a class="btn blue" href="javascript:void(0)" onclick="javascript:doQuery();">
		                                         	<i class="icon-search"></i>
		                                         	查询</a>
		                                         <button type="reset" class="btn" onclick="javascript:Page.clearQuery();">
		                                         	<i class="icon-trash"></i>清空
		                                         </button>
		                                       </div>
		                                    </div>
	                                 	</div>
									</form>
									<div class="span4 pull-right">
										<a class="btn green" href="${ctx }/cms/article/create">
											添加文章<i class="icon-plus"></i>
										</a>
										<a class="btn green" href="${ctx }/cms/link/create">
											添加链接<i class="icon-plus"></i>
										</a>
									</div>
								</div>
								<table class="table table-striped table-bordered table-hover" id="sample_1" style="display: none">
									
								</table>
								<span style="color: red">注：请点击右边栏目查询</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/ztree.jsp"%>
<script src="${ctx}/assets/js/cms/cms.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		App.activeMenu("/cms")
		App.cancleActiveMenu("/cms/category/list");
		App.cancleActiveMenu("/cms/site/list");
		App.cancleActiveMenu("/cms/comment/list");
		Cms.init();
	});
	
	function doQuery(){
		var queryObj = {
			"search_LIKES_title" : App.isEqPlacehoder($("#title"))
		};
		Page.doQuery(queryObj);
	}
</script>
</body>
</html>