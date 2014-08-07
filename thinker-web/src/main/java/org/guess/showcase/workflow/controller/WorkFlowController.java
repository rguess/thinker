package org.guess.showcase.workflow.controller;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.impl.bpmn.diagram.ProcessDiagramGenerator;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.Execution;
import org.activiti.engine.runtime.ProcessInstance;
import org.guess.core.Constants;
import org.guess.core.orm.Page;
import org.guess.core.orm.PageRequest;
import org.guess.sys.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 工作流通用处理Controller
 * @author guess
 *
 */
@Controller
@RequestMapping("/workflow")
public class WorkFlowController extends BaseWorkFlowController {

	/**
	 * 跳转到选择发起流程页面
	 * 
	 * @param mav
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/process")
	public ModelAndView gotoProcessPage(ModelAndView mav) throws Exception {
		mav.setViewName("/workflow/process");
		return mav;
	}

	/**
	 * 跳转到我发起的流程刘表页面
	 * 
	 * @param mav
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/myprocess")
	public ModelAndView getMyProcessPage(ModelAndView mav) {
		mav.setViewName("/workflow/myprocess");
		return mav;
	}

	/**
	 * 获取当前用户的流程数据
	 * 
	 * @return json
	 */
	@RequestMapping(value = "/myprocess/page/{status}")
	@ResponseBody
	public Map<String, Object> myprocess(@PathVariable("status") String status,Page<Map<String, String>> page) {
		current_user = (User) session.getAttribute(Constants.CURRENT_USER);
		if(status.equals("running")){
			page = workflowService.pageRuningProcessceByUserId(current_user.getLoginId(),page);
		}else if(status.equals("his")){
			page = workflowService.pageHisProcessceByUserId(current_user.getLoginId(),page);
		}
		return page.returnMap();
	}

	/**
	 * 跳转到待办任务页面
	 * 
	 * @param mav
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/todoTasks")
	public ModelAndView toTasks(ModelAndView mav) {
		mav.setViewName("/workflow/todoTasks");
		return mav;
	}

	/**
	 * 获取待办任务数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/todoTasks/page")
	@ResponseBody
	public Map<String, Object> toTasks() {
		current_user = (User) session.getAttribute(Constants.CURRENT_USER);
		Page<Map<String, String>> page = workflowService.getTodoTasks(current_user.getLoginId(),
				new Page<Map<String, String>>(new PageRequest(1, 100)));
		return page.returnMap();
	}
	
	/**
	 * 跳转到已办任务页面
	 * 
	 * @param mav
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/hasTodo")
	public ModelAndView hasTodo(ModelAndView mav) {
		mav.setViewName("/workflow/hasTodo");
		return mav;
	}
	
	/**
	 * 获取已办任务数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/hasTodo/page")
	@ResponseBody
	public Map<String, Object> hasTodo(Page<Map<String, String>> page) {
		current_user = (User) session.getAttribute(Constants.CURRENT_USER);
		page = workflowService.getHasTodoTasks(current_user.getLoginId(),page);
		return page.returnMap();
	}

	/**
	 * 签收任务
	 * 
	 * @param taskId
	 * @return
	 */
	@RequestMapping(value = "/task/claim/{id}")
	@ResponseBody
	public String claim(@PathVariable("id") String taskId) {
		current_user = (User) session.getAttribute(Constants.CURRENT_USER);
		taskService.claim(taskId, current_user.getLoginId());
		return "success";
	}

	/**
	 * 动态的跳转到流程办理页面
	 * @param mav
	 * @param taskId
	 * @param definitionKey
	 * @param taskKey
	 * @return
	 */
	@RequestMapping(value = "/task/handle/{definitionKey}/{taskKey}/{taskId}")
	public ModelAndView handleTask(ModelAndView mav,
			@PathVariable("definitionKey") String definitionKey, 
			@PathVariable("taskKey") String taskKey,
			@PathVariable("taskId") String taskId) {
				
		mav.setViewName("/workflow/"+definitionKey+"/"+taskKey);
		mav.addObject("taskId",taskId);
		return mav;

	}
	
	/**
     * 读取资源，通过流程ID
     *
     * @param resourceType      资源类型(xml|image)
     * @param processInstanceId 流程实例ID
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/resource/process-instance")
    public void loadByProcessInstance(@RequestParam("type") String resourceType, @RequestParam("pid") String processInstanceId, HttpServletResponse response)
            throws Exception {
        InputStream resourceAsStream = null;
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(processInstance.getProcessDefinitionId())
                .singleResult();

        String resourceName = "";
        if (resourceType.equals("image")) {
            resourceName = processDefinition.getDiagramResourceName();
        } else if (resourceType.equals("xml")) {
            resourceName = processDefinition.getResourceName();
        }
        resourceAsStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), resourceName);
        byte[] b = new byte[1024];
        int len = -1;
        while ((len = resourceAsStream.read(b, 0, 1024)) != -1) {
            response.getOutputStream().write(b, 0, len);
        }
    }
    
    /**
     * 读取带跟踪的图片
     */
    @RequestMapping(value = "/process/trace/auto/{executionId}")
    public void readResource(@PathVariable("executionId") String executionId, HttpServletResponse response)
            throws Exception {
    	Execution execution = runtimeService.createExecutionQuery().executionId(executionId).singleResult();
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(execution.getProcessInstanceId()).singleResult();
        BpmnModel bpmnModel = repositoryService.getBpmnModel(processInstance.getProcessDefinitionId());
        List<String> activeActivityIds = runtimeService.getActiveActivityIds(executionId);
        Context.setProcessEngineConfiguration(processEngine.getProcessEngineConfiguration());
        InputStream imageStream = ProcessDiagramGenerator.generateDiagram(bpmnModel, "png", activeActivityIds);
        byte[] b = new byte[1024];
        int len;
        while ((len = imageStream.read(b, 0, 1024)) != -1) {
            response.getOutputStream().write(b, 0, len);
        }
    }
}
