<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar nav-collapse collapse">
	<!-- BEGIN SIDEBAR MENU -->
	<ul>
		<li>
			<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
			<div class="sidebar-toggler hidden-phone"></div> <!-- END SIDEBAR TOGGLER BUTTON -->
		</li>
		<li class="start"><a href="index.html"> <i class="icon-home"></i>
				<span class="title">首页</span> <span class="selected"></span>
		</a></li>

		<c:forEach var="menu" items="${sessionScope.menus }">
			<c:choose>
				<c:when test="${not empty menu.childRes }">
					<li class="has-sub"><a href="javascript:;"> <i
							class="${menu.icon }"></i> <span class="title">${menu.name }</span>
							<span class="arrow"></span>
					</a>
						<ul class="sub">
							<c:forEach var="child" items="${menu.childRes }">
								<li><a href="${ctx }${child.resString}"><i
										class="${child.icon }"></i>${child.name }</a></li>
							</c:forEach>
						</ul></li>
				</c:when>
				<c:otherwise>
					<li class=""><a href="${ctx }${menu.resString}"> <i
							class="${menu.icon }"></i> <span class="title">${menu.name }</span>
					</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>
	<!-- END SIDEBAR MENU -->
</div>
<!-- END SIDEBAR -->