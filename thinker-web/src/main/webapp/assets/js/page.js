var Page = {
	/**
	 * 默认设置
	 */
	defaultVal : {
		pageNo : 1,
		pageSize : 10,
		totalPages : 0,
		url : "",
		tableId : ""
	},
	/**
	 * 默认列
	 */
	defaultCols : [],
	/**
	 * 查询条件
	 */
	cqData : {},
	/**
	 * 保存当前状态下数据
	 */
	curData : {},
	
	/**
	 * 清除数据
	 */
	clear : function(){
		Page.defaultCols = [];
		Page.cqData = {};
		Page.curData = {};
		$(Page.defaultVal.tableId).empty();
		$("#Pagination").parent().remove();
	},
	
	/**
	 * ajax访问数据服务器获得数据
	 */
	accToSer : function(callBack) {
		blockUI();
		$.ajax({
			type : "POST",
			dataType : "json",
			url : Page.defaultVal.url,
			async : false,
			data : Page.cqData,
			success : callBack,
			error : function(error) {
				unBlockUI();
			}
		});
	},
	/**
	 * 主体处理函数
	 * 
	 * @param options
	 * @param queryData
	 * @param cols
	 */
	initData : function(options, queryData, cols) {
		this.defaultCols = cols;
		// 组合默认与传进来的参数
		var obj = $.extend(this.defaultVal, options || {});
		this.defaultVal = obj;
		// 当前页和每页显示多少条放进查询参数中
		if (!queryData)
			queryData = {};
		queryData.pageNo = obj.pageNo;
		queryData.pageSize = obj.pageSize;
		Page.cqData = queryData;

		// 初始化表头
		var thead = $("<thead></thead>");
		var theadTr = $("<tr></tr>");
		//checkbox
		theadTr.append($("<th></th>").append($("<input type='checkbox' onclick='javascript:Page.checkAllItems(this);'>")));
		
		$.each(cols, function(i, item) {
			var sortStr = item.noSort ? ""
					: "class='sorting' onclick='Page.sorting(this)'";
			theadTr.append($("<th " + sortStr + "></th>").attr("cName",
					item.cName).html(item.cValue));
		});
		//判断菜单数组长度如果不为空才添加操作列
		/*if(typeof(perms) != "undefined" && perms.length >0 ){
			theadTr.append($("<th class='span2'></th>").html("操作"));
		}*/
		thead.append(theadTr);
		tBody = $("<tbody></tbody>");
		$(obj.tableId).empty().append(thead).append(tBody);
		// 初始化数据回调
		var callBack = function(page) {
			if(Page.isEmptyData(page)) return;
			Page.defaultVal.totalPages = page.totalPages;
			Page.insertData(page);
			Page.initPagination(page);
			// 取消遮罩层
			unBlockUI();
		};
		Page.accToSer(callBack);
	},

	/**
	 * 插入主要数据
	 */
	insertData : function(pageData) {
		var tbody = $(Page.defaultVal.tableId + " tbody:first").empty();
		$.each(pageData.data, function(i, item) {
			var tr = $("<tr></tr>");
			//checkbox
			tr.append($("<td></td>").append($("<input type='checkbox' data-id="+item.id+">")));
			$.each(Page.defaultCols, function(j, col) {
				if (col.format) {
					tr.append($("<td></td>").html(
							col.format(j, item[col.cName], item)));
				} else {
					tr.append($("<td></td>").html(item[col.cName]));
				}
			});
			/*if(typeof(perms) != "undefined" && perms.length >0 ){
				tr.append($("<td></td>").html(Page.operBtn(item.id)));
			}*/
			tbody.append(tr);
		});
		$('.tooltips').tooltip();
		Page.registerTdOnclickEvent();
	},

	/**
	 * 执行分页
	 * 
	 */
	initPagination : function(page) {
		var span = $("<div></div>");
		var pagnation = $("<div id='Pagination'></div>");
		var pageInfo = $("<div class='pull-left' id='pageInfo'></div>").html(
				$("<span></span>").html(
						'当前第' + Page.cqData.pageNo + '/' + page.totalPages
								+ '页，共' + page.totalSize + '条记录'));
		span.append(pageInfo).append(pagnation);
		$(this.defaultVal.tableId).after(span);
		var options = {
			// size:"large",
			alignment : "right",
			currentPage : Page.cqData.pageNo,
			totalPages : this.defaultVal.totalPages,
			pageUrl : function(type, page, current) {
				return "javascript:void(0)";
			},
			tooltipTitles : function(type, page, current) {
				switch (type) {
				case "first":
					return "第一页";
				case "prev":
					return "上一页";
				case "next":
					return "下一页";
				case "last":
					return "最后一页";
				case "page":
					return "第" + page + "页";
				}
			},
			onPageClicked : function(e, originalEvent, type, page) {
				Page.cqData.pageNo = page;
				Page.accToSer(Page.pageChangedCallBack);
			}
		};
		pagnation.bootstrapPaginator(options);
	},
	/**
	 * 翻页和排序回调函数
	 * 
	 * @param id
	 * @returns
	 */
	pageChangedCallBack : function(pageData) {
		if(Page.isEmptyData(pageData)) return;
		Page.insertData(pageData);
		options = {
			totalPages : pageData.totalPages
		};
		$('#Pagination').bootstrapPaginator(options);
		$("#pageInfo").html(
				$("<span></span>").html(
						'当前第' + Page.cqData.pageNo + '/' + pageData.totalPages
								+ '页，共' + pageData.totalSize + '条记录'));
		// 取消遮罩层
		unBlockUI();
	},
	// 生成操作按钮
	/*operBtn : function(id) {
		var group = [];
		if(App.in_array("update",perms)){
			group.push({
				clickFn : "Page.updateObj(" + id + ")",
				name : "修改",
				icon : "icon-pencil"
			});
		}
		if(App.in_array("delete",perms)){
			group.push({
				clickFn : "Page.deleteObj(" + id + ")",
				name : "删除",
				icon : "icon-trash"
			});
		}
		if(App.in_array("show",perms)){
			group.push({
				clickFn : "Page.viewObj(" + id + ")",
				name : "查看",
				icon : "icon-search"
			});
		}
		return App.initDropDownBtn({
			icon : "icon-cogs",
			name : "操作",
			group: group
		});
	},*/
	/*updateObj : function(id) {
		window.location.href = Page.subUrl() + "/update/" + id;
	},
	deleteObj : function(id) {
		window.location.href = Page.subUrl() + "/delete/" + id;
	},
	viewObj : function(id) {
		window.location.href = Page.subUrl() + "/show/" + id;
	},*/
	
	addObj : function() {
		window.location.href = Page.subUrl() + "/create";
	},
	
	updateObj : function() {
		var boxes = $(Page.defaultVal.tableId).find("td :checkbox:checked");
		if(boxes.length == 0){
			App.alert("请选中一条记录");
			return;
		}
		if(boxes.length > 1){
			App.alert("请只选择一条记录");
			return;
		}
		var id = boxes.first().attr("data-id");
		window.location.href = Page.subUrl() + "/update/" + id;
	},
	
	viewObj : function(id) {var boxes = $(Page.defaultVal.tableId).find("td :checkbox:checked");
		if(boxes.length == 0){
			App.alert("请选中一条记录");
			return;
		}
		if(boxes.length > 1){
			App.alert("请只选择一条记录");
			return;
		}
		var id = boxes.first().attr("data-id");
		window.location.href = Page.subUrl() + "/show/" + id;
	},
	
	deleteObj : function(id) {
		var boxes = $(Page.defaultVal.tableId).find("td :checkbox:checked");
		if(boxes.length == 0){
			App.alert("请选中一条记录");
			return;
		}
		var delFun = function(result){
			if(!result) return;
			var f = document.createElement("form");
			document.body.appendChild(f);
			$.each(boxes,function(i,item){
				var i = document.createElement("input");
				i.type = "hidden";
				i.name = "ids";
				i.value = $(item).attr("data-id");
				f.appendChild(i);
			});
			f.action = Page.subUrl() + "/delete";
			f.method = "POST";
			f.submit();
		};
		App.confirm(delFun);
	},
	/**
	 * 截取url供修改，删除，查看等使用
	 */
	subUrl : function() {
		var url = Page.defaultVal.url;
		return url.substring(0, url.lastIndexOf("/"));
	},
	/**
	 * 执行排序函数
	 */
	sorting : function(obj) {
		var sort = {};
		if ($(obj).hasClass("sorting") || $(obj).hasClass("sorting_desc")) {
			$(obj).removeClass("sorting").removeClass("sorting_desc").addClass(
					"sorting_asc").siblings("[class^=sorting_]").removeClass(
					"sorting_asc").removeClass("sorting_desc").addClass(
					"sorting");
			sort = {
				orderBy : $(obj).attr("cName"),
				orderDir : "asc"
			};
		} else if ($(obj).hasClass("sorting_asc")) {
			$(obj).removeClass("sorting").removeClass("sorting_asc").addClass(
					"sorting_desc").siblings("[class^=sorting_]").removeClass(
					"sorting_asc").removeClass("sorting_desc").addClass(
					"sorting");
			sort = {
				orderBy : $(obj).attr("cName"),
				orderDir : "desc"
			};
		}
		Page.cqData = $.extend(Page.cqData, sort);
		Page.cqData.pageNo = 1;
		Page.accToSer(Page.pageChangedCallBack);
		$('#Pagination').bootstrapPaginator("showFirst");
	},
	
	/**
	 * 判断是否有数据并作出处理
	 */
	isEmptyData : function(page){
		if(page.totalSize == 0){
			$(Page.defaultVal.tableId).hide();
			$("#Pagination").parent().hide();
			$(Page.defaultVal.tableId).parent().append("<span id='noneData'>没有数据！</span>");
			unBlockUI();
			return true;
		}else{
			$("#noneData").remove();
			$(Page.defaultVal.tableId).parent().children().show();
			return false;
		}
	},
	
	/**
	 * 执行查询函数
	 */
	doQuery : function(queryObj) {
		Page.cqData = $.extend(Page.cqData, queryObj);
		Page.cqData.pageNo = 1;
		Page.accToSer(Page.pageChangedCallBack);
		$('#Pagination').bootstrapPaginator("showFirst");
	},
	
	/**********************************************************
	 * 改变方式把操作按钮都放到上边
	 **********************************************************/
	checkAllItems : function(obj){
		if($(obj).attr("checked") == "checked"){
			$(obj).closest("table").find(":checkbox").attr("checked","checked");
		}else{
			$(obj).closest("table").find(":checkbox").removeAttr("checked");
		}
	},
	
	/**
	 * 给所有td注册事件，点击选中当前行tr的checkbox
	 * @param $
	 */
	registerTdOnclickEvent : function(){
		$("td").click(function(){
			var box = $(this).parent().find(":checkbox");
			if(box.attr("checked") == "checked"){
				box.removeAttr("checked");
			}else{
				box.attr("checked","checked");
			}
		});
	}
};


/*******************************************************************************
 * 分页封装插件 基于jquery pagination
 */
(function($) {
	$.fn.pagination = function(options, url) {
		
	};
})(jQuery);
