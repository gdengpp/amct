package com.amct.dto;

import java.io.Serializable;
import java.util.List;

public class findListDto<E> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9160427761830358217L;

	private Integer code;

	private String msg;

	private Integer count;

	private List<E> data;

	public findListDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public findListDto(Integer code, String msg, Integer count, List<E> data) {
		super();
		this.code = code;
		this.msg = msg;
		this.count = count;
		this.data = data;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public List<E> getData() {
		return data;
	}

	public void setData(List<E> data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "findListDto [code=" + code + ", msg=" + msg + ", count="
				+ count + ", data=" + data + "]";
	}

}
