package org.guess.showcase.workflow.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.activiti.engine.HistoryService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.guess.showcase.workflow.service.activiti.WorkFlowService;
import org.guess.sys.model.User;
import org.springframework.beans.factory.annotation.Autowired;


public class BaseWorkFlowController {

	@Autowired
	protected WorkFlowService workflowService;
	
	@Autowired
	protected TaskService taskService;
	
	@Autowired
	protected RuntimeService runtimeService;
	
	@Autowired
	protected RepositoryService repositoryService;
	
	@Autowired
	protected HistoryService historyService;

	@Autowired
	protected HttpServletRequest request;
	
	@Autowired
	protected HttpSession session;
	
	@Autowired
	protected ProcessEngineFactoryBean processEngine;
	
	/**
	 * 当前登录用户key
	 */
	protected User current_user;
	
}
