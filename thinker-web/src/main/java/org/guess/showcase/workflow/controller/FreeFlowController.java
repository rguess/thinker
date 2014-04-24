package org.guess.showcase.workflow.controller;

import java.util.HashMap;
import java.util.Map;

import org.activiti.engine.task.Task;
import org.guess.core.Constants;
import org.guess.showcase.workflow.service.FreeFlowService;
import org.guess.showcase.workflow.util.WorkflowConstants;
import org.guess.sys.model.User;
import org.guess.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/workflow/freeLeave")
public class FreeFlowController extends BaseWorkFlowController {

	@Autowired
	private FreeFlowService freeService;

	@Autowired
	private UserService userService;

	@RequestMapping(method = RequestMethod.GET, value = "/apply")
	public ModelAndView gotoProcessPage(ModelAndView mav) throws Exception {
		mav.addObject("users", userService.getAll());
		mav.setViewName("/workflow/freeLeave/apply");
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/start")
	public ModelAndView start(ModelAndView mav,
			@RequestParam(value = "reason") String reason,
			@RequestParam(value = "approvalUser") String approvalUser)
			throws Exception {
		current_user = (User) session.getAttribute(Constants.CURRENT_USER);
		Map<String, Object> variables = new HashMap<String, Object>();
		// 设置流程发起人
		variables.put(WorkflowConstants.SPONSOR, current_user.getName());
		variables.put("reason", reason);
		variables.put("approvalUser", approvalUser);

		freeService.startWorkFlow(current_user, variables);

		mav.setViewName("redirect:/workflow/process");
		return mav;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/showByTaskId")
	@ResponseBody
	public Map<String, Object> getByTaskId(@RequestParam("taskId") String taskId) {
		Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
		Map<String, Object> variables = runtimeService.getVariables(task
				.getExecutionId());
		return variables;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/complete")
	public ModelAndView complete(ModelAndView mav,
			@RequestParam(value = "auditOpinion") String auditOpinion,
			@RequestParam("taskId") String taskId,
			@RequestParam(value = "approvalUser") String approvalUser,
			@RequestParam(value = "handle") String handle)
			throws Exception {

		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("auditOpinion", auditOpinion);
		if(handle.equals("agree")){
			variables.put("approvalUser", approvalUser);
			variables.put("endTag", false);
		}else if(handle.equals("agreeAndEnd")){
			variables.put("endTag", true);
			variables.put("auditerPass", true);
		}else if(handle.equals("reject")){
			variables.put("endTag", true);
			variables.put("auditerPass", false);
		}
		taskService.complete(taskId, variables);
		mav.setViewName("redirect:/workflow/todoTasks");
		return mav;
	}

}
