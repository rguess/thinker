package org.guess.sys.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.guess.core.Constants;
import org.guess.core.IdEntity;
import org.guess.core.utils.DateUtil;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "SYS_USER")
@JsonIgnoreProperties(value = { "roles","passwd" })
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class User extends IdEntity {

	/** 登录ID */
	@Column(unique = true)
	private String loginId;
	/** 密码 */
	private String passwd;
	/** 用户姓名 */
	private String name;
	/** 电子邮件 */
	private String email;
	/** 手机号 */
	private String mobilePhone;
	/** 地址 */
	private String address;
	/** 状态 0 无效 1 有效 */
	private int status = Constants.USER_STATUS_UNLOCK;
	/** 备注 */
	private String remark;

	/** 创建时间 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	private Date createDate = DateUtil.parseFormat("yyyy-MM-dd");

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/** 拥有角色 */
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinTable(name = "SYS_USER_ROLE", joinColumns = { @JoinColumn(name = "USER_ID") }, inverseJoinColumns = { @JoinColumn(name = "ROLE_ID") })
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Set<Role> roles = new HashSet<Role>();

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public User() {
		super();
	}

	@JsonIgnore
	public List<Resource> getMenus() {
		List<Resource> recs = new ArrayList<Resource>();
		Set<Resource> allRecs = new HashSet<Resource>();
		for (Role role : this.getRoles()) {
			for (Resource rec : role.getResources()) {
				if (rec.getGrade() == Constants.FIRST_MENU && !recs.contains(rec)) {
					recs.add(rec);
				}
				allRecs.add(rec);
			}
		}
		for (Resource r1 : recs) {
			Set<Resource> userRecs = new HashSet<Resource>();
			for (Resource r2 : allRecs) {
				if (r2.getParent() != null && r2.getGrade() == Constants.SECOND_MENU
						&& r2.getParent().getId() == r1.getId()) {
						userRecs.add(r2);
				}
			}
			r1.setChildRes(userRecs);
		}
		//父菜单排序
		Collections.sort(recs, new Comparator<Resource>(){
			@Override
			public int compare(Resource o1, Resource o2) {
				return o1.getOrderNo()>o2.getOrderNo()?1:-1;
			}
		});
		for (Resource r1 : recs) {
			List<Resource> children = new ArrayList<Resource>();
			children.addAll(r1.getChildRes());
			Collections.sort(children, new Comparator<Resource>(){
				@Override
				public int compare(Resource o1, Resource o2) {
					return o1.getOrderNo()>o2.getOrderNo()?1:-1;
				}
			});
			Set<Resource> cset = new HashSet<Resource>();
			cset.addAll(children);
			r1.setChildRes(cset);
//			cset.clear();
			children.clear();
		}
		
		return recs;
	}
}
