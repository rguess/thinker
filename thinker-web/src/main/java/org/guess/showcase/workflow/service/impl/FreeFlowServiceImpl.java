package org.guess.showcase.workflow.service.impl;

import java.util.Map;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.guess.core.service.BaseServiceImpl;
import org.guess.showcase.workflow.model.Leave;
import org.guess.showcase.workflow.service.FreeFlowService;
import org.guess.sys.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreeFlowServiceImpl extends BaseServiceImpl<Leave, Long>
		implements FreeFlowService {
	
	private final static String PROCESS_KEY = "freeLeave";
	
	@Autowired
	private IdentityService identityService;
	
	@Autowired
	private RuntimeService runtimeService;

	@Override
	public void startWorkFlow(User current_user, Map<String, Object> variables) {
		identityService.setAuthenticatedUserId(current_user.getLoginId());
		runtimeService.startProcessInstanceByKey(PROCESS_KEY, variables);
	}
}