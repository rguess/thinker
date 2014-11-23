package org.guess.showcase.qixiu.controller;

import org.guess.core.orm.Page;
import org.guess.core.orm.PropertyFilter;
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
        Page<Record> pageData = recordService.findPage(page, filters);
        page.setOrderBy("latestDate");
        page.setOrderDir("desc");
        return pageData.returnMap();
    }
}