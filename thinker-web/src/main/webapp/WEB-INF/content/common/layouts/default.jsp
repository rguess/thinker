<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tool" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <title>thinker:<sitemesh:title/></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta HTTP-EQUIV="pragma" CONTENT="no-cache">
    <meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
    <meta HTTP-EQUIV="expires" CONTENT="0">
    <!-- <meta http-equiv="X-UA-Compatible" content="chrome=1" /> -->

    <!-- 基础样式 -->
    <link href="${ctx}/assets/comp/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/assets/css/metro.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/assets/comp/bootstrap/css/bootstrap-responsive.min.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/assets/comp/font-awesome/css/font-awesome.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/assets/css/style.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/assets/css/style_responsive.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/assets/css/style2.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/assets/css/style_light.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/assets/css/icon.css" type="text/css" rel="stylesheet"/>

    <!-- 插件样式 -->
    <link href="${ctx}/assets/comp/chosen-bootstrap/chosen/chosen.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/assets/comp/uniform/css/uniform.default.css" type="text/css" rel="stylesheet"/>

    <link href="${ctx}/assets/favicon.ico" rel="shortcut icon"/>

    <script src="${ctx}/assets/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="${ctx}/assets/comp/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script>
        //设置路径
        var ctx = "${ctx}";
        jQuery(document).ready(function () {
            //初始化
            App.init();
        });
    </script>
    <sitemesh:head/>
</head>

<body class="fixed-top">
<%@ include file="/WEB-INF/content/common/layouts/header.jsp" %>
<div class="page-container row-fluid">
    <%@ include file="/WEB-INF/content/common/layouts/left.jsp" %>
    <sitemesh:body/>
</div>
<%@ include file="/WEB-INF/content/common/layouts/footer.jsp" %>
<!--[if lt IE 9]>
<script src="${ctx}/assets/js/excanvas.js"></script>
<script src="${ctx}/assets/js/respond.js"></script>
<![endif]-->
<script src="${ctx}/assets/js/jquery.form.js"></script>
<script src="${ctx}/assets/js/jquery.cookie.js"></script>
<script src="${ctx}/assets/js/jquery.blockui.js"></script>
<script src="${ctx}/assets/js/bootbox.js"></script>
<script src="${ctx}/assets/comp/breakpoints/breakpoints.js" type="text/javascript"></script>
<script src="${ctx}/assets/comp/chosen-bootstrap/chosen/chosen.jquery.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/comp/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/js/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/js/app.js"></script>
<script src="${ctx}/assets/js/util.js"></script>
</body>
</html>