/**
 * cms文章处理相关js
 */

var Article = {
	init : function(){
		Article.initCategoryTree();
	},
	
	initArticleData : function(params){
		$("#pageInfo").parent().remove();
		Page.initData(
			{
				url:ctx+"/cms/article/page",
				tableId : "#sample_1",
				pageSize : 10
			},
			params,
			[{cName:"title",cValue:"标题"},
			 {cName:"description",cValue:"描述"},
			 {cName:"htmlid",cValue:"操作",noSort:true,format:function(i,value,item){
				 return Article.operBtn(item.id);
			 }}
			 ]
		);
		$("th:contains('操作')").css("width","50px");
	},
	
	//生产下拉操作按钮
	operBtn : function(id){
		var btns = [];
		btns.push({clickFn : "Article.edit("+id+")",name : "修改",icon : "icon-pencil"});
		btns.push({clickFn : "Article.del("+id+")",name : "删除",icon : "icon-trash"});
		btns.push({clickFn : "Article.show("+id+")",name : "查看",icon : "icon-search"});
		btns.push({clickFn : "Article.view("+id+")",name : "预览",icon : "icon-search"});
		return App.initDropDownBtn({
			icon : "icon-cogs",
			name : "操作",
			group : btns
		});
	},
	
	//编辑
	edit : function(id){
		window.location.href = ctx+"/cms/article/update/"+id;
	},

	//删除
	del : function(id){
		App.confirm(function(result){
			if(!result) return;
			window.location.href = ctx+"/cms/article/delete/"+id;
		});
	},

	//详细
	show : function(id){
		window.location.href = ctx+"/cms/article/show/"+id;
	},
	
	//预览
	view : function(id){
		window.open(ctx+"/cms/article/view/"+id, "_blank");
	},
	
	//生成栏目树
	initCategoryTree : function(){
		var setting = {
			data :{
				key:{
					children:"childList",
					name:"name"
				}
			},
			callback: {
				onClick: Article.refreshAticle
			}
		};
		$.ajax({
			type : "GET",
			dataType : "json",
			url : ctx+"/cms/category/showTree",
			success : function(data){
				$.fn.zTree.init($("#cateTree"), setting, Article.operCaData(data));
			}
		});
	},
	
	operCaData : function(data){
		$.each(data,function(i,item){
			//添加属性
			item.open = true;
			if(item.childList.length > 0){
				Article.operCaData(item.childList);
			}
		});
		return data;
	},
	
	refreshAticle : function(event, treeId, treeNode){
		var treeObj = $.fn.zTree.getZTreeObj(treeId);
		var nodes = treeObj.getSelectedNodes();
		var nodeid = nodes[0].id;
		var queryObj = {
			categoryid : nodeid
		};
		Article.initArticleData(queryObj);
	}
};