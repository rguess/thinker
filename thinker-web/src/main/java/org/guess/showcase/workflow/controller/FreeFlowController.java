package org.guess.showcase.workflow.controller;

import java.util.HashMap;
import java.util.Map;

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
	public ModelAndView start(ModelAndView mav,@RequestParam(value = "reason") String reason
			,@RequestParam(value = "approvalUser") String approvalUser)throws Exception {
		current_user = (User) session.getAttribute(Constants.CURRENT_USER);
		Map<String, Object> variables = new HashMap<String, Object>();
		// 设置流程发起人
		variables.put(WorkflowConstants.SPONSOR, current_user.getName());
		variables.put("reason", reason);
		variables.put("approvalUser", approvalUser);
		
		freeService.startWorkFlow(current_user,variables);
		
		mav.setViewName("redirect:/workflow/process");
		return mav;
	}

}
