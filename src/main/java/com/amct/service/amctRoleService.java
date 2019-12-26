package com.amct.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.amct.entity.amctRole;
@Service
public interface amctRoleService {

	/**
	 * 新增
	 */
	Integer add(String role_name,String role_code,Integer role_status,String remark);
	
	/**
	 * 修改
	 */
	Integer modify(String id,String role_name,String role_code,Integer role_status,String remark);
	
	/**
	 * 删除
	 */
	Integer remove(String id);
	
	/**
	 * 查询
	 */
	List<amctRole> find(String role_name,Integer page,Integer limit);
	
	Integer getCount(String role_name);

	Integer auth(String role_id, String menu_id);
	
	List<String> getMenuId(String role_id);
	
}
