package org.guess.sys.controller;

import java.util.List;

import org.guess.core.web.BaseController;
import org.guess.sys.model.Icon;
import org.guess.sys.service.IconService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/sys/icon")
public class IconController extends BaseController<Icon, IconService>{

	{
		editView = "/sys/icon/edit";
		listView = "/sys/icon/list";
		showView = "/sys/icon/show";
	}
	
	@Autowired
	private IconService iService;
	
	@RequestMapping("/iconSelect")
	public ModelAndView selects(ModelAndView mav) throws Exception{
		mav.setViewName("/sys/icon/iconSelect");
		return mav.addObject("icons", iService.getAll());
	}
	
	@RequestMapping("/listAll")
	@ResponseBody
	public List<Icon> listAll() throws Exception{
		return iService.getAll();
	}
	
}
