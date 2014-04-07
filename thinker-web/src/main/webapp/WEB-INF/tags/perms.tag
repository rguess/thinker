<%@ tag language="java" pageEncoding="UTF-8" description="页面顶部导航栏"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ attribute name="permStr" type="java.lang.String" required="true" description="权限字符串用'-'隔开" %>
<c:set var="perm_strs" value="${fn:split(permStr,'-')}" />
<script>
 	var perms = [];
	<c:forEach varStatus="status" items="${perm_strs }" var="item">
		<shiro:hasPermission name="${item}">
			if("${item}".endWith("update")){
				perms.push("update");
			}
			if("${item}".endWith("delete")){
				perms.push("delete");
			}
			if("${item}".endWith("show")){
				perms.push("show");
			}
		</shiro:hasPermission>
	</c:forEach>
</script>