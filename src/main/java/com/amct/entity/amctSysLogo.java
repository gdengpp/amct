package com.amct.entity;

import java.io.Serializable;

public class amctSysLogo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

	private String name;

	private String url;

	public amctSysLogo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctSysLogo(Integer id, String name, String url) {
		super();
		this.id = id;
		this.name = name;
		this.url = url;
	}

	@Override
	public String toString() {
		return "amctSysLogo [id=" + id + ", name=" + name + ", url=" + url
				+ "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

}
