package org.guess.showcase.finance.controller;

import org.guess.core.web.BaseController;
import org.guess.showcase.finance.model.Finance;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.util.JSONPObject;


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
	
	@RequestMapping(value="/jsonp.json")
	@ResponseBody
	public JSONPObject gethyinfo(ModelMap map,@RequestParam String callback){
	    map.put("pi", "hello,I'm Fjt");
	    JSONPObject obj = new JSONPObject(callback, map);
	    System.out.println(obj.getFunction());
	    return new JSONPObject(callback, map);
	}
	
	
	
}
