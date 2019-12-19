package com.amct.entity;

import java.io.Serializable;
import java.util.List;

public class amctTopMenu implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4853181287137394276L;

	private String id;

	private String name;

	private String ename;

	private String url;

	private String is_display;

	private String remark;

	private List<amctLeftMenu> leftmenu;

	public amctTopMenu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctTopMenu(String id, String name, String ename, String url,
			String is_display, String remark, List<amctLeftMenu> leftmenu) {
		super();
		this.id = id;
		this.name = name;
		this.ename = ename;
		this.url = url;
		this.is_display = is_display;
		this.remark = remark;
		this.leftmenu = leftmenu;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIs_display() {
		return is_display;
	}

	public void setIs_display(String is_display) {
		this.is_display = is_display;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public List<amctLeftMenu> getLeftmenu() {
		return leftmenu;
	}

	public void setLeftmenu(List<amctLeftMenu> leftmenu) {
		this.leftmenu = leftmenu;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
