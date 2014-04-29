package org.guess.showcase.workflow.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.activiti.engine.task.Task;
import org.guess.core.Constants;
import org.guess.core.utils.FileUtils;
import org.guess.core.utils.web.ServletUtils;
import org.guess.showcase.workflow.model.Leave;
import org.guess.showcase.workflow.service.LeaveService;
import org.guess.showcase.workflow.util.WorkflowConstants;
import org.guess.sys.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/workflow/leave")
public class LeaveController extends BaseWorkFlowController {

	@Autowired
	private LeaveService leaveService;

	@RequestMapping(method = RequestMethod.GET, value = "/apply")
	public ModelAndView gotoProcessPage(ModelAndView mav) {
		mav.setViewName("/workflow/leave/apply");
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/start")
	public ModelAndView start(
			Leave leave,
			ModelAndView mav,
			@RequestParam(value = "leavefile", required = false) MultipartFile leavefile)
			throws Exception {

		String fileUuid = FileUtils.uuidFileName(leavefile.getOriginalFilename());

		// 上传文件
		File targetFile = new File(ServletUtils.getRealPath(request)
				+ "/upload/" + fileUuid);
		leavefile.transferTo(targetFile);
		
		leave.setFileName(leavefile.getOriginalFilename());
		leave.setFileId(fileUuid);

		current_user = (User) session.getAttribute(Constants.CURRENT_USER);
		leave.setSponsorLoginId(current_user.getLoginId());
		Map<String, Object> variables = new HashMap<String, Object>();
		// 设置流程发起人
		variables.put(WorkflowConstants.SPONSOR, current_user.getName());
		leaveService.startWorkflow(leave, variables);

		mav.setViewName("redirect:/workflow/process");
		return mav;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/showByTaskId")
	@ResponseBody
	public Map<String, Object> getByTaskId(@RequestParam("taskId") String taskId) {
		Map<String, Object> data = new HashMap<String, Object>();
		Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
		String userName = runtimeService.getVariable(
				task.getProcessInstanceId(), WorkflowConstants.SPONSOR)
				.toString();
		Leave leave = leaveService.getByProcessInstanceId(task
				.getProcessInstanceId());
		data.put("userName", userName);
		data.put("leave", leave);
		return data;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/deptLeaderAudit")
	public ModelAndView deptLeaderAudit(ModelAndView mav,
			@RequestParam("leaveId") String leaveId,
			@RequestParam("taskId") String taskId,
			@RequestParam("depAuditOpinion") String depAuditOpinion,
			@RequestParam("deptLeaderPass") Boolean deptLeaderPass)
			throws Exception {

		mav.setViewName("redirect:/workflow/todoTasks");
		Leave leave = leaveService.get(Long.valueOf(leaveId));
		leave.setDepAuditOpinion(depAuditOpinion);
		leaveService.save(leave);
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("deptLeaderPass", deptLeaderPass);
		taskService.complete(taskId, variables);
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/hrAudit")
	public ModelAndView hrAudit(ModelAndView mav,
			@RequestParam("leaveId") String leaveId,
			@RequestParam("taskId") String taskId,
			@RequestParam("hrAuditOpinion") String hrAuditOpinion,
			@RequestParam("hrPass") Boolean hrPass) throws Exception {

		mav.setViewName("redirect:/workflow/todoTasks");
		Leave leave = leaveService.get(Long.valueOf(leaveId));
		leave.setHrAuditOpinion(hrAuditOpinion);
		leaveService.save(leave);
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("hrPass", hrPass);
		taskService.complete(taskId, variables);
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/modifyApply")
	public ModelAndView modifyApply(Leave leave, ModelAndView mav,
			@RequestParam("reApply") Boolean reApply,
			@RequestParam("taskId") String taskId) throws Exception {

		mav.setViewName("redirect:/workflow/todoTasks");
		leaveService.save(leave);
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("reApply", reApply);
		taskService.complete(taskId, variables);
		return mav;
	}

}
