package org.guess.showcase.workflow.service.impl;

import java.util.Map;

import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.guess.core.service.BaseServiceImpl;
import org.guess.showcase.workflow.dao.LeaveDao;
import org.guess.showcase.workflow.model.Leave;
import org.guess.showcase.workflow.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LeaveServiceImpl extends BaseServiceImpl<Leave, Long>
		implements LeaveService {
	
	private final static String PROCESS_KEY = "leave";

	@Autowired
	public LeaveDao leaveDao;

	@Autowired
	private RuntimeService runtimeService;

	@Autowired
	private TaskService taskService;

	@Autowired
	private HistoryService historyService;

	@Autowired
	private RepositoryService repositoryService;

	@Autowired
	private IdentityService identityService;

	@Override
	public void startWorkflow(Leave leave,
			Map<String, Object> variables) {
		leaveDao.save(leave);
		String businessKey = leave.getId().toString();
		ProcessInstance processInstance = null;
		// 用来设置启动流程的人员ID，引擎会自动把用户ID保存到activiti:initiator中
		identityService.setAuthenticatedUserId(leave.getSponsorLoginId());
		processInstance = runtimeService.startProcessInstanceByKey(PROCESS_KEY,businessKey, variables);
		String processInstanceId = processInstance.getId();
		leave.setProcessInstanceId(processInstanceId);
	}

	@Override
	public Leave getByProcessInstanceId(String processInstanceId) {
		return leaveDao.findUniqueBy("processInstanceId", processInstanceId);
	}

}