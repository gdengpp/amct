package com.amct.serviceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.amct.dao.amctLeftMenuDao;
import com.amct.dao.amctMonitorDao;
import com.amct.dao.amctTopMenuDao;
import com.amct.entity.amctLeftMenu;
import com.amct.entity.amctMonitor;
import com.amct.service.amctLeftMenuService;
@Service
public class amctLeftMenuServiceImpl implements amctLeftMenuService {
	
	@Autowired
	private amctTopMenuDao atm;
	
	@Autowired
	private amctLeftMenuDao afm;
	
	@Autowired
	private amctMonitorDao amd;

	@Override
	public String addleftMenu(String pid,String menu_name, String menu_ename,
			String menu_display, String icon,String menu_remark, String table_field,
			String tab_url, List<Object> parse) {

		/**
		 * table_field:创建表的字段，拼装好的 field：入库字段
		 */
		// 第一步，创建表
		Boolean flag = true;
		try {
			afm.addleftMenu("amct_" + menu_ename, table_field);
			// 插入top表
		} catch (Exception e) {
			flag = false;
		}
		if (flag) {
			try {
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				amctLeftMenu at = new amctLeftMenu();
				at.setEname(menu_ename);
				at.setId(uuid);
				at.setIs_display(menu_display);
				at.setName(menu_name);
				at.setRemark(menu_remark);
				at.setUrl(tab_url);
				at.setIcon(icon);
				at.setTop_menu_id(pid);
				afm.insertMenu(at);
				// 加入子表
				// waiting
				amctMonitor am = null;
				for (int i = 0; i < parse.size(); i++) {
					JSONObject jsonObject = JSON.parseObject(parse.get(i)
							.toString());
					am = new amctMonitor();
					am.setId(UUID.randomUUID().toString().replaceAll("-", ""));
					am.setMenu_id(uuid);
					am.setMenu_ename(jsonObject.getString("menu_ename"));
					am.setMenu_name(jsonObject.getString("menu_name"));
					am.setLen(jsonObject.getString("len"));
					am.setType(jsonObject.getString("type"));
					am.setIs_query(jsonObject.getString("is_query"));
					amd.insert(am);
				}
			} catch (Exception e) {
				afm.delTab("amct_" + menu_ename);
				flag = false;
			}
		}
		if (flag) {
			return "yes";
		} else {
			return "no";
		}
	}

	@Override
	public Integer removeTab(String id, String tab_name) {

		Integer inte;
		try {
			// 删除表
			afm.delTab("amct_" + tab_name);
			inte = 1;
		} catch (Exception e) {
			inte = 0;
		}
		try {
			afm.delById(id);
			afm.delleftmenuchildByparentid(id);
			// 删除子表
			amd.del(id);
			inte = 1;
		} catch (Exception e) {
			System.out.println(e);
			inte = 0;
		}

		return inte;
	}

	@Override
	public Integer leftMenuEdit(String id, String menu_ename, String menu_name,
			String menu_display, String icon,String menu_remark, List<Object> parse) {

		/**
		 * 修改表字段 先查询出表字段，判断修改
		 */
		List<amctMonitor> list = amd.queryAll(id);
		List<String> ids = new ArrayList<String>();
		/**
		 * 循环查询出两边都有的字段
		 */
		for (int i = 0; i < parse.size(); i++) {
			JSONObject jsonO = JSON.parseObject(parse.get(i).toString());
			ids.add(jsonO.getString("id"));
			String stype = "varchar";
			String len = jsonO.getString("len");
			if (jsonO.getString("type").equals("String")) {
				stype = "varchar";
			}
			if (jsonO.getString("type").equals("int")) {
				stype = "int";
			}
			if (len.equals("") || len.equals(null)) {
				len = "255";
			}
			for (amctMonitor a : list) {
				if (a.getId().equals(jsonO.getString("id"))) {
					/**
					 * 先修改字段类型
					 */
					try {
						String str = "alter table amct_" + menu_ename
								+ " modify column " + a.getMenu_ename() + " "
								+ stype + "(" + len + ") DEFAULT NULL";
						System.out.println(str);
						atm.updateTabFiled(str);
					} catch (Exception e) {
						System.out.println(e);
					}

					String str = "alter table amct_" + menu_ename + " change "
							+ a.getMenu_ename() + " "
							+ jsonO.getString("menu_ename") + "  " + stype
							+ "(" + len + ") DEFAULT NULL";
					System.out.println(str);
					atm.updateTabFiled(str);
				}

			}
			/**
			 * jsonO.getString("id") 为空，证明是新增字段
			 */
			if (jsonO.getString("id") == "" || jsonO.getString("id") == null) {
				String addstr = "alter table amct_" + menu_ename + " add "
						+ jsonO.getString("menu_ename") + " " + stype + "("
						+ len + ") DEFAULT NULL";
				System.out.println(addstr);
				atm.updateTabFiled(addstr);
			}
		}

		/**
		 * 找出新增或删除的字段 ids数组装好了页面传过来的id ,判断数据库查询出来的id是否在ids里面，不存在，则表示已经被删除
		 */

		for (amctMonitor a : list) {

			if (!ids.contains(a.getId())) {
				System.out.println(a.getId());
				System.out.println(ids.contains(a.getId()));
				/**
				 * 删除字段
				 */
				String addstr = "alter table amct_" + menu_ename + " DROP "
						+ a.getMenu_ename();
				System.out.println(addstr);
				atm.updateTabFiled(addstr);

			}
		}

		/**
		 * 先删除，后加入
		 */
		amd.del(id);
		// 加入子表
		// waiting
		amctMonitor am = null;
		for (int i = 0; i < parse.size(); i++) {
			JSONObject jsonObject = JSON.parseObject(parse.get(i).toString());
			am = new amctMonitor();
			am.setId(UUID.randomUUID().toString().replaceAll("-", ""));
			am.setMenu_id(id);
			am.setMenu_ename(jsonObject.getString("menu_ename"));
			am.setMenu_name(jsonObject.getString("menu_name"));
			am.setLen(jsonObject.getString("len"));
			am.setType(jsonObject.getString("type"));
			am.setIs_query(jsonObject.getString("is_query"));
			amd.insert(am);
		}
		return afm.updateleftMenu(id, menu_name, menu_display, icon,menu_remark);
	}

}
