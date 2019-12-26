package com.amct.entity;

import java.io.Serializable;

public class amctMenuRole implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String menu_id;

	private String role_id;

	public amctMenuRole() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctMenuRole(String id, String menu_id, String role_id) {
		super();
		this.id = id;
		this.menu_id = menu_id;
		this.role_id = role_id;
	}

	@Override
	public String toString() {
		return "amctMenuRole [id=" + id + ", menu_id=" + menu_id + ", role_id="
				+ role_id + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
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
