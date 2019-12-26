package com.amct.dao;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.amctMenuRole;
import com.amct.entity.amctUserRole;

/**
 * 权限中间表，用于增加修改删除处理
 * @author dengpp
 *
 */
public interface amctMenuUserRoleDao {

	/**
	 * 新增
	 */
	Integer insertMenuRole(amctMenuRole a);
	
	Integer insertUserRole(amctUserRole a);
	
	
	/**
	 * 删除
	 */
	Integer removeMenuRole(@Param("menu_id")String menu_id,@Param("role_id")String role_id);
	
	Integer removeUserRole(@Param("user_id")String user_id,@Param("role_id")String role_id);
}
