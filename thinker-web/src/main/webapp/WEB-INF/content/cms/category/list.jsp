<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>栏目</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="文章列表" pageTitleContent="cms-栏目-栏目列表" titleIcon="icon-home"/>
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
							<div>
								<div class="btn-group">
									<a class="btn green" href="${ctx}/cms/category/create">
										添加 <i class="icon-plus"></i>
									</a>
								</div>
							</div>
							<div>
								<table id="treeTable" class="table table-striped table-bordered table-hover tree">
									<thead>
										<tr id="dataTr">
											<th>名称</th>
											<th>关键字</th>
											<th>栏目类型</th>
											<th>排序</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="treeBody">
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/common/plugins/jquery-treegrid.jsp"%>
<script type="text/javascript">

//根据权限添加按钮
var btns = [];
btns.push({clickFn : "edit(this)",name : "修改",icon : "icon-pencil"});
btns.push({clickFn : "del(this)",name : "删除",icon : "icon-trash"});
btns.push({clickFn : "show(this)",name : "查看",icon : "icon-search"});

var mudoleKV = {article:"文章",picture:"图片",download:"下载",link:"链接",special:"专题"}


$(document).ready(function() {
	App.activeMenu("cms/category/list");
	initTree();
});

/* 初始化树 */
function initTree() {
	blockUI();
	$.ajax({
		type : "GET",
		dataType : "json",
		url : "${ctx}/cms/category/tree",
		success : function(data) {
			fillData(data);
			$('#treeTable').treegrid({initialState: "collapsed",saveState:true});
			App.setDataThWidth();
			$('.tooltips').tooltip();
			$("th:contains('排序')").css("width","60px");
			unBlockUI();
		}
	});
}

//填充数据
var parentId;
function fillData(data){
	$.each(data,function(i,item){
		
		var tr = $("<tr></tr>").attr("id",item.id).addClass("treegrid-"+item.id);
		if(item.grade>1){
			tr.addClass("treegrid-parent-"+parentId);
		}
		tr.append($("<td></td>").html(item.name));
		tr.append($("<td></td>").html(item.keywords));
		tr.append($("<td></td>").html(mudoleKV[item.module]+"类型"));
		tr.append($("<td></td>").html("<i class='diy_icon_03_08 ibtn tooltips' data-original-title='向上' data-placement='right' onclick='javascript:reOrder(\"up\","+item.id+")'></i>"
				+"&nbsp&nbsp&nbsp&nbsp<i class='diy_icon_03_07 ibtn tooltips' data-original-title='向下' data-placement='right' onclick='javascript:reOrder(\"down\","+item.id+")'></i>"));
		tr.append($("<td></td>").html(operBtn(item.id)));
		$("#treeBody").append(tr);
		
		if(item.childList && item.childList.length>0){
			parentId = item.id;
			fillData(item.childList);
		}
	});
}

//排序
function reOrder(type,id){
	$.ajax({
		type : "POST",
		url : "${ctx}/cms/category/order",
		data :{type:type,id:id},
		success : function(data) {
			$("#treeBody").empty();
			initTree();
		}
	});
}

//生产下拉操作按钮
function operBtn(id){
	return App.initDropDownBtn({
		icon : "icon-cogs",
		name : "操作",
		group : btns
	});
}

//编辑
function edit(obj){
	var id = $(obj).closest("tr").attr("id");
	window.location.href = ctx+"/cms/category/update/"+id;
}

//删除
function del(obj){
	App.confirm(function(result){
		if(!result) return;
		var id = $(obj).closest("tr").attr("id");
		window.location.href = ctx+"/cms/category/delete/"+id;
	});
}

//详细
function show(obj){
	var id = $(obj).closest("tr").attr("id");
	window.location.href = ctx+"/cms/category/show/"+id;
}
</script>
</body>
</html>