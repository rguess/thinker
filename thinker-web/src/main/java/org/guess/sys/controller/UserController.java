package org.guess.sys.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.guess.core.web.BaseController;
import org.guess.sys.model.Role;
import org.guess.sys.model.User;
import org.guess.sys.service.RoleService;
import org.guess.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/sys/user")
public class UserController extends BaseController<User> {

	{
		editView = "/sys/user/edit";
		listView = "/sys/user/list";
		showView = "/sys/user/show";
	}

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@RequestMapping("isAvailable")
	public @ResponseBody
	boolean isLoginIdAvailable(@RequestParam("loginId") String id, @RequestParam("oldValue") String old) {
		if (id.equals(old))
			return true;
		User u = userService.findUniqueBy("loginId", id);
		return u == null;
	}

	@Override
	public ModelAndView create() throws Exception {
		ModelAndView mav = new ModelAndView(editView);
		List<Role> roles = roleService.getAll();
		mav.addObject("roles", roles);
		return mav;
	}

    @Override
	public String create(User user) throws Exception {
		String oldpwd = request.getParameter("oldpwd");
		String[] roleIds = request.getParameterValues("roleIds");
		userService.save(user,roleIds,oldpwd);
		return REDIRECT + listView;
	}
	
	@Override
    @RequiresPermissions("sys:user:update")
	public ModelAndView update(@PathVariable("id") Long id) throws Exception {
		ModelAndView mav = new ModelAndView(editView);
		List<Role> roles = roleService.getAll();
		mav.addObject("roles", roles);
		User obj = userService.get(id);
		mav.addObject("obj", obj);
		return mav;
	}
	
	/**
	 * 更改用户状态
	 */
	@RequestMapping(value="changeUserStatus",method=RequestMethod.POST)
	@ResponseBody
	public int changeUserStatus(@RequestParam("id") Long id){
		return userService.changeUserStatus(id);
	}
	
	/**
	 * 获取所有用户
	 * @throws Exception 
	 */
	@RequestMapping(value="getAllUsers")
	@ResponseBody
	public List<User> getAllUsers() throws Exception{
		return userService.getAll();
	}
	
	
}