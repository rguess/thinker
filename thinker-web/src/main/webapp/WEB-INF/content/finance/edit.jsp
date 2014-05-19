<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加激励':'修改记录' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="财务管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>请填写表单
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx }/finance/edit" class="form-horizontal form_sync"
								method="post" id="form1">
								<!-- 用户ID -->
								<input type="hidden" value="${obj.id }" name="id">
								<div class="control-group">
									<label class="control-label">名称:</label>
									<div class="controls">
										<input type="text" class="span4 m-wrap"
											validate="{required:true,minlength:2,maxlength:10}"
											name="name" value="${obj.name }" />
									</div>
								</div>
								
								<div class="control-group">
	                                <label class="control-label">类型</label>
	                                <div class="controls">
	                                   <select class="m-wrap span4" name="type" id="financeType">
	                                      <option value="工作">工作</option>
	                                      <option value="生活">生活</option>
	                                      <option value="学习">学习</option>
	                                   </select>
	                                </div>
                                </div>
                                
                                <div class="control-group">
                                     <label class="control-label">inorout</label>
                                     <div class="controls">                                                
                                        <label class="radio">
                                        	<input type="radio" name="inorout" value="1" ${empty obj ? 'checked="checked"' : '' }/>收入
                                        </label>
                                        <label class="radio">
                                       		<input type="radio" name="inorout" value="0"/>支出
                                        </label>  
                                     </div>
                                  </div>
                                  
                                  <div class="control-group">
									<label class="control-label">日期：</label>
									<div class="controls">
										<div class="input-append date form_datetime" data-date-format="yyyy-mm-dd hh:ii">
											<input class="m-wrap span12" name="time" type="text"
												validate="{required:true}" readonly="readonly" 
												value="<fmt:formatDate value="${obj.time}" pattern="yyyy-MM-dd HH:mm"/>"> 
											<span class="add-on"> <i class="icon-th"></i> </span>
										</div>
									</div>
								</div>
                                  
                                  <div class="control-group">
		                              <label class="control-label">金额</label>
		                              <div class="controls">
		                                 <div class="input-append">
		                                    <input class="m-wrap span12"
		                                    	validate="{required:true,number:true}"
		                                    	type="text" 
		                                    	value="${obj.money }" 
		                                    	name="money"/><span class="add-on">元</span>
		                                 </div>
		                              </div>
		                           </div>
		                           
		                           <div class="control-group">
										<label class="control-label">详细类容:</label>
										<div class="controls">
											<textarea rows="3" cols="6" class="span4 m-wrap" name="content">${obj.content }</textarea>
										</div>
									</div>
								
								<div class="form-actions">
									<button type="submit" class="btn blue">提交</button>
									<a class='btn' href="${header.Referer }">返回</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/common/plugins/datepicker.jsp"%>
	<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
	<script type="text/javascript">
		$(function(){
			App.activeMenu("finance/list");
			<c:if test="${not empty obj }">
				init();
			</c:if>
		});
		
		function init(){
			var type = "${obj.type}";
			var inorout = "${obj.inorout}";
			$("#financeType option[value="+type+"]").attr("selected","true");
			$(":radio[name=inorout][value="+inorout+"]").attr("checked","checked").parent().addClass("checked");
		}
	</script>
</body>
</html>