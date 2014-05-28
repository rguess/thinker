package org.guess.showcase.cms.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.guess.core.orm.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 站点Entity
 * @author rguess
 * @version 2014-05-15
 */
@Entity
@Table(name = "cms_site")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Site extends IdEntity {

	/**
	 * 站点名称
	 */
	private String name;
	/**
	 * 站点标题
	 */
	private String title;
	/**
	 * 站点logo
	 */
	private String logo;
	/**
	 * 描述
	 */
	private String description;
	/**
	 * 关键字
	 */
	private String keywords;
	/**
	 * 主题
	 */
	private String theme;
	/**
	 * 版权信息
	 */
	private String copyright;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	
	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}
	
	public String getCopyright() {
		return copyright;
	}

	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}
	
	
}