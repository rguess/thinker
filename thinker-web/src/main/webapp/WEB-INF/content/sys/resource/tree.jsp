<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type : "GET",
			dataType : "json",
			url : ctx+"/sys/resource/showTree",
			success : function(data){
				$.each(data,function(i,item){
					$("#tree_1").append(insertData(item));
				});
			},
			error : function(error){
					
			}
		});
	});
	
	function insertData(data){
		var flag = data.childRes.length > 0;
		var li = $("<li></li>");
		var a = $("<a href='#' onclick='javascript:selRec(this)' data-id="+data.id+"></a>");
		if(flag){
			a.attr("data-role","branch").attr("data-toggle","branch").attr("data-value","Bootstrap_Tree").addClass("tree-toggle").text(data.name);
		}else{
			a.attr("data-role","leaf").append($("<i class="+data.icon+"></i>")).append(data.name);
		}
		var ul = "";
		if(flag){
			ul = $('<ul class="branch in"></ul>');
			$.each(data.childRes,function(i,item){
				ul.append(insertData(item));
			});
		}else{
			ul = "";
		}
		li.append(a).append(ul);
		return li
	}
</script>
<div id="rcTree" class="modal hide fade" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<h3>选择父资源</h3>
	</div>
	<div class="modal-body">
		<ul class="tree" id="tree_1">
			<!-- <li>
				<a href="#" data-role="branch" class="tree-toggle" data-toggle="branch" data-value="Bootstrap_Tree">
				Bootstrap Tree
				</a>
				<ul class="branch in">
					<li>
						<a href="#" class="tree-toggle" data-toggle="branch" data-value="Bootstrap_Tree" id="nut1">
						Documents
						</a>
						<ul class="branch in">
							<li>
								<a href="#" class="tree-toggle closed" data-toggle="branch" data-value="Bootstrap_Tree" id="nut2">
								Finance
								</a>
								<ul class="branch">
									<li><a href="#" data-role="leaf"><i class="icon-suitcase"></i> Sale Revenue</a></li>
									<li><a href="#" data-role="leaf"><i class="icon-signal"></i> Promotions</a></li>
									<li><a href="#" data-role="leaf"><i class="icon-sitemap"></i> IPO</a></li>
								</ul>
							</li>
							<li><a href="#" data-role="leaf"><i class="icon-signal"></i> ICT</a></li>
							<li><a href="#" data-role="leaf"><i class="icon-sitemap"></i> Human Resources</a></li>
						</ul>
					</li>
					<li>
						<a href="#" class="tree-toggle closed" data-toggle="branch" data-value="Bootstrap_Tree" id="nut3">
						Projects
						</a>
						<ul class="branch">
							<li><a href="#" data-role="leaf"><i class="icon-glass"></i> Internal</a></li>
							<li><a href="#" data-role="leaf"><i class="icon-group"></i> Client Base</a></li>
							<li><a href="#" data-role="leaf"><i class="icon-retweet"></i> Product Base</a></li>
						</ul>
					</li>
					<li>
						<a href="#" class="tree-toggle" data-toggle="branch" data-value="Bootstrap_Tree" id="nut4">
						Tasks
						</a>
						<ul class="branch in">
							<li><a href="#" data-role="leaf"><i class="icon-suitcase"></i> Internal Projects</a></li>
							<li><a href="#" data-role="leaf"><i class="icon-cloud-download"></i> Outsourcing</a></li>
							<li><a href="#" data-role="leaf"><i class="icon-sitemap"></i> Bug Tracking</a></li>
						</ul>
					</li>
					<li>
						<a href="#" class="tree-toggle closed" data-toggle="branch" data-value="Bootstrap_Tree" id="nut6">
						Customers
						</a>
						<ul class="branch">
							<li><a href="#" data-role="leaf"><i class="icon-suitcase"></i> Finance</a></li>
							<li><a href="#" data-role="leaf"><i class="icon-signal"></i> ICT</a></li>
							<li><a href="#" data-role="leaf"><i class="icon-sitemap"></i> Human Resources</a></li>
						</ul>
					</li>
					<li>
						<a href="#" class="tree-toggle closed" data-toggle="branch" data-value="Bootstrap_Tree" id="nut8">
						Reports
						</a>
						<ul class="branch">
							<li><a href="#" data-role="leaf"><i class="icon-suitcase"></i> Finance</a></li>
							<li><a href="#" data-role="leaf"><i class="icon-signal"></i> ICT</a></li>
							<li><a href="#" data-role="leaf"><i class="icon-sitemap"></i> Human Resources</a></li>
						</ul>
					</li>
					<li>
						<a href="http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469" target="_blank" data-role="leaf">
						<i class="icon-share"></i> External Link
						</a>
					</li>
					<li>
						<a href="http://themeforest.net/item/conquer-responsive-admin-dashboard-template/3716838" target="_blank" data-role="leaf">
						<i class="icon-share"></i> Another External Link
						</a>
					</li>
				</ul>
			</li> -->
		</ul> 
	</div>
	<div class="modal-footer">
		<button type="button red" class="btn" data-dismiss="modal"
			aria-hidden="true">关闭</button>
	</div>
</div>
