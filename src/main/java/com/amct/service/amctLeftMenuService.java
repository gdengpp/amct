package com.amct.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
@Service
public interface amctLeftMenuService {

	// 增加头部菜单
	String addleftMenu(String pid,String menu_name, String menu_ename, String menu_display,String icon,
			String menu_remark, String table_field, String tab_url,
			List<Object> parse,HttpSession session);

	// 删除表
	Integer removeTab(String id, String tab_name);

	// 编辑头部菜单
	Integer leftMenuEdit(String id, String menu_ename, String menu_name,
			String menu_display, String menu_remark,String icon, List<Object> parse);
}
