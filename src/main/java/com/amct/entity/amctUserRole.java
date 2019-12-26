package com.amct.entity;

import java.io.Serializable;

public class amctUserRole implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String user_id;

	private String role_id;

	public amctUserRole() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctUserRole(String id, String user_id, String role_id) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.role_id = role_id;
	}

	@Override
	public String toString() {
		return "amctUserRole [id=" + id + ", user_id=" + user_id + ", role_id="
				+ role_id + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
