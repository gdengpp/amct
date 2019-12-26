package com.amct.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.amct.entity.amctSysLogo;
import com.amct.entity.amctTopMenu;
import com.amct.entity.amctUser;

@Service
public interface amctTopMenuService {

	// 查询所有的顶部菜单
	List<amctTopMenu> findAll(String user_id);
	
	List<amctTopMenu> findAllAdmin();

	// 分页查询所有的顶部菜单
	List<amctTopMenu> findList(String name,String user_id, Integer page, Integer rows);
	
	List<amctTopMenu> findListAdmin(String name, Integer page, Integer rows);

	// 查新logo信息

	amctSysLogo findLogo();
	
	Integer getCont(String name,String user_id);
	
	Integer getContAdmin(String name);

	// 查询用户信息
	amctUser finduserInfo();

	// 增加菜单
	Integer addMenu(amctTopMenu am);

	// 增加头部菜单
	String addTouMenu(String menu_name, String menu_ename, String menu_display,
			String menu_remark, String table_field, String tab_url, List<Object> parse,HttpSession session);

	// 删除表
	Integer removeTab(String id, String tab_name);

	// 编辑头部菜单
	Integer topMenuEdit(String id,String menu_ename,String menu_name, String menu_display,
			String menu_remark, List<Object> parse);

}
