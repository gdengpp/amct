package com.amct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.amctSysLogo;
import com.amct.entity.amctTopMenu;
import com.amct.entity.amctUser;

public interface amctTopMenuDao {

	// 查询所有的顶部菜单
	List<amctTopMenu> queryAll(@Param("user_id") String user_id);

	List<amctTopMenu> queryAllAdmin();

	// 分页查询所有的顶部菜单
	List<amctTopMenu> queryList(@Param("name") String name,
			@Param("user_id") String user_id, @Param("begin") Integer begin,
			@Param("end") Integer end);

	// 分页查询所有的顶部菜单
	List<amctTopMenu> queryListAdmin(@Param("name") String name,
			@Param("begin") Integer begin, @Param("end") Integer end);

	// 查新logo信息

	amctSysLogo queryLogo();

	Integer cont(@Param("name") String name, @Param("user_id") String user_id);

	Integer contAdmin(@Param("name") String name);

	// 查询用户信息
	amctUser queryUserInfo();

	// 增加菜单
	Integer insertMenu(amctTopMenu atm);

	// 头部菜单表新增
	Integer addTopMenu(@Param("tab_name") String tab_name,
			@Param("tab_field") String tab_field);

	// 删除表
	void delTab(@Param("tab_name") String tab_name);

	// 删除tou_menu=============
	void delTopMenuById(@Param("id") String id);

	// 删除tou_menu
	void delLeftMenuByTopId(@Param("id") String id);

	// 删除tou_menu
	void delLeftMenuChildByTopId(@Param("id") String id);

	// 删除end====================

	// 删除left_menu
	void delLeftMenuById(@Param("id") String id);

	// 删除left_menu
	void delLeftMenuByLeftId(@Param("id") String id);

	// 删除left_menu_child
	void delLeftMenuChildById(@Param("id") String id);

	// 修改表结构
	Integer updateTabFiled(@Param("str") String str);

	// 修改头部不菜单
	Integer updateTopMenu(@Param("id") String id,
			@Param("menu_name") String menu_name,
			@Param("menu_display") String menu_display,
			@Param("menu_remark") String menu_remark);
}
