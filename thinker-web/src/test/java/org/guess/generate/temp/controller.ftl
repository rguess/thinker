package ${packageName}.${moduleName}.controller;

import org.guess.core.web.BaseController;
import ${packageName}.${moduleName}.model.${ClassName};
import ${packageName}.${moduleName}.service.${ClassName}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * ${functionName}controller
 * @author ${classAuthor}
 * @version ${classVersion}
 */
@Controller
@RequestMapping("/${moduleName}/${className}")
public class ${ClassName}Controller extends BaseController<${ClassName}>{

	{
		editView = "/sys/${className}/edit";
		listView = "/sys/${className}/list";
		showView = "/sys/${className}/show";
	}
	
	@Autowired
	private ${ClassName}Service ${className}Service;
}