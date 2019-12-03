package com.amct.entity;

import java.io.Serializable;

public class amctTopMenuChild implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2920686882450224262L;

	private String id;

	private String name;

	private String url;

	private String remark;

	public amctTopMenuChild() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctTopMenuChild(String id, String name, String url, String remark) {
		super();
		this.id = id;
		this.name = name;
		this.url = url;
		this.remark = remark;
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
		return "amctTopMenuChild [id=" + id + ", name=" + name + ", url=" + url
				+ ", remark=" + remark + "]";
	}

}
