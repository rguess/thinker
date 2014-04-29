package ${packageName}.${moduleName}.controller;

import ${packageName}.${moduleName}.service.${ClassName}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * ${functionName}Entity
 * @author ${classAuthor}
 * @version ${classVersion}
 */
@Controller
@RequestMapping("/${moduleName}/${className}")
public class ${ClassName}Controller {
	
	@Autowired
	private ${ClassName}Service ${className}Service;
}