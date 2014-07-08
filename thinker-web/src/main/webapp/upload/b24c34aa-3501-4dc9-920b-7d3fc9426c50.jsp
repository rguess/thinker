<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/contents/header.jsp"%>
<!doctype html public "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>注册</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/public.js"></script>
    <script type="text/javascript">
function doRegister() {
	if (isUserName("txtUserName") && isPassword("txtPass1") && isQuePwd("txtPass2", "txtPass1")
			&& isRealName("txtName", "1") && isMobile("txtMobile", "0") && isEmail("txtEmail", "0")) {
		userDwr.isUserExist(getV("txtUserName"), function(result) {
			if (result) {
				errorPormt("txtUserName", "这个用户已经存在!");
			} else {
				formGo("form1");
			}
		});
	}
}
    </script>
  </head>
  
  <body>
    <form action="<%=request.getContextPath()%>/sys_register.html" id="form1" name="form1" method="post">
      <input type="hidden" id="hdfPath" value="<%=request.getContextPath()%>"/>
                用户名：<input type="text" id="txtUserName" name="user.userName" maxlength="20"/><br/>
                密码：<input type="password" id="txtPass1" name="user.password" maxlength="20" onpaste="return false" oncontextmenu="return false"/><br/>
                确认密码：<input type="password" id="txtPass2" maxlength="20" onpaste="return false" oncontextmenu="return false"/><br/>
                姓名：<input type="text" id="txtName" name="user.name" maxlength="20"/><br/>
                性别：<input type="radio" name="user.sex" value="男" checked="checked"/>男<input type="radio" name="user.sex" value="女"/>女<br/>
                手机：<input type="text" id="txtMobile" name="user.mobile" maxlength="11" onkeyup="this.value=this.value.replace(/([^\d])/g,'')"/><br/>
                邮箱：<input type="text" id="txtEmail" name="user.email" maxlength="50"/><br/>
      <input type="button" value="注册" onclick="doRegister()"/>
      <input type="button" value="登录" onclick="window.location.href='index.jsp'"/>
    </form>
  </body>
</html>
