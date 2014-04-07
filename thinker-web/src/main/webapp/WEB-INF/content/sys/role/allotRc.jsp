<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<div class="span6 diywindow" style="display: none;" id="rcs">
	<!-- BEGIN TAB PORTLET-->
	<div class="portlet box green tabbable">
		<div class="portlet-title" style="cursor: move;">
			<h4>
				<i class="icon-reorder"></i>Tabs
			</h4>
			<div class="tools">
				<a href="javascript:;" class="collapse"></a>
				<a href="javascript:;" class="remove1"></a>
			</div>
		</div>
		<div class="portlet-body">
			<div class="tabbable tabbable-custom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab_1_1" data-toggle="tab">Section
							1</a></li>
					<li><a href="#tab_1_2" data-toggle="tab">Section 2</a></li>
					<li><a href="#tab_1_3" data-toggle="tab">Section 3</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab_1_1">
						<p>I'm in Section 1.</p>
						<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation
							ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
							consequat. Duis autem vel eum iriure dolor in hendrerit in
							vulputate velit esse molestie consequat.</p>
						<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation
							ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
							consequat. Duis autem vel eum iriure dolor in hendrerit in
							vulputate velit esse molestie consequat.</p>
						<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation
							ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
							consequat. Duis autem vel eum iriure dolor in hendrerit in
							vulputate velit esse molestie consequat.</p>
					</div>
					<div class="tab-pane" id="tab_1_2">
						<p>Howdy, I'm in Section 2.</p>
						<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation
							ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
							consequat. Duis autem vel eum iriure dolor in hendrerit in
							vulputate velit esse molestie consequat. Ut wisi enim ad minim
							veniam, quis nostrud exerci tation.</p>
					</div>
					<div class="tab-pane" id="tab_1_3">
						<p>Howdy, I'm in Section 3.</p>
						<p>Duis autem vel eum iriure dolor in hendrerit in vulputate.
							Ut wisi enim ad minim veniam, quis nostrud exerci tation
							ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
							consequat. Duis autem vel eum iriure dolor in hendrerit in
							vulputate velit esse molestie consequat</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END TAB PORTLET-->
</div>