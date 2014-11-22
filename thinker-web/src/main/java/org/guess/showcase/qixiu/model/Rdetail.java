package org.guess.showcase.qixiu.model;

import org.guess.core.orm.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * 客户车详细记录
 * @author rguess
 * @version 2014-11-22
 */
@Entity
@Table(name = "q_record_detail")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Rdetail extends IdEntity {

	/**
	 * 类别
	 */
	private String leibie;

    /**
     * 维修价格
     */
    private double jiage;

    /**
     * 维修时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date xiudate;

    /**
     * 提醒下次更换或维修日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date nextxiu;

    @ManyToOne(fetch = FetchType.LAZY,targetEntity=Record.class)
    @NotFound(action = NotFoundAction.IGNORE)
    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    private Record record;

    public String getLeibie() {
        return leibie;
    }

    public void setLeibie(String leibie) {
        this.leibie = leibie;
    }

    public double getJiage() {
        return jiage;
    }

    public void setJiage(double jiage) {
        this.jiage = jiage;
    }

    public Date getXiudate() {
        return xiudate;
    }

    public void setXiudate(Date xiudate) {
        this.xiudate = xiudate;
    }

    public Record getRecord() {
        return record;
    }

    public void setRecord(Record record) {
        this.record = record;
    }

    public Date getNextxiu() {
        return nextxiu;
    }

    public void setNextxiu(Date nextxiu) {
        this.nextxiu = nextxiu;
    }


}