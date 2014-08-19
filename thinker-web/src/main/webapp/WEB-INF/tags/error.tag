<%@ tag language="java" pageEncoding="UTF-8" description="错误信息通用" %>
<%@ attribute name="errorStr" type="java.lang.String" required="true" description="错误类型信息" %>
<html>
<head>
    <title>错误页面</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<div class="page-content">
    <div class="alert alert-block alert-error fade in">
        <button type="button" class="close" data-dismiss="alert"></button>
        <h4 class="alert-heading">${errorStr}</h4>

        <p>
            系统错误日志：<br>
            ${exception.message}
        </p>

        <p>
            <a class="btn green" href="#">联系管理员</a> <a class="btn blue" href="${header.Referer }">返回</a>
        </p>
    </div>
</div>
</body>
</html>