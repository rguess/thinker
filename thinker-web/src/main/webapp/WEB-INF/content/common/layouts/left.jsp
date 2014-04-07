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
		<li class="has-sub "><a href="javascript:;"> <i
				class="icon-th-list"></i> <span class="title">Data Tables</span> <span
				class="arrow "></span>
		</a>
			<ul class="sub">
				<li><a href="table_basic.html">Basic Tables</a></li>
				<li><a href="table_managed.html">Managed Tables</a></li>
				<li><a href="table_editable.html">Editable Tables</a></li>
			</ul></li>
		<li class="has-sub "><a href="javascript:;"> <i
				class="icon-th-list"></i> <span class="title">Portlets</span> <span
				class="arrow "></span>
		</a>
			<ul class="sub">
				<li><a href="portlet_general.html">General Portlets</a></li>
				<li><a href="portlet_draggable.html">Draggable Portlets</a></li>
			</ul></li>
		<li class="has-sub "><a href="javascript:;"> <i
				class="icon-map-marker"></i> <span class="title">Maps</span> <span
				class="arrow "></span>
		</a>
			<ul class="sub">
				<li><a href="maps_google.html">Google Maps</a></li>
				<li><a href="maps_vector.html">Vector Maps</a></li>
			</ul></li>
		<li class=""><a href="charts.html"> <i class="icon-bar-chart"></i>
				<span class="title">Visual Charts</span>
		</a></li>
		<li class=""><a href="calendar.html"> <i
				class="icon-calendar"></i> <span class="title">Calendar</span>
		</a></li>
		<li class=""><a href="gallery.html"> <i class="icon-camera"></i>
				<span class="title">Gallery</span>
		</a></li>
		<li class="has-sub "><a href="javascript:;"> <i
				class="icon-briefcase"></i> <span class="title">Extra</span> <span
				class="arrow "></span>
		</a>
			<ul class="sub">
				<li><a href="extra_profile.html">User Profile</a></li>
				<li><a href="extra_faq.html">FAQ</a></li>
				<li><a href="extra_search.html">Search Results</a></li>
				<li><a href="extra_invoice.html">Invoice</a></li>
				<li><a href="extra_pricing_table.html">Pricing Tables</a></li>
				<li><a href="extra_404.html">404 Page</a></li>
				<li><a href="extra_500.html">500 Page</a></li>
				<li><a href="extra_blank.html">Blank Page</a></li>
				<li><a href="extra_full_width.html">Full Width Page</a></li>
			</ul></li>
		<li class=""><a href="login.html"> <i class="icon-user"></i>
				<span class="title">Login Page</span>
		</a></li>
	</ul>
	<!-- END SIDEBAR MENU -->
</div>
<!-- END SIDEBAR -->