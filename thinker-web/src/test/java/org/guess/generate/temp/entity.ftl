package ${packageName}.${moduleName}.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.guess.core.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * ${functionName}Entity
 * @author ${classAuthor}
 * @version ${classVersion}
 */
@Entity
@Table(name = "${tableName}")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ${ClassName} extends IdEntity {

	<#list fields as item>
	/**
	 * ${item.value}
	 */
	private ${item.type} ${item.name};
	</#list>
	
	<#list fields as item>
	public ${item.type} get${item.name?cap_first}() {
		return ${item.name};
	}

	public void set${item.name?cap_first}(String ${item.name}) {
		this.${item.name} = ${item.name};
	}
	
	</#list>
	
}