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

	private String is_display;

	private String remark;

	private String icon;

	private String parentid;

	public amctLeftMenuChild() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctLeftMenuChild(String id, String name, String ename, String url,
			String is_display, String remark, String icon, String parentid) {
		super();
		this.id = id;
		this.name = name;
		this.ename = ename;
		this.url = url;
		this.is_display = is_display;
		this.remark = remark;
		this.icon = icon;
		this.parentid = parentid;
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

	public String getIs_display() {
		return is_display;
	}

	public void setIs_display(String is_display) {
		this.is_display = is_display;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getParentid() {
		return parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
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

	@Override
	public String toString() {
		return "amctLeftMenuChild [id=" + id + ", name=" + name + ", ename="
				+ ename + ", url=" + url + ", is_display=" + is_display
				+ ", remark=" + remark + ", icon=" + icon + ", parentid="
				+ parentid + "]";
	}

}
