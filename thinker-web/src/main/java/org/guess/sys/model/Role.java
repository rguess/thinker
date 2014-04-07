package org.guess.sys.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.guess.core.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "SYS_ROLE")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Role extends IdEntity {

	/** 名称 */
	private String name;
	
	/** 中文名称 */
	private String realName;
	
	/** 备注 */
	private String remark;

	/** 所属用户 */
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE }, targetEntity = User.class,mappedBy="roles")
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Set<User> users = new HashSet<User>(0);
	
	/** 拥有权限 */
	@ManyToMany( cascade = { CascadeType.PERSIST,CascadeType.MERGE })
	@JoinTable(name = "SYS_ROLE_RES", joinColumns = { @JoinColumn(name = "ROLE_ID") }, inverseJoinColumns = { @JoinColumn(name = "RES_ID") })
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Set<Resource> resources = new HashSet<Resource>();
	/** 是否被授权权限 */
	private String authorize;
	
	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public Set<Resource> getResources() {
		return resources;
	}

	public void setResources(Set<Resource> resources) {
		this.resources = resources;
	}

	public String getAuthorize() {
		return authorize;
	}

	public void setAuthorize(String authorize) {
		this.authorize = authorize;
	}
}
