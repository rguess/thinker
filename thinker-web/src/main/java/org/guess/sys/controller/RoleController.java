package org.guess.sys.controller;

import com.fasterxml.jackson.annotation.JsonView;
import org.apache.commons.lang.StringUtils;
import org.guess.core.orm.Page;
import org.guess.core.web.BaseController;
import org.guess.sys.model.Resource;
import org.guess.sys.model.Role;
import org.guess.sys.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/sys/role/")
public class RoleController extends BaseController<Role> {

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
	
	@Override
	@JsonView(Role.RoleBasicInfoView.class)
	public Map<String, Object> page(Page<Role> page, HttpServletRequest request) {
		return super.page(page, request);
	}

}
