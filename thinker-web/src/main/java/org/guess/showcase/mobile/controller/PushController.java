package org.guess.showcase.mobile.controller;

import org.guess.showcase.mobile.model.Message;
import org.guess.showcase.mobile.service.PushService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mobile/push")
public class PushController {
	
	@Autowired
	private PushService pushService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView push(ModelAndView mav) throws Exception{
		mav.setViewName("/mobile/push/push");
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public String push(Message message) throws Exception{
		pushService.sendNotification(message);
		return "success";
	}
}
