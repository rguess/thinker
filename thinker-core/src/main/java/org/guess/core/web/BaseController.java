package org.guess.core.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.guess.core.orm.Page;
import org.guess.core.orm.PropertyFilter;
import org.guess.core.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * springmvc Controller基类,通过泛型实现基本的增删查改、ajax返回列表数据以及简单的属性查询
 * 
 * 例：
 * List page     : GET /user/
 * Create page   : GET /user/create
 * Create action : POST /user/edit
 * Update page   : GET /user/update/{id}
 * Update action : POST /user/edit
 * Delete action : GET /user/delete/{id}
 * Delete action : POST /user/delete
 * show page     : GET /user/show/{id}
 * 
 * @author rguess
 */
public abstract class BaseController<T> {

	protected final static String REDIRECT = "redirect:";
	protected final static String SUCCESS = "success";
	

	protected String listView = null;
	protected String editView = null;
	protected String showView = null;
	
	@Autowired
	protected HttpServletRequest request;
	
	@Autowired
	protected HttpSession session;
	
	@Autowired
	private BaseService<T, Long> baseService;

	/**
	 * 跳转到添加页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/create")
	public ModelAndView create() throws Exception{
		ModelAndView mav = new ModelAndView(editView);
		return mav;
	}
	
	/**
	 * 添加
	 * @param object
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/edit")
	public String create(@Valid T object) throws Exception {
		baseService.save(object);
		return REDIRECT + listView;
	}

	/**
	 * 跳转到更新页面
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/update/{id}")
	public ModelAndView update(@PathVariable("id") Long id) throws Exception {
		T obj = baseService.get(id);
		ModelAndView mav = new ModelAndView(editView);
		mav.addObject("obj", obj);
		return mav;
	}

	/**
	 * 删除
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete/{id}")
	public String delete(@PathVariable("id") Long id) throws Exception {
		baseService.removeById(id);
		return REDIRECT+listView;
	}
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value = "/delete",method=RequestMethod.POST)
	public String delete(@RequestParam("ids") Long[] ids , HttpServletRequest request) throws Exception {
		baseService.removeByIds(ids);
		return REDIRECT+listView;
	}
	
	/**
	 * 展示
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/show/{id}")
	public ModelAndView show(@PathVariable("id") Long id) throws Exception{
		T object = baseService.get(id);
		ModelAndView mav = new ModelAndView(showView);
		mav.addObject("obj", object);
		return mav;
	}
	
	/**
	 * 返回分页json数据
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping("/page")
	public @ResponseBody Map<String,Object> page(Page<T> page,HttpServletRequest request){
		Page<T> pageData = baseService.findPage(page, PropertyFilter.buildFromHttpRequest(request, "search"));
		return pageData.returnMap();
	}
	
	@RequestMapping(value = "/*")
	public String list(){
		return listView;
	}
	
}
