<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>测试列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="测试列表" pageTitleContent="系统管理-测试管理-测试列表" titleIcon="icon-home"/>
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="icon-globe"></i>列表
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a><a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="row-fluid">
								<form class="queryForm span8">
									<div class="row-fluid">
	                                 	<div class="span7 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="one,tow,three,four,five,six,seven,eight,nine,ten,aaa,bbb,ccc,ddd,eee,fff,ggg,hhh,iii,jjj,kkk,lll">
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span5 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                         <a class="btn blue" href="javascript:void(0)" onclick="javascript:doQuery();">
		                                         	<i class="icon-search"></i>
		                                         	查询</a>
		                                         <button type="reset" class="btn">
		                                         	<i class="icon-trash"></i>清空
		                                         </button>
		                                       </div>
		                                    </div>
	                                 	</div>
									</div>
								</form>
								<tool:operBtns modelKey="role"></tool:operBtns>
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
$(document).ready(function() {
	
	App.activeMenu("sys/test/list");
	
	Page.initData(
		{
			url:"${ctx}/sys/test/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"one",cValue:"one"},

			 	{cName:"tow",cValue:"tow"},

			 	{cName:"three",cValue:"three"},

			 	{cName:"four",cValue:"four"},

			 	{cName:"five",cValue:"five"},

			 	{cName:"six",cValue:"six"},

			 	{cName:"seven",cValue:"seven"},

			 	{cName:"eight",cValue:"eight"},

			 	{cName:"nine",cValue:"nine"},

			 	{cName:"ten",cValue:"ten"},

			 	{cName:"aaa",cValue:"aaa"},

			 	{cName:"bbb",cValue:"bbb"},

			 	{cName:"ccc",cValue:"ccc"},

			 	{cName:"ddd",cValue:"ddd"},

			 	{cName:"eee",cValue:"eee"},

			 	{cName:"fff",cValue:"fff"},

			 	{cName:"ggg",cValue:"ggg"},

			 	{cName:"hhh",cValue:"hhh"},

			 	{cName:"iii",cValue:"iii"},

			 	{cName:"jjj",cValue:"jjj"},

			 	{cName:"kkk",cValue:"kkk"},

			  	{cName:"lll",cValue:"lll"}
		 ]
	);
});

function doQuery(){
	var queryObj = {
			search_LIKES_one_OR_tow_OR_three_OR_four_OR_five_OR_six_OR_seven_OR_eight_OR_nine_OR_ten_OR_aaa_OR_bbb_OR_ccc_OR_ddd_OR_eee_OR_fff_OR_ggg_OR_hhh_OR_iii_OR_jjj_OR_kkk_OR_lll : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>