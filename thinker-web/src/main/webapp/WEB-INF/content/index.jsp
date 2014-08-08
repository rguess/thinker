<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>首页</title>
<meta name="decorator" content="default"/>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<h1>hello,everyone</h1>
		</div>
	</div>
<script type="text/javascript">
	$(function(){
		App.activeMenu("/index");
	});
</script>
</body>
</html>