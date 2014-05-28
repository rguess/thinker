package org.guess.showcase.finance.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.guess.core.orm.IdEntity;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 财务实体类
 *
 * @author guess
 */
@Entity
@Table(name = "FINACE")
public class Finance extends IdEntity{
	
	/**
	 * 名称
	 */
	private String name;
	
	/**
	 * 类型
	 */
	private String type;
	
	/**
	 * 详细内容
	 */
	private String content;
	
	/**
	 * 收入或支出 1：收入  0:支出
	 */
	private int inorout = 1;
	
	/**
	 * 金额
	 */
	private double money;
	
	/**
	 * 日期
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date time;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getInorout() {
		return inorout;
	}

	public void setInorout(int inorout) {
		this.inorout = inorout;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
}
