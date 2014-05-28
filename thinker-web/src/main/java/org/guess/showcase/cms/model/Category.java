package org.guess.showcase.cms.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.guess.core.orm.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.google.common.collect.Lists;

/**
 * 栏目entityEntity
 * @author rguess
 * @version 2014-05-03
 */
@Entity
@Table(name = "cms_category")
@JsonIgnoreProperties(value = { "parent"})
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Category extends IdEntity {
	
	public static final int ISSHOW_SHOW = 0;
	public static final int ISSHOW_HIDE = 1;

	/**
	 * 父级菜单
	 */
	@ManyToOne(targetEntity = Category.class,fetch = FetchType.LAZY)
    @JoinColumn(name = "PARENT_ID")
    @NotFound(action=NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Category parent;
	
	/** 等级 */
	private int grade = 1;
	
	/**
	 * 栏目模型（article：文章；picture：图片；download：下载；link：链接；special：专题）
	 */
	private String module;
	
	/**
	 * 栏目名称
	 */
	private String name;
	
	/**
	 * 栏目图片
	 */
	private String image;
	
	/**
	 * 是否显示0:显示,1:显示
	 */
	private int isShow = ISSHOW_SHOW;
	
	/**
	 * 描述，填写有助于搜索引擎优化
	 */
	private String description;
	
	/**
	 * 关键字，填写有助于搜索引擎优化
	 */
	private String keywords;
	
	/**
	 * 排序字段 ，越小越靠前
	 */
	private int orderNo = 0;
	
	/**
	 * 拥有子分类列表
	 */
	@OneToMany(targetEntity=Category.class,fetch = FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinColumn(name="PARENT_ID",updatable=false)
	@OrderBy("orderNo ASC")
	private List<Category> childList = Lists.newArrayList();
	
	/**
	 * 归属站点
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="site_id")
	@NotFound(action = NotFoundAction.IGNORE)
	private Site site;
	
	/**
	 * 栏目地址
	 * @return
	 */
	private String url;
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Site getSite() {
		return site;
	}

	public void setSite(Site site) {
		this.site = site;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getIsShow() {
		return isShow;
	}

	public void setIsShow(int isShow) {
		this.isShow = isShow;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public Category getParent() {
		return parent;
	}

	public void setParent(Category parent) {
		this.parent = parent;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public List<Category> getChildList() {
		return childList;
	}

	public void setChildList(List<Category> childList) {
		this.childList = childList;
	}
}