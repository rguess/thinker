package org.guess.showcase.workflow.service;

import java.util.Map;

import org.guess.core.service.BaseService;
import org.guess.showcase.workflow.model.Leave;

public interface LeaveService extends BaseService<Leave, Long>{

	void startWorkflow(Leave leave, Map<String, Object> variables);

	Leave getByProcessInstanceId(String processInstanceId);

}
