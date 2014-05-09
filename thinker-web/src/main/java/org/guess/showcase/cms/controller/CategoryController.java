package org.guess.showcase.cms.controller;

import java.util.List;

import org.guess.core.web.BaseController;
import org.guess.showcase.cms.model.Category;
import org.guess.showcase.cms.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(method=RequestMethod.GET,value="/tree")
	@ResponseBody
	public List<Category> tree() throws Exception{
		List<Category> res = categoryService.findBy("grade", 1);
		return res;
	}
	
	@RequestMapping(method=RequestMethod.GET,value="/showTree")
	@ResponseBody
	public List<Category> showTree() throws Exception{
		List<Category> res = categoryService.findBy("grade", 0);
		return res;
	}
	
	@Override
	public String create(Category object) throws Exception {
		Category parent = categoryService.get(object.getParent().getId());
		object.setGrade(parent.getGrade() + 1);
		return super.create(object);
	}
	
}