/**
 * cms处理内容
 */

var Cms = {
	// 各种内容对象属性,包含多种，如article,link展示属性与链接不一样
	objs : {
		// 文章类型
		article : {
			url : ctx + "/cms/article",
			colums : [{cName:"title",cValue:"标题",format:function(i,value,item){
							var str = value;
							if(value.length > 20){
								str = value.substr(0,20)+"...";
							}
							var $a = $('<a href="javascript:void(0)" data-original-title="'+value+'" data-placement="right" class="tooltips" onclick="javascript:Cms.view(\'article\','+item.id+');">'
									+str+'</a>');
							return $a;
					  }},
					  {cName:"category",cValue:"栏目",format:function(i,value,item){
						  return item.category.name;
					  }},
					  {cName:"description",cValue:"描述",format:function(i,value,item){
						  return value.substr(0,20)+"...";
					  }},
					  {cName:"htmlid",cValue:"操作",noSort:true,format:function(i,value,item){
							 return Cms.objs.article.operBtn(item.id);
					  }}
					 ],
			operBtn : function(id){
				var btns = [];
				btns.push({clickFn : "Cms.edit('article',"+id+")",name : "修改",icon : "icon-pencil"});
				btns.push({clickFn : "Cms.del('article',"+id+")",name : "删除",icon : "icon-trash"});
				btns.push({clickFn : "Cms.show('article',"+id+")",name : "查看",icon : "icon-search"});
				return App.initDropDownBtn({
					icon : "icon-cogs",
					name : "操作",
					group : btns
				});
			}
		},
	//链接
	link : {
		url : ctx + "/cms/link",
		colums : [{cName:"title",cValue:"链接名称"},
				  {cName:"href",cValue:"链接地址",format:function(i,value,item){
					  var $a = $('<a data-original-title="点击访问" data-placement="right" class="tooltips" href="'+value+'" target="_blank">'+value+'</a>');
					  return $a;
				  }},
				  {cName:"module",cValue:"栏目",format:function(i,value,item){
					  return item.category.name;
				  }},
				  {cName:"htmlid",cValue:"操作",noSort:true,format:function(i,value,item){
						 return Cms.objs.link.operBtn(item.id);
				  }}
				 ],
		operBtn : function(id){
			var btns = [];
			btns.push({clickFn : "Cms.edit('link',"+id+")",name : "修改",icon : "icon-pencil"});
			btns.push({clickFn : "Cms.del('link',"+id+")",name : "删除",icon : "icon-trash"});
			btns.push({clickFn : "Cms.show('link',"+id+")",name : "查看",icon : "icon-search"});
			return App.initDropDownBtn({
				icon : "icon-cogs",
				name : "操作",
				group : btns
			});
		}
	}
	},
	
	//初始化
	init : function(){
		Cms.initCategoryTree();
	},
	
	//执行查询显示数
	initData : function(params,module){
		$("#pageInfo").parent().remove();
		$("#sample_1").show().next().remove();
		Page.clear();
		Page.initData(
			{
				url:ctx+"/cms/"+module+"/page",
				tableId : "#sample_1",
				pageSize : 10
			},
			params,Cms.objs[module].colums
		);
		App.setDataThWidth();
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
				onClick: Cms.refreshContent
			}
		};
		$.ajax({
			type : "GET",
			dataType : "json",
			url : ctx+"/cms/category/tree",
			success : function(data){
				$.fn.zTree.init($("#cateTree"), setting, Cms.operCaData(data));
			}
		});
	},
	
	//处理一下返回的数据
	operCaData : function(data){
		$.each(data,function(i,item){
			//添加属性
			item.open = true;
			//删除url属性
			delete item.url;
			if(item.childList.length > 0){
				Cms.operCaData(item.childList);
			}
		});
		return data;
	},
	
	//点击左侧栏目时刷新
	refreshContent : function(event, treeId, treeNode){
		var treeObj = $.fn.zTree.getZTreeObj(treeId);
		var nodes = treeObj.getSelectedNodes();
		var nodeid = nodes[0].id;
		Page.clear();
		$(".queryForm")[0].reset();
		var queryObj = {
			categoryid : nodeid
		};
		Cms.initData(queryObj,nodes[0].module);
	},
	
	//编辑
	edit : function(module,id){
		window.location.href = ctx+"/cms/"+module+"/update/"+id;
	},

	//删除
	del : function(module,id){
		App.confirm(function(result){
			if(!result) return;
			window.location.href = ctx+"/cms/"+module+"/delete/"+id;
		});
	},

	//详细
	show : function(module,id){
		window.location.href = ctx+"/cms/"+module+"/show/"+id;
	},
	
	//预览
	view : function(module,id){
		window.open(ctx+"/blog/article/"+id+".html", "_blank");
	}
}