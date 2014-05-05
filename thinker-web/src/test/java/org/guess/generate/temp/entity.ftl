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
	private String ${item};
	</#list>
	
	<#list fields as item>
	public String get${item?cap_first}() {
		return ${item};
	}

	public void set${item?cap_first}(String ${item}) {
		this.${item} = ${item};
	}
	
	</#list>
	
}