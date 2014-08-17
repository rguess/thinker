<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/content/common/common.jsp" %>
<html>
<head>
    <title>首页</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<div class="page-content">
    <div class="container-fluid" style="padding-top: 25px">
        <div class="alert alert-error">
            <button class="close" data-dismiss="alert"></button>
            注：为了能更好的展示，请不要随意增删改数据
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        App.activeMenu("/index");
    });
</script>
</body>
</html>