package com.amct.entity;

import java.io.Serializable;

public class amctIconImg implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1185479011846742843L;

	private String id;
	
	private String url;
	
	private String remark;

	public amctIconImg() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctIconImg(String id, String url, String remark) {
		super();
		this.id = id;
		this.url = url;
		this.remark = remark;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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
		return "amctIconImg []";
	}
	
	
}
