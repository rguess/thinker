package org.guess.sys.controller;

import java.util.HashSet;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.guess.core.web.BaseController;
import org.guess.sys.model.Resource;
import org.guess.sys.model.Role;
import org.guess.sys.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/sys/role/")
public class RoleController extends BaseController<Role, RoleService> {

	{
		editView = "/sys/role/edit";
		listView = "/sys/role/list";
		showView = "/sys/role/show";
	}

	@Autowired
	private RoleService roleService;

	@RequestMapping("isAvailable")
	public @ResponseBody boolean isRoleNameAvailable(@RequestParam("name") String id,
			@RequestParam("oldValue") String old) {
		if (id.equals(old))
			return true;
		Role r = roleService.findUniqueBy("name", id);
		return r == null;
	}
	
	@Override
	public String create(Role role) throws Exception {
		String recIds = request.getParameter("recids");
		String[] ids = StringUtils.split(recIds,",");
		Set<Resource> rcs = new HashSet<Resource>();
		for (String rid : ids) {
			Resource resource = new Resource();
			resource.setId(Long.valueOf(rid));
			rcs.add(resource);
		}
		role.setResources(rcs);
		return super.create(role);
	}

}
