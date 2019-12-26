package com.amct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.amctRole;

public interface amctRoleDao {

	/**
	 * 新增
	 */
	Integer insert(amctRole a);

	/**
	 * 修改
	 */
	Integer upate(amctRole a);

	/**
	 * 1、删除表 2、删除关联表
	 */
	Integer del(@Param("id") String id);

	/**
	 * 查询
	 */
	List<amctRole> find(@Param("role_name") String role_name,
			@Param("begin") Integer begin, @Param("end") Integer end);

	Integer count(@Param("role_name") String role_name);
	
	List<String> queryMenuRole(@Param("role_id") String role_id);
}
