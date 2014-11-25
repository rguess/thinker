package org.guess.showcase.qixiu.controller;

import org.guess.core.orm.Page;
import org.guess.core.orm.PageRequest;
import org.guess.core.orm.PropertyFilter;
import org.guess.core.utils.DateUtil;
import org.guess.core.web.BaseController;
import org.guess.showcase.cms.model.Comment;
import org.guess.showcase.cms.service.CommentService;
import org.guess.showcase.qixiu.model.Rdetail;
import org.guess.showcase.qixiu.model.Record;
import org.guess.showcase.qixiu.service.RdetailService;
import org.guess.showcase.qixiu.service.RecordService;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 汽修记录controller
 *
 * @author rguess
 * @version 2014-11-22 18:58:51
 */
@Controller
@RequestMapping("/qixiu/record")
public class RecordController extends BaseController<Record> {

    {
        editView = "/qixiu/record/edit";
        listView = "/qixiu/record/list";
        showView = "/qixiu/record/show";
    }

    @Autowired
    private RecordService recordService;

    @Autowired
    private RdetailService rdetailService;


    @RequestMapping(method = RequestMethod.POST, value = "/edit")
    public String create(@Valid Record object) throws Exception {
        object.setUser(UserUtil.getCurrentUser());
        rdetailService.delByRecordId(object.getId());
        recordService.save(object);
        return REDIRECT + listView;
    }

    @Override
    public Map<String, Object> page(Page<Record> page, HttpServletRequest request) {

        List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request, "search");
        filters.add(new PropertyFilter("EQL_user.id", String.valueOf(UserUtil.getCurrentUser().getId())));
        if (page.getOrderBy() == null || page.getOrderDir() == null) {
            page.setOrderBy("latestDate");
            page.setOrderDir("desc");
        }
        Page<Record> pageData = recordService.findPage(page, filters);
        return pageData.returnMap();
    }

    @RequestMapping(method = RequestMethod.GET, value = "toReminder")
    public String toReminder() {
        return "/qixiu/record/reminder";
    }

    @RequestMapping("reminder")
    @ResponseBody
    public Map<String, Object> reminder(Page<Record> page, @RequestParam("key") String key) {
        page.setPageSize(10000);
        String orderBy = page.getOrderBy();
        String orderDir = page.getOrderDir();
        page.setOrderBy("");
        page.setOrderDir("");
        String orderStr = "";
        if (orderBy != null && orderDir != null) {
            orderStr = "order by " + orderBy + " " + orderDir;
        }
        StringBuffer hql = new StringBuffer("from Rdetail where 1=1 ");
        String yearStr = "and YEAR(nextxiu) = '" + DateUtil.getYear(DateUtil.getCurrenDateTime()) + "' ";
        String monthStr = "and MONTH(nextxiu) = '" + DateUtil.getMonth(DateUtil.getCurrenDateTime()) + "' ";
        String userAndOrderStr = "and record.user.id = " + UserUtil.getCurrentUser().getId() + " " + orderStr;
        if ("month".equals(key)) {
            hql.append(yearStr).append(monthStr);
        } else if ("year".equals(key)) {
            hql.append(yearStr);
        }
        hql.append(userAndOrderStr);
        Page<Rdetail> pageData = rdetailService.findPage(page, hql.toString());
        return pageData.returnMap();
    }


}