package com.amct.entity;

import java.io.Serializable;

//'用户信息表';
public class amctUser implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4567324821468805403L;

	private String id;

	private String name;// '用户名称',

	private String username;// '用户账号',

	private String password;// '用户密码',

	private String phone;// '用户电话号码',

	private String email;// '用户邮箱',

	private String remark;// '用户说明'

	private String url;// 头像路径

	private Integer age;

	private Integer sex;// 0：男；1：女

	private Integer status;

	private amctRole role;

	public amctUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	public amctUser(String id, String name, String username, String password,
			String phone, String email, String remark, String url, Integer age,
			Integer sex, Integer status, amctRole role) {
		super();
		this.id = id;
		this.name = name;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.remark = remark;
		this.url = url;
		this.age = age;
		this.sex = sex;
		this.status = status;
		this.role = role;
	}

	@Override
	public String toString() {
		return "amctUser [id=" + id + ", name=" + name + ", username="
				+ username + ", password=" + password + ", phone=" + phone
				+ ", email=" + email + ", remark=" + remark + ", url=" + url
				+ ", age=" + age + ", sex=" + sex + ", status=" + status
				+ ", role=" + role + "]";
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public amctRole getRole() {
		return role;
	}

	public void setRole(amctRole role) {
		this.role = role;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
