package com.amct.service;

import java.util.List;

import org.springframework.stereotype.Service;
@Service
public interface amctLeftChildMenuService {

	// 增加头部菜单
		String addleftChildMenu(String pid,String menu_name, String menu_ename, String menu_display,String icon,
				String menu_remark, String table_field, String tab_url,
				List<Object> parse);

		// 删除表
		Integer removeTab(String id, String tab_name);

		// 编辑头部菜单
		Integer leftChildMenuEdit(String id, String menu_ename, String menu_name,
				String menu_display, String menu_remark,String icon, List<Object> parse);
}