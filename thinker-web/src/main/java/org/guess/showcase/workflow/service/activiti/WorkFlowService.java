package org.guess.showcase.workflow.service.activiti;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.history.HistoricTaskInstanceQuery;
import org.activiti.engine.impl.persistence.entity.HistoricIdentityLinkEntity;
import org.activiti.engine.impl.persistence.entity.IdentityLinkEntity;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.NativeProcessInstanceQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.guess.core.orm.Page;
import org.guess.core.utils.DateUtil;
import org.guess.showcase.workflow.util.WorkflowConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 工作流相关service
 * 
 * @author guess
 */
@Service
public class WorkFlowService {

	protected Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private RuntimeService runtimeService;

	@Autowired
	private RepositoryService repositoryService;

	@Autowired
	private HistoryService historyService;

	@Autowired
	private TaskService taskService;

	@Autowired
	private IdentityService identityService;

	@Autowired
	private ManagementService managementService;

	/**
	 * 根据用户ID获取流程实例和流程定义---------运行中
	 * 
	 * @param userId
	 */
	public Page<Map<String, String>> pageRuningProcessceByUserId(String sponsor,
			Page<Map<String, String>> page) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		// 读取流程实例

		// 第一种方式,根据流程变量回去，不好，因为bpm.xml文件中 必须设置activiti:initiator="applyUserId"
		/*
		 * ProcessInstanceQuery query =
		 * runtimeService.createProcessInstanceQuery
		 * ().variableValueEquals("applyUserId", sponsor);
		 */
		// 第二种方式根据,根据activiti原生sql查询
		String str = "from "
				+ managementService.getTableName(ProcessInstance.class)
				+ " as P "
				+ " left join "
				+ managementService.getTableName(IdentityLinkEntity.class)
				+ " as I on P.PROC_INST_ID_ = I.PROC_INST_ID_ where I.TYPE_ = 'starter' and I.USER_ID_ = '"
				+ sponsor + "' and P.IS_ACTIVE_ = 1";
		String queryStr = "select * " + str;
		String countStr = "select count(*) " + str;
		NativeProcessInstanceQuery dataQuery = runtimeService.createNativeProcessInstanceQuery().sql(queryStr);
		long count = runtimeService.createNativeProcessInstanceQuery().sql(countStr).count();
		List<ProcessInstance> instances = dataQuery.listPage((page.getPageNo()-1)*page.getPageSize(), page.getPageSize());
		for (ProcessInstance instance : instances) {
			Map<String, String> map = new HashMap<String, String>();
			// 读取流程定义对象
			ProcessDefinition definition = this.getDefinitionById(instance
					.getProcessDefinitionId());
			// 读取任务对象
			Task task = taskService.createTaskQuery()
					.processInstanceId(instance.getProcessInstanceId()).singleResult();
			map.put("taskname", task.getName());
			map.put("instanceId", instance.getId());
			map.put("definitionName", definition.getName());
			map.put("definitionKey", definition.getKey());
			map.put("definitionVersion", definition.getVersion() + "");
			list.add(map);
		}
		page.setTotalItems(count);
		page.setResult(list);
		return page;
	}
	
	/**
	 * 根据用户ID获取流程实例和流程定义---------已结束
	 * 
	 * @param userId
	 */
	public Page<Map<String, String>> pageHisProcessceByUserId(String sponsor, Page<Map<String, String>> page) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		String str = "from "
				+ managementService.getTableName(HistoricProcessInstance.class)
				+ " as P "
				+ " left join "
				+ managementService.getTableName(HistoricIdentityLinkEntity.class)
				+ " as I on P.PROC_INST_ID_ = I.PROC_INST_ID_ where I.TYPE_ = 'starter' and I.USER_ID_ = '"
				+ sponsor + "' and P.END_ACT_ID_ is not null";
		String queryStr = "select * " + str;
		String countStr = "select count(*) " + str;
		
		List<HistoricProcessInstance> instances = historyService.createNativeHistoricProcessInstanceQuery()
				.sql(queryStr).listPage((page.getPageNo()-1)*page.getPageSize(), page.getPageSize());
		long count = historyService.createNativeHistoricProcessInstanceQuery().sql(countStr).count();
		for (HistoricProcessInstance instance : instances) {
			Map<String, String> map = new HashMap<String, String>();
			// 读取流程定义对象
			ProcessDefinition definition = this.getDefinitionById(instance
					.getProcessDefinitionId());
			map.put("instanceId", instance.getId());
			map.put("definitionName", definition.getName());
			map.put("definitionKey", definition.getKey());
			map.put("definitionVersion", definition.getVersion() + "");
			list.add(map);
		}
		page.setTotalItems(count);
		page.setResult(list);
		return page;
	}

	/**
	 * 待办
	 * 
	 * @param string
	 * @param page
	 * @return
	 */
	public Page<Map<String, String>> getTodoTasks(String LoginId,
			Page<Map<String, String>> page) {
		List<Task> tasks = new ArrayList<Task>();
		// 已签收任务
		List<Task> list1 = taskService.createTaskQuery().taskAssignee(LoginId)
				.active().orderByTaskId().desc().list();
		// 未签收的任务
		List<Task> list2 = taskService.createTaskQuery()
				.taskCandidateUser(LoginId).active().orderByTaskId().desc()
				.list();
		tasks.addAll(list1);
		tasks.addAll(list2);
		return initTodoData(tasks, page);
	}

	/**
	 * 已办
	 * 
	 * @param string
	 * @param page
	 * @return
	 */
	public Page<Map<String, String>> getHasTodoTasks(String loginId,
			Page<Map<String, String>> page) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		HistoricTaskInstanceQuery query = historyService.createHistoricTaskInstanceQuery()
				.taskCompletedBefore(new Date()).taskAssignee(loginId);
		List<HistoricTaskInstance> tasks =  query.listPage((page.getPageNo()-1)*page.getPageSize(), page.getPageSize());
		long count = query.count();
		for (HistoricTaskInstance task : tasks) {

			Map<String, String> map = new HashMap<String, String>();
			// 读取流程定义对象
			ProcessDefinition definition = this.getDefinitionById(task
					.getProcessDefinitionId());
			// 获取流程变量保存的发起人中文名字,加入到输出数据中
			String userName = historyService
					.createHistoricVariableInstanceQuery()
					.processInstanceId(task.getProcessInstanceId())
					.variableName(WorkflowConstants.SPONSOR).singleResult().getValue().toString();
			// 流程发起人
			map.put("sponsor", userName);
			// 任务ID
			map.put("id", task.getId());
			// 任务key
			map.put("taskKey", task.getTaskDefinitionKey());
			// 流程定义名称
			map.put("definitionName", definition.getName());
			// 流程定义key
			map.put("definitionKey", definition.getKey());
			// 任务名称
			map.put("taskName", task.getName());
			// 流程定义ID
			map.put("processDefinitionId", task.getProcessDefinitionId());
			// 流程实例ID
			map.put("processInstanceId", task.getProcessInstanceId());
			// 优先级
			map.put("priority", task.getPriority() + "");
			// 任务开始时间
			map.put("startTime",
					DateUtil.format(task.getStartTime(), "yyyy-MM-dd HH:mm:ss"));
			// 任务结束时间
			map.put("endTime",
					DateUtil.format(task.getEndTime(), "yyyy-MM-dd HH:mm:ss"));
			// 任务描述
			map.put("description", task.getDescription());
			// owner
			map.put("owner", task.getOwner());
			// 代理人
			map.put("assignee", task.getAssignee());
			list.add(map);
		}
		page.setTotalItems(count);
		page.setResult(list);
		return page;
	}

	/**
	 * 组装待办数据
	 * 
	 * @param tasks
	 * @param page
	 * @return
	 */
	private Page<Map<String, String>> initTodoData(List<Task> tasks,
			Page<Map<String, String>> page) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		for (Task task : tasks) {

			Map<String, String> map = new HashMap<String, String>();
			// 读取流程定义对象
			ProcessDefinition definition = this.getDefinitionById(task
					.getProcessDefinitionId());
			// 获取流程变量保存的发起人中文名字,加入到输出数据中
			String userName = runtimeService.getVariable(
					task.getProcessInstanceId(), WorkflowConstants.SPONSOR)
					.toString();
			// 流程发起人
			map.put("sponsor", userName);
			// 任务ID
			map.put("id", task.getId());
			// 任务key
			map.put("taskKey", task.getTaskDefinitionKey());
			// 流程定义名称
			map.put("definitionName", definition.getName());
			// 流程定义key
			map.put("definitionKey", definition.getKey());
			// 任务名称
			map.put("taskName", task.getName());
			// 流程定义ID
			map.put("processDefinitionId", task.getProcessDefinitionId());
			// 流程实例ID
			map.put("processInstanceId", task.getProcessInstanceId());
			// 优先级
			map.put("priority", task.getPriority() + "");
			// 任务开始时间
			map.put("createTime", DateUtil.format(task.getCreateTime(),
					"yyyy-MM-dd HH:mm:ss"));
			// 逾期时间
			map.put("dueDate",
					DateUtil.format(task.getDueDate(), "yyyy-MM-dd HH:mm:ss"));
			// 任务描述
			map.put("description", task.getDescription());
			// owner
			map.put("owner", task.getOwner());
			// 代理人
			map.put("assignee", task.getAssignee());
			list.add(map);
		}
		page.setTotalItems(tasks.size());
		page.setResult(list);
		return page;
	}

	/**
	 * 根据流程定义ID读取流程定义对象
	 * 
	 * @param id
	 * @return
	 */
	private ProcessDefinition getDefinitionById(String id) {
		ProcessDefinition definition = repositoryService
				.createProcessDefinitionQuery().processDefinitionId(id)
				.singleResult();
		return definition;
	}

	/**
	 * 根据流程实例ID读取流程实例
	 * 
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unused")
	private ProcessInstance getInstanceById(String id) {
		ProcessInstance instance = runtimeService.createProcessInstanceQuery()
				.processInstanceId(id).singleResult();
		return instance;
	}
	
}
