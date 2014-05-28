package org.guess.sys.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.guess.core.orm.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
@Table(name = "SYS_LOG")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Log extends IdEntity{

	/**
	 * 操作时间
	 */
	private Date operTime = new Date();
	
	/**
	 * 操作名称
	 */
	private String operName;
	
	/**
	 * 操作结果 0：未处理 1 成功 2 失败 
	 */
	private int result;
	
	/**
	 * 详细内容
	 */
	private String content;
	
	/**
	 * ip地址
	 */
	private String ip;
	
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = User.class, fetch = FetchType.LAZY)
	@NotFound(action=NotFoundAction.IGNORE)
	@JoinColumn(name = "userId")
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private User operUser;
	
	public User getOperUser() {
		return operUser;
	}

	public void setOperUser(User operUser) {
		this.operUser = operUser;
	}

	public Date getOperTime() {
		return operTime;
	}

	public void setOperTime(Date operTime) {
		this.operTime = operTime;
	}

	public String getOperName() {
		return operName;
	}

	public void setOperName(String operName) {
		this.operName = operName;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Log(String operName, int result, String content, User operUser,String ip) {
		super();
		this.operName = operName;
		this.result = result;
		this.content = content;
		this.operUser = operUser;
		this.ip = ip;
	}

	public Log() {
		super();
	}
}
