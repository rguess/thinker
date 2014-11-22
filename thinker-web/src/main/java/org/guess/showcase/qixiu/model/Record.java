package org.guess.showcase.qixiu.model;

import org.guess.core.orm.IdEntity;
import org.guess.sys.model.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * 汽修记录
 * @author rguess
 * @version 2014-11-22
 */
@Entity
@Table(name = "q_record")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Record extends IdEntity {

	/**
	 * 客户电话
	 */
	private String phone;
	/**
	 * 车牌
	 */
	private String chepai;
	/**
	 * 车型
	 */
	private String chexing;
	/**
	 * 备注
	 */
	private String remark;
    /**
     * 客户姓名
     */
    private String customer;
    /**
     * 最新维修时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date latestDate;

    @OneToMany(targetEntity=Rdetail.class,fetch = FetchType.LAZY,cascade= CascadeType.ALL)
    @JoinColumn(name="record_id")
    @NotFound(action = NotFoundAction.IGNORE)
    @OrderBy("id desc ")
    private List<Rdetail> details;

    /**
     * 用户
     */
    @ManyToOne(targetEntity = User.class,fetch = FetchType.LAZY)
    @JoinColumn(name = "USER_ID")
    @NotFound(action= NotFoundAction.IGNORE)
    private User user;

    public Date getLatestDate() {
        return latestDate;
    }

    public void setLatestDate(Date latestDate) {
        this.latestDate = latestDate;
    }

    public List<Rdetail> getDetails() {
        return details;
    }

    public void setDetails(List<Rdetail> details) {
        this.details = details;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getChepai() {
        return chepai;
    }

    public void setChepai(String chepai) {
        this.chepai = chepai;
    }

    public String getChexing() {
        return chexing;
    }

    public void setChexing(String chexing) {
        this.chexing = chexing;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }
}