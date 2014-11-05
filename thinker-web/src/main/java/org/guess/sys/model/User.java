package org.guess.sys.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.guess.core.Constants;
import org.guess.core.orm.IdEntity;
import org.guess.core.utils.DateUtil;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.util.*;

@Entity
@Table(name = "SYS_USER")
@JsonIgnoreProperties(value = { "roles","passwd" })
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class User extends IdEntity {

	/** 登录ID */
	@Column(unique = true)
    @Pattern(regexp = "^[a-zA-Z][a-zA-Z0-9_]{4,15}$")
	private String loginId;
	/** 密码 */
	private String passwd;
	/** 用户姓名 */
    @NotEmpty
    @Length(min = 2,max = 10)
	private String name;
	/** 电子邮件 */
    @NotEmpty
    @Email
	private String email;
	/** 手机号 */
    @NotEmpty
    @Pattern(regexp = "^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\\d{8})$")
	private String mobilePhone;
	/** 地址 */
	private String address;
	/** 状态 0 无效 1 有效 */
	private int status = Constants.USER_STATUS_UNLOCK;
	/** 备注 */
    @NotEmpty(message = "{user.remark.null}")
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
			List<Resource> userRecs = new ArrayList<Resource>();
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
			Collections.sort(r1.getChildRes(), new Comparator<Resource>(){
				@Override
				public int compare(Resource o1, Resource o2) {
					return o1.getOrderNo()>o2.getOrderNo()?1:-1;
				}
			});
		}
		
		return recs;
	}
}
