package org.guess.showcase.cms.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.guess.core.orm.Page;
import org.guess.core.orm.PropertyFilter;
import org.guess.core.web.BaseController;
import org.guess.showcase.cms.model.Link;
import org.guess.showcase.cms.service.CategoryService;
import org.guess.showcase.cms.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;

/**
 * 链接controller
 * @author rguess
 * @version 2014-05-07
 */
@Controller
@RequestMapping("/cms/link")
public class LinkController extends BaseController<Link>{

	{
		editView = "/cms/link/edit";
		listView = "/cms/";
		showView = "/cms/link/show";
	}
	
	@Autowired
	private LinkService linkService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Override
	@RequestMapping(method = RequestMethod.POST, value = "/edit")
	public String create(Link object) throws Exception {
		return super.create(object);
	};
	
	@Override
	@RequestMapping(value = "/delete",method=RequestMethod.POST)
	public String delete(@RequestParam("ids") Long[] ids , HttpServletRequest request)
			throws Exception {
		return super.delete(ids, request);
	}
	
	@Override
	public @ResponseBody
	Map<String, Object> page(Page<Link> page, HttpServletRequest request) {
		
		String categoryid = request.getParameter("categoryid");
		Set<String> cids = categoryService.getChlidIdsById(categoryid);
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request, "search");
		List<PropertyFilter> orfilters = Lists.newArrayList();
		for (String id :cids) {
			orfilters.add(new PropertyFilter("EQL_category.id", id));
		}
		Page<Link> pageData = linkService.findPage(page,filters,orfilters);
		return pageData.returnMap();
	}
}