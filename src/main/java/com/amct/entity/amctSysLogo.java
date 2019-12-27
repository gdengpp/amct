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

	private Integer is_display;

	public amctSysLogo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctSysLogo(Integer id, String name, String url, Integer is_display) {
		super();
		this.id = id;
		this.name = name;
		this.url = url;
		this.is_display = is_display;
	}

	@Override
	public String toString() {
		return "amctSysLogo [id=" + id + ", name=" + name + ", url=" + url
				+ ", is_display=" + is_display + "]";
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

	public Integer getIs_display() {
		return is_display;
	}

	public void setIs_display(Integer is_display) {
		this.is_display = is_display;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
