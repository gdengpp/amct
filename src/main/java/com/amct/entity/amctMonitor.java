package com.amct.entity;

import java.io.Serializable;

public class amctMonitor implements Serializable {

	private String id;

	private String menu_id;

	private String menu_name;

	private String menu_ename;

	public amctMonitor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctMonitor(String id, String menu_id, String menu_name,
			String menu_ename) {
		super();
		this.id = id;
		this.menu_id = menu_id;
		this.menu_name = menu_name;
		this.menu_ename = menu_ename;
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

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_ename() {
		return menu_ename;
	}

	public void setMenu_ename(String menu_ename) {
		this.menu_ename = menu_ename;
	}

	@Override
	public String toString() {
		return "amctMonitor [id=" + id + ", menu_id=" + menu_id
				+ ", menu_name=" + menu_name + ", menu_ename=" + menu_ename
				+ "]";
	}

}