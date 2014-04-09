package org.guess.showcase.finance.controller;

import org.guess.core.web.BaseController;
import org.guess.showcase.finance.model.Finance;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/finance")
public class FinanceController extends BaseController<Finance>{
	
	{
		editView = "/finance/edit";
		listView = "/finance/list";
		showView = "/finance/show";
	}
	
	@RequestMapping(value="/analyze",method=RequestMethod.GET)
	public ModelAndView analyze(ModelAndView mav){
		mav.setViewName("/finance/analyze");
		return mav;
	}
	
	
	
}
