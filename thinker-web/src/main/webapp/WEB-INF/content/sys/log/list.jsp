<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>日志列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="日志列表" pageTitleContent="系统管理-系统日志-日志列表" titleIcon="icon-home"/>
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
	                                 	<div class="span3 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="操作名称，操作人，ip">
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span4 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="daterange" class="m-wrap span12" placeholder="时间范围" readonly="readonly">
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span4">
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
									</div>
								</form>
								<tool:operBtns modelKey="log"></tool:operBtns>
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
<%@ include file="/WEB-INF/content/common/plugins/daterangepicker.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	
	App.activeMenu("sys/log/list");
	
	$('#daterange').daterangepicker({
		ranges: {
			'今日': ['today', 'today'],
			'昨日': ['yesterday', 'yesterday'],
			'本月': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
			'今日开始到本周五': [Date.today(), Date.today().next().friday()],
			'今日开始的一周': ['today', Date.today().add( {days: 7} )],
			'今日到本月末尾': ['today', Date.today().moveToLastDayOfMonth()]
		},
		startDate: "2014/05/05",
		endDate: "2014/05/05"
	});
	
	Page.initData(
		{
			url:"${ctx}/sys/log/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[{cName:"operName",cValue:"操作名称"},
		 {cName:"ip",cValue:"ip地址"},
		 {cName:"operTime",cValue:"操作时间",format:function(i,value,item){
			 if(App.isNundef(value)){
				 return new Date(value).format("yyyy-MM-dd hh:mm:ss");
			 }
			 return value;
		 }},
		 {cName:"result",cValue:"类型",format:function(i,value,item){
			 if(value == 1){
				 return "成功";
			 }else if(value == 2){
				 return "失败";
			 }
		 }},
		 {cName:"operUser",cValue:"操作人",format:function(i,value,item){
			 if(App.isNundef(value)){
				 return value.name;
			 }
		 }},
		 {cName:"content",cValue:"描述"}
		 ]
	);
});

function doQuery(){
	var queryObj = {};
	if(App.isNundef($("#daterange").val()) && App.isEqPlacehoder($("#daterange")) != null){
		var arr = $("#daterange").val().split("-")
		queryObj ={
			"search_GTD_operTime" : arr[0].replaceAll("/","-")+" 00:00:00",
			"search_LTD_operTime" : arr[1].replaceAll("/","-")+" 23:59:59"
		}
	}
	queryObj["search_LIKES_operName_OR_ip_OR_operUser.name"] = App.isEqPlacehoder($("#filters"));
	Page.doQuery(queryObj);
}
</script>
</body>
</html>