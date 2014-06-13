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
import org.guess.sys.model.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 针对文章的评论Entity
 * @author rguess
 * @version 2014-06-04
 */
@Entity
@Table(name = "cms_comment")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Comment extends IdEntity {

	/**
	 * 内容
	 */
	private String content;
	/**
	 * 评论人名称
	 */
	private String name;
	/**
	 * ip地址
	 */
	private String ip;
	/**
	 * email
	 */
	private String email;
	/**
	 * 评论人网址
	 */
	private String url;
	
	private String headPath;
	/**
	 * 日期
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:MM:ss")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate = new Date();
	/**
	 * 审核人
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="auditer_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private User auditUser;
	/**
	 * 审核日期
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:MM:ss")
	@Temporal(TemporalType.TIMESTAMP)
	private Date auditDate;
	/**
	 * 删除标记删除标记（0：正常；1：删除；2：审核）
	 */
	private int delFlag = 0;
	/**
	 * 属于文章 
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="article_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Article article;
	
	public String getHeadPath() {
		return headPath;
	}
	public void setHeadPath(String headPath) {
		this.headPath = headPath;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public User getAuditUser() {
		return auditUser;
	}
	public void setAuditUser(User auditUser) {
		this.auditUser = auditUser;
	}
	public Date getAuditDate() {
		return auditDate;
	}
	public void setAuditDate(Date auditDate) {
		this.auditDate = auditDate;
	}
	public int getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(int delFlag) {
		this.delFlag = delFlag;
	}
}