package com.amct.entity;

import java.io.Serializable;

public class amctIconImg implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String icon_class;

	private String icon_name;

	private String icon_code;

	private String remark;

	public amctIconImg() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctIconImg(String id, String icon_class, String icon_name,
			String icon_code, String remark) {
		super();
		this.id = id;
		this.icon_class = icon_class;
		this.icon_name = icon_name;
		this.icon_code = icon_code;
		this.remark = remark;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIcon_class() {
		return icon_class;
	}

	public void setIcon_class(String icon_class) {
		this.icon_class = icon_class;
	}

	public String getIcon_name() {
		return icon_name;
	}

	public void setIcon_name(String icon_name) {
		this.icon_name = icon_name;
	}

	public String getIcon_code() {
		return icon_code;
	}

	public void setIcon_code(String icon_code) {
		this.icon_code = icon_code;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "amctIconImg [id=" + id + ", icon_class=" + icon_class
				+ ", icon_name=" + icon_name + ", icon_code=" + icon_code
				+ ", remark=" + remark + "]";
	}

}
