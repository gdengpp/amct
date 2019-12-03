package com.amct.entity;

import java.io.Serializable;

public class amctLeftMenuChild implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8076876688148673390L;

	private String id;

	private String name;

	private String ename;

	private String url;

	private String remark;

	private String tab_field;

	private String icon;

	public amctLeftMenuChild() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctLeftMenuChild(String id, String name, String ename, String url,
			String remark, String tab_field, String icon) {
		super();
		this.id = id;
		this.name = name;
		this.ename = ename;
		this.url = url;
		this.remark = remark;
		this.tab_field = tab_field;
		this.icon = icon;
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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getTab_field() {
		return tab_field;
	}

	public void setTab_field(String tab_field) {
		this.tab_field = tab_field;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "amctLeftMenuChild [id=" + id + ", name=" + name + ", ename="
				+ ename + ", url=" + url + ", remark=" + remark
				+ ", tab_field=" + tab_field + ", icon=" + icon + "]";
	}

}
