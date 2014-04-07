package org.guess.sys.service.impl;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.dao.IconDao;
import org.guess.sys.model.Icon;
import org.guess.sys.service.IconService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IconServiceImpl extends BaseServiceImpl<Icon, Long, IconDao> implements IconService {

	@Autowired
	public IconDao iconDao;

}