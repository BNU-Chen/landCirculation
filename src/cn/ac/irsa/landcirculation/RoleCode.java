package cn.ac.irsa.landcirculation;

// Generated 2015-3-14 18:18:06 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * RoleCode generated by hbm2java
 */
public class RoleCode implements java.io.Serializable {

	private Integer	id;
	private String	roleCode;
	private String	roleName;
	private Set		userRoles	= new HashSet(0);

	public RoleCode() {
	}

	public RoleCode(String roleCode, String roleName, Set userRoles) {
		this.roleCode = roleCode;
		this.roleName = roleName;
		this.userRoles = userRoles;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRoleCode() {
		return this.roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Set getUserRoles() {
		return this.userRoles;
	}

	public void setUserRoles(Set userRoles) {
		this.userRoles = userRoles;
	}

}