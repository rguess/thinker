<%@ tag language="java" pageEncoding="UTF-8" description="页面顶部导航栏"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ attribute name="pageTitle" type="java.lang.String" required="true" description="标题" %>
<%@ attribute name="pageTitleContent" type="java.lang.String" required="true" description="标题内容,按'-'隔开" %>
<%@ attribute name="titleIcon" type="java.lang.String" required="true" description="导航图标class" %>

<c:set var="strs" value="${fn:split(pageTitleContent,'-')}" />

<div class="row-fluid">
	<div class="span12">
		<%-- <h4 class="page-title">${pageTitle}</h4> --%>
		<br>
		<ul class="breadcrumb">
			<c:forEach varStatus="status" items="${strs }" var="item">
				<c:choose>
					<c:when test="${status.index == 0 }">
						<li><i class="${titleIcon }"></i><a href="#">${item }</a> <span class="icon-angle-right"></span></li>
					</c:when>
					<c:when test="${status.index == fn:length(strs) - 1 }">
						<li><a href="#">${item }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#">${item }</a><span class="icon-angle-right"></span></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li class="pull-right no-text-shadow"></li>
		</ul>
	</div>
</div>