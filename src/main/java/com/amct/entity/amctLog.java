package com.amct.entity;

import java.io.Serializable;
import java.util.Date;

public class amctLog implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String user_name;

	private Date log_date;

	private String opt;

	private String status;

	private String menu_code;

	public amctLog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctLog(String id, String user_name, Date log_date, String opt,
			String status, String menu_code) {
		super();
		this.id = id;
		this.user_name = user_name;
		this.log_date = log_date;
		this.opt = opt;
		this.status = status;
		this.menu_code = menu_code;
	}

	@Override
	public String toString() {
		return "amctLog [id=" + id + ", user_name=" + user_name + ", log_date="
				+ log_date + ", opt=" + opt + ", status=" + status
				+ ", menu_code=" + menu_code + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Date getLog_date() {
		return log_date;
	}

	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}

	public String getOpt() {
		return opt;
	}

	public void setOpt(String opt) {
		this.opt = opt;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMenu_code() {
		return menu_code;
	}

	public void setMenu_code(String menu_code) {
		this.menu_code = menu_code;
	}

}
