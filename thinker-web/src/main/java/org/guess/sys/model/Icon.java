package org.guess.sys.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.guess.core.orm.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "SYS_ICON")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Icon extends IdEntity{

	/** 标识符 */
	private String mark;
	
	/** 描述 */
	private String description;
	
	/** 类型*/
	private String type;

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
