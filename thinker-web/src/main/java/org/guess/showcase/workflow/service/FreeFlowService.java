package org.guess.showcase.workflow.service;

import java.util.Map;

import org.guess.sys.model.User;

public interface FreeFlowService {

	void startWorkFlow(User current_user, Map<String, Object> variables);

}
