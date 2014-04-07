<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row-fluid">
	<div class="span12">
		<h3 class="page-title">${param.pageTitle }</h3>
		<ul class="breadcrumb">
			<%
				String[] strs = request.getParameter("pageTitleContent").split("-");
				String title = request.getParameter("pageTitleIcon");
				for(int i = 0;i<strs.length;i++){
					if(i == 0){
						%>
						<li><i class="<%=title %>"></i><a href="#"><%=strs[i] %></a> <span class="icon-angle-right"></span></li>
						<%
					}else if(i == strs.length-1){
						%>
							<li><a href="#"><%=strs[i] %></a></li>
						<%
					}else{
						%>
						<li><a href="#"><%=strs[i] %></a><span class="icon-angle-right"></span></li>
						<%
					}
				}
			%>
		</ul>
	</div>
</div>