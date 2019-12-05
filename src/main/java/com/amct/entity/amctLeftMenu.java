package com.amct.entity;

import java.io.Serializable;
import java.util.List;

public class amctLeftMenu implements Serializable {


	private String id;

	private String name;

	private String ename;

	private String url;

	private String icon;

	private String is_display;

	private String remark;

	private List<amctTopMenuChild> child;

	public amctLeftMenu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctLeftMenu(String id, String name, String ename, String url,
			String icon, String is_display, String remark,
			List<amctTopMenuChild> child) {
		super();
		this.id = id;
		this.name = name;
		this.ename = ename;
		this.url = url;
		this.icon = icon;
		this.is_display = is_display;
		this.remark = remark;
		this.child = child;
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

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
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

	public List<amctTopMenuChild> getChild() {
		return child;
	}

	public void setChild(List<amctTopMenuChild> child) {
		this.child = child;
	}

	@Override
	public String toString() {
		return "amctLeftMenu [id=" + id + ", name=" + name + ", ename=" + ename
				+ ", url=" + url + ", icon=" + icon + ", is_display="
				+ is_display + ", remark=" + remark + ", child=" + child + "]";
	}

	
}
