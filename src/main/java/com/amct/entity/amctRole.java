package com.amct.entity;

import java.io.Serializable;

public class amctRole implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String role_name;

	private String role_code;

	private Integer role_status;

	private String remark;

	public amctRole() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctRole(String id, String role_name, String role_code,
			Integer role_status, String remark) {
		super();
		this.id = id;
		this.role_name = role_name;
		this.role_code = role_code;
		this.role_status = role_status;
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "amctRole [id=" + id + ", role_name=" + role_name
				+ ", role_code=" + role_code + ", role_status=" + role_status
				+ ", remark=" + remark + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getRole_code() {
		return role_code;
	}

	public void setRole_code(String role_code) {
		this.role_code = role_code;
	}

	public Integer getRole_status() {
		return role_status;
	}

	public void setRole_status(Integer role_status) {
		this.role_status = role_status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
