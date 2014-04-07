<%@ tag language="java" pageEncoding="UTF-8" description="页面顶部导航栏"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ attribute name="modelKey" type="java.lang.String" required="true" description="模块key" %>

<div class="span4 pull-right">
	<shiro:hasPermission name="sys:${modelKey }:add">
		<a class="btn green" href="javascript:void(0)" onclick="Page.addObj();">
			添加 <i class="icon-plus"></i>
		</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="sys:${modelKey }:update">
	<a class="btn blue" href="javascript:void(0);" onclick="Page.updateObj();">
			修改<i class="icon-pencil"></i>
	</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="sys:${modelKey }:delete">
	<a class="btn red" href="javascript:void(0);" onclick="Page.deleteObj();">
			删除<i class="icon-trash"></i>
	</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="sys:${modelKey }:show">
	<a class="btn blue" href="javascript:void(0);" onclick="Page.viewObj();">
			详细<i class="icon-search"></i>
	</a>
	</shiro:hasPermission>
</div>
