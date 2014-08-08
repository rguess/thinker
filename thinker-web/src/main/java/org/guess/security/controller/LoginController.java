package org.guess.security.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.guess.core.Constants;
import org.guess.core.utils.security.Coder;
import org.guess.core.utils.web.ServletUtils;
import org.guess.sys.model.Log;
import org.guess.sys.model.User;
import org.guess.sys.service.LogService;
import org.guess.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Controller
@RequestMapping("/")
public class LoginController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private LogService logService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		return "/front/blog/index";
	}
	
	@RequestMapping(method = RequestMethod.GET,value="/index")
	public String managerIndex() {
		return "/index";
	}

	@RequestMapping(method = RequestMethod.GET,value="/login")
	public String login() {
		return "login";
	}

	@RequestMapping(method = RequestMethod.POST,value="login")
	public String login(@RequestParam("userName") String userName, @RequestParam("password") String password,
			@RequestParam(value="rememberMe",required=false,defaultValue="false") boolean remember,HttpServletRequest request) {

		UsernamePasswordToken token = new UsernamePasswordToken(userName, Coder.encryptMD5(userName+password));
		token.setRememberMe(remember);
		Subject currentUser = SecurityUtils.getSubject();
		try {
			currentUser.login(token);
		} catch (UnknownAccountException uae) {
			System.out.println("对用户[" + userName + "]进行登录验证..验证未通过,未知账户");
			request.setAttribute("message_login", "未知账户");
		} catch (IncorrectCredentialsException ice) {
			System.out.println("对用户[" + userName + "]进行登录验证..验证未通过,错误的凭证");
			request.setAttribute("message_login", "密码不正确");
		} catch (LockedAccountException lae) {
			System.out.println("对用户[" + userName + "]进行登录验证..验证未通过,账户已锁定");
			request.setAttribute("message_login", "账户已锁定");
		} catch (ExcessiveAttemptsException eae) {
			System.out.println("对用户[" + userName + "]进行登录验证..验证未通过,错误次数过多");
			request.setAttribute("message_login", "用户名或密码错误次数过多");
		} catch (AuthenticationException ae) {
			// 通过处理Shiro的运行时AuthenticationException就可以控制用户登录失败或密码错误时的情景
			System.out.println("对用户[" + userName + "]进行登录验证..验证未通过,堆栈轨迹如下");
			ae.printStackTrace();
			request.setAttribute("message_login", "用户名或密码不正确");
		}
		// 验证是否登录成功
		if (currentUser.isAuthenticated()) {
			try {
				User curUser = userService.findByLoginId(userName);
				logService.save(new Log("系统登录", 1, "登录系统", curUser,ServletUtils.getIpAddr(request)));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/index";
		} else {
			token.clear();
		}
		return "/login";
	}
	
	/**
	 * 用户登出
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		User curUser = (User) session.getAttribute(Constants.CURRENT_USER);
		SecurityUtils.getSubject().logout();
		try {
			logService.save(new Log("系统登出", 1, "退出系统", curUser,ServletUtils.getIpAddr(request)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/login";
	}
}
