package org.guess.sys.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
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

@Entity
@Table(name = "SYS_RES")
@JsonIgnoreProperties(value = { "parent","roles" })
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Resource extends IdEntity {
	
	/** 名称 */
	private String name;
	/** 资源串 */
	private String resString;
	/** 备注 */
	private String remark;
	/** 图标 */
	private String icon;
	/** 权限字符串  */
	private String permsString;
	/** 等级 */
	private int grade = 1;
	/** 排序序号 */
	private int orderNo = 1;
	/** 父资源 */
	@ManyToOne(targetEntity = Resource.class,fetch = FetchType.LAZY)
    @JoinColumn(name = "PARENT_ID")
    @NotFound(action=NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Resource parent;
	/** 子资源 */
	@OneToMany(targetEntity=Resource.class,fetch = FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinColumn(name="PARENT_ID",updatable=false)
	@OrderBy("orderNo ASC")
	/*@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)*/
	private List<Resource> childRes;
	/** 角色 */
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE }, targetEntity = Role.class,mappedBy="resources")
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Set<Role> roles = new HashSet<Role>(0);
	/** 是否被授权权限 */
	private String authorize;
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getResString() {
		return resString;
	}
	public void setResString(String resString) {
		this.resString = resString;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getPermsString() {
		return permsString;
	}
	public void setPermsString(String permsString) {
		this.permsString = permsString;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Resource getParent() {
		return parent;
	}
	public void setParent(Resource parent) {
		this.parent = parent;
	}
	public List<Resource> getChildRes() {
		return childRes;
	}
	public void setChildRes(List<Resource> childRes) {
		this.childRes = childRes;
	}
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	public String getAuthorize() {
		return authorize;
	}
	public void setAuthorize(String authorize) {
		this.authorize = authorize;
	}

}
