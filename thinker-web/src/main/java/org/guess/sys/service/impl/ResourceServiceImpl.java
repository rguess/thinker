package org.guess.sys.service.impl;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.dao.ResourceDao;
import org.guess.sys.model.Resource;
import org.guess.sys.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResourceServiceImpl extends BaseServiceImpl<Resource, Long, ResourceDao> implements ResourceService {

	@Autowired
	public ResourceDao resDao;

}