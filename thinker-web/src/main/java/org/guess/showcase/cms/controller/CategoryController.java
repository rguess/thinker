package org.guess.showcase.cms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.guess.core.web.BaseController;
import org.guess.showcase.cms.model.Category;
import org.guess.showcase.cms.model.Site;
import org.guess.showcase.cms.service.CategoryService;
import org.guess.showcase.cms.util.CmsUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 栏目controller
 * @author rguess
 * @version 2014-05-03
 */
@Controller
@RequestMapping("/cms/category")
public class CategoryController extends BaseController<Category>{
	
	{
		editView = "/cms/category/edit";
		listView = "/cms/category/list";
		showView = "/cms/category/show";
	}
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(method=RequestMethod.GET,value="/tree")
	@ResponseBody
	public List<Category> tree(HttpServletRequest request) throws Exception{
		Site curSite = CmsUtil.getCurrentSite(request);
		List<Category> res = categoryService.listGradeOne(curSite);
		return res;
	}
	
	@RequestMapping(method=RequestMethod.GET,value="/showTree")
	@ResponseBody
	public List<Category> showTree() throws Exception{
		Site curSite = CmsUtil.getCurrentSite(request);
		List<Category> res = categoryService.listGradeTop(curSite);
		return res;
	}
	
	@Override
	public String create(Category object) throws Exception {
		Category parent = categoryService.get(object.getParent().getId());
		object.setGrade(parent.getGrade() + 1);
		object.setSite(CmsUtil.getCurrentSite(request));
		return super.create(object);
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/order")
	@ResponseBody
	public String order(@RequestParam("type") String type,@RequestParam("id") Long id){
		categoryService.order(id,type);
		return "success";
	}
	
	@Override
	public String delete(@PathVariable("id") Long id) throws Exception {
		return super.delete(id);
	}
	
}