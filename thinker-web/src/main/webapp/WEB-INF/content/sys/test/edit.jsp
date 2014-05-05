<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加测试':'修改测试' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="系统管理-测试管理-${pageTitle }" titleIcon="icon-home" />
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
							<form action="${ctx}/sys/test/edit" class="form-horizontal form_sync"
								method="post" id="form1">
								
								<input type="hidden" value="${obj.id}" name="id">
								<div class="control-group">
									<label class="control-label">one:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="one" value="${obj.one }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">tow:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="tow" value="${obj.tow }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">three:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="three" value="${obj.three }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">four:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="four" value="${obj.four }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">five:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="five" value="${obj.five }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">six:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="six" value="${obj.six }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">seven:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="seven" value="${obj.seven }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">eight:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="eight" value="${obj.eight }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">nine:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="nine" value="${obj.nine }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">ten:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="ten" value="${obj.ten }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">aaa:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="aaa" value="${obj.aaa }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">bbb:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="bbb" value="${obj.bbb }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">ccc:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="ccc" value="${obj.ccc }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">ddd:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="ddd" value="${obj.ddd }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">eee:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="eee" value="${obj.eee }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">fff:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="fff" value="${obj.fff }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">ggg:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="ggg" value="${obj.ggg }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">hhh:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="hhh" value="${obj.hhh }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">iii:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="iii" value="${obj.iii }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">jjj:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="jjj" value="${obj.jjj }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">kkk:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="kkk" value="${obj.kkk }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">lll:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="lll" value="${obj.lll }" />
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
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
<script type="text/javascript">
	$(function(){
		App.activeMenu("sys/test/list");
	});
</script>
</body>
</html>