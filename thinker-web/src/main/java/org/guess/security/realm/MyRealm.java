package org.guess.security.realm;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.guess.core.Constants;
import org.guess.sys.model.Resource;
import org.guess.sys.model.Role;
import org.guess.sys.model.User;
import org.guess.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 自定义的指定Shiro验证用户登录的类
 * @author guess
 */
public class MyRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;

	/**
	 * 为当前登录的Subject授予角色和权限
	 * 
	 * @see 经测试:本例中该方法的调用时机为需授权资源被访问时
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 获取当前登录的用户名,等价于(String)principals.fromRealm(this.getName()).iterator().next()
		String currentUsername = (String) super.getAvailablePrincipal(principals);
		User user = userService.findByLoginId(currentUsername);
		SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
		List<String> stringRoles = new ArrayList<String>();
		List<String> stringPerms = new ArrayList<String>();
		if(null != user){
			for (Role role : user.getRoles()) {
				stringRoles.add(role.getName());
				for (Resource rec : role.getResources()) {
					if(rec.getGrade() == Constants.MENU_GRADE){
						stringPerms.add(rec.getPermsString());
					}
				}
			}
			simpleAuthorInfo.addRoles(stringRoles);
			simpleAuthorInfo.addStringPermissions(stringPerms);
			return simpleAuthorInfo;
		}else{
			 throw new AuthorizationException();
		}
	}

	/**
	 * 验证当前登录的Subject
	 * 
	 * @see 经测试:本例中该方法的调用时机为LoginController.login()方法中执行Subject.login()时
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		System.out.println("验证当前Subject时获取到token为"
				+ ReflectionToStringBuilder.toString(token, ToStringStyle.MULTI_LINE_STYLE));
		User user = userService.findUniqueBy("loginId", token.getUsername());
		if (null != user) {
			if(user.getStatus() == Constants.USER_STATUS_LOCK){
				throw new LockedAccountException();
			}
			AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getLoginId(), user.getPasswd(),
					user.getName());
			return authcInfo;
		} else {
			return null;
		}
	}
}