package org.guess.sys.service.impl;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.dao.RoleDao;
import org.guess.sys.model.Role;
import org.guess.sys.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl extends BaseServiceImpl<Role, Long, RoleDao> implements RoleService {

	@Autowired
	public RoleDao roleDao;

}