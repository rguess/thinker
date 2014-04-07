<%@ page language="java" contentType="text/html; utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>系统登录</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link href="${ctx}/assets/comp/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/css/metro.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/comp/bootstrap/css/bootstrap-responsive.min.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/comp/font-awesome/css/font-awesome.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/css/style.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/css/style_responsive.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/css/style_default.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/comp/gritter/css/jquery.gritter.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/favicon.ico" rel="shortcut icon"/>
<script src="${ctx}/assets/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/comp/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/js/jquery.getparam.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		var error = $.getParam("error");
		var content = "";
		switch(error)
		{
		case "kickout":
		  content = "账号被其他人登录！"
		  break;
		case "unauthor":
		  content = "拒绝访问！"
		  break;
		default:
		}
		
		var remind = $("#remind").text();
		if(remind == null || "" == remind){
			$("#remind").text(content);
		}
		
	});
</script>
</head>
<body style="background-image: url('${ctx}/assets/img/sys/bg1.jpg');">
	<div class="container">
		<div class="row-fluid">
			<div class="span6">
			</div>
			<div class="span6" style="margin-top: 200px">
				<form class="form-horizontal" action="${ctx }/login" method="post">
					<span style="color: red" id="remind">${message_login }</span>
					<div class="control-group">
						<label class="control-label" for="inputEmail">用户名:</label>
						<div class="controls">
							<input type="text" name="userName" placeholder="loginId"/><span class="help-inline"></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputPassword">密码:</label>
						<div class="controls">
							<input type="password" name="password" placeholder="password" /><span class="help-inline"></span>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<label class="checkbox"><input type="checkbox" name="rememberMe" value="true" checked="checked"/>Remember me </label>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="submit" class="btn blue">
					        	登录 <i class="m-icon-swapright m-icon-white"></i>
					        </button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>