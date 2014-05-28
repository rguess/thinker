package org.guess.showcase.cms.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.guess.core.orm.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 链接Entity
 * @author rguess
 * @version 2014-05-07
 */
@Entity
@Table(name = "cms_link")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Link extends IdEntity {

	/**
	 * 分类编号
	 */
	@ManyToOne(targetEntity = Category.class,fetch = FetchType.LAZY)
    @JoinColumn(name = "CATEGORY_ID")
    @NotFound(action=NotFoundAction.IGNORE)
	private Category category;
	/**
	 * 链接名称
	 */
	private String title;
	/**
	 * 标题颜色（red：红色；green：绿色；blue：蓝色；yellow：黄色；orange：橙色）
	 */
	private String color;
	/**
	 * 链接图片
	 */
	private String image;
	/**
	 * 链接地址
	 */
	private String href;
	/**
	 * 权重，越大越靠前
	 */
	private int weight = 0;
	/**
	 * 权重期限，超过期限，将weight设置为0
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	private Date weightDate;
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public Date getWeightDate() {
		return weightDate;
	}
	public void setWeightDate(Date weightDate) {
		this.weightDate = weightDate;
	}
}