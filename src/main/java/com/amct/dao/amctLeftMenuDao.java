package com.amct.dao;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.amctLeftMenu;

public interface amctLeftMenuDao {

	// 头部菜单表新增
	Integer addleftMenu(@Param("tab_name") String tab_name,
			@Param("tab_field") String tab_field);

	// 删除表
	void delTab(@Param("tab_name") String tab_name);

	// 修改头部不菜单
	Integer updateleftMenu(@Param("id") String id,
			@Param("menu_name") String menu_name,
			@Param("menu_display") String menu_display,
			@Param("icon") String icon, @Param("menu_remark") String menu_remark);

	// 增加菜单
	Integer insertMenu(amctLeftMenu atm);

	// 通过ID删除
	Integer delById(@Param("id") String id);

	// 通过ID删除字表
	Integer delleftmenuchildByparentid(@Param("id") String id);
}
