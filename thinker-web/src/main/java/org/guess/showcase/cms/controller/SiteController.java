package org.guess.showcase.cms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.guess.core.web.BaseController;
import org.guess.showcase.cms.model.Site;
import org.guess.showcase.cms.service.SiteService;
import org.guess.showcase.cms.util.CmsUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 站点controller
 * @author rguess
 * @version 2014-05-15
 */
@Controller
@RequestMapping("/cms/site")
public class SiteController extends BaseController<Site>{

	{
		editView = "/cms/site/edit";
		listView = "/cms/site/list";
		showView = "/cms/site/show";
	}
	
	@Autowired
	private SiteService siteService;
	
	@RequestMapping(method=RequestMethod.GET,value="/getAll")
	@ResponseBody
	public List<Site> getAll() throws Exception{
		List<Site> sites = siteService.getAll();
		return sites;
	}
	
	@RequestMapping(method=RequestMethod.GET,value="/changeSite")
	@ResponseBody
	public String changeSite(HttpServletRequest request,@RequestParam("name") String name){
		CmsUtil.changeSite(request,name);
		return "success";
	}
}