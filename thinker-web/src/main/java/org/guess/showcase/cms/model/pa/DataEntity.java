/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package org.guess.showcase.cms.model.pa;

import java.util.Date;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.guess.core.orm.IdEntity;
import org.guess.core.utils.DateUtil;
import org.guess.sys.model.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 数据Entity类
 * @author ThinkGem rguess
 * @version 2013-05-28
 */
@MappedSuperclass
public abstract class DataEntity extends IdEntity{

	
	/**
	 * 创建者
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="createby_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	protected User createBy;
	
	/**
	 * 更新者
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="updateby_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	protected User updateBy;
	
	/**
	 * 发表日期
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	protected Date createDate = DateUtil.parseFormat("yyyy-MM-dd");
	
	/**
	 * 更新日期
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	protected Date updateDate = DateUtil.parseFormat("yyyy-MM-dd");
	
	/**
	 * 删除标记（0：正常；1：删除；2：审核）
	 */
	protected int delFlag = 0;
	
	public User getCreateBy() {
		return createBy;
	}
	public void setCreateBy(User createBy) {
		this.createBy = createBy;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public User getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(User updateBy) {
		this.updateBy = updateBy;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public int getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(int delFlag) {
		this.delFlag = delFlag;
	}
}
