package org.guess.showcase.finance.controller;

import org.guess.core.web.BaseController;
import org.guess.showcase.finance.model.Finance;
import org.guess.showcase.finance.service.FinanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/finance")
public class FinanceController extends BaseController<Finance, FinanceService>{
	
	{
		editView = "/finance/edit";
		listView = "/finance/list";
		showView = "/finance/show";
	}
	
	@Autowired
	private FinanceService fService;
	
	@RequestMapping(value="/analyze",method=RequestMethod.GET)
	public ModelAndView analyze(ModelAndView mav){
		mav.setViewName("/finance/analyze");
		return mav;
	}
	
	
	
}
