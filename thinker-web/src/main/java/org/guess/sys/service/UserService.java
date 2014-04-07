package org.guess.sys.service;

import org.guess.core.service.BaseService;
import org.guess.sys.model.User;

public interface UserService extends BaseService<User, Long>{

	User findByLoginId(String loginId);

	int changeUserStatus(Long id);
	
	void save(User user , String[] roleIds , String oldpwd) throws Exception;
}
