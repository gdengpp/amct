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

	private String tab_field;

	private List<amctTopMenuChild> child;

	private List<amctLeftMenu> leftmenu;

	public amctTopMenu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctTopMenu(String id, String name, String ename, String url,
			String is_display, String remark, String tab_field,
			List<amctTopMenuChild> child, List<amctLeftMenu> leftmenu) {
		super();
		this.id = id;
		this.name = name;
		this.ename = ename;
		this.url = url;
		this.is_display = is_display;
		this.remark = remark;
		this.tab_field = tab_field;
		this.child = child;
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

	public String getTab_field() {
		return tab_field;
	}

	public void setTab_field(String tab_field) {
		this.tab_field = tab_field;
	}

	public List<amctTopMenuChild> getChild() {
		return child;
	}

	public void setChild(List<amctTopMenuChild> child) {
		this.child = child;
	}

	public List<amctLeftMenu> getLeftmenu() {
		return leftmenu;
	}

	public void setLeftmenu(List<amctLeftMenu> leftmenu) {
		this.leftmenu = leftmenu;
	}

	@Override
	public String toString() {
		return "amctTopMenu [id=" + id + ", name=" + name + ", ename=" + ename
				+ ", url=" + url + ", is_display=" + is_display + ", remark="
				+ remark + ", tab_field=" + tab_field + ", child=" + child
				+ ", leftmenu=" + leftmenu + "]";
	}

}
