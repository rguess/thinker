package org.guess.sys.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.guess.core.utils.spring.SpringContextUtil;
import org.guess.sys.model.User;
import org.guess.sys.service.UserService;


public class UserUtil {
	
	private static UserService userService = SpringContextUtil.getBean(UserService.class);

	/**
	 * 获取当前登录的user
	 * @return
	 */
	public static User getCurrentUser(){
		Subject subject = SecurityUtils.getSubject();
		String loginId = (String) subject.getPrincipal();
		return userService.findUniqueBy("loginId", loginId);
	}
}
