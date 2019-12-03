package com.amct.serviceimpl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amct.dao.amctTopMenuDao;
import com.amct.entity.amctSysLogo;
import com.amct.entity.amctTopMenu;
import com.amct.entity.amctUser;
import com.amct.service.amctTopMenuService;

@Service
public class amctTopMenuServiceImpl implements amctTopMenuService {

	@Autowired
	private amctTopMenuDao atm;

	@Override
	public List<amctTopMenu> findAll() {
		// TODO Auto-generated method stub
		System.out.println(atm);
		return atm.queryAll();
	}

	@Override
	public Integer addMenu(amctTopMenu am) {
		return atm.insertMenu(am);
	}

	@Override
	public amctSysLogo findLogo() {
		// TODO Auto-generated method stub
		return atm.queryLogo();
	}

	@Override
	public amctUser finduserInfo() {
		// TODO Auto-generated method stub
		return atm.queryUserInfo();
	}

	@Override
	public List<amctTopMenu> findList(String name, Integer page, Integer limit) {
		if (name != null) {
			name = "%" + name + "%";
		}
		return atm.queryList(name, page - 1, limit);
	}

	@Override
	public String addTouMenu(String menu_name, String menu_ename,
			String menu_display, String menu_remark, String table_field,
			String tab_url, String field) {
		/**
		 * table_field:创建表的字段，拼装好的 field：入库字段
		 */
		// 第一步，创建表
		Boolean flag = true;
		try {
			atm.addTopMenu("amct_" + menu_ename, table_field);
			// 插入top表
		} catch (Exception e) {
			flag = false;
		}
		if (flag) {
			try {
				amctTopMenu at = new amctTopMenu();
				at.setEname(menu_ename);
				at.setId(UUID.randomUUID().toString().replaceAll("-", ""));
				at.setIs_display(menu_display);
				at.setName(menu_name);
				at.setRemark(menu_remark);
				at.setUrl(tab_url);
				at.setTab_field(field);
				atm.insertMenu(at);
			} catch (Exception e) {
				atm.delTab("amct_" + menu_ename);
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
			atm.delTab("amct_" + tab_name);
			inte = 1;
		} catch (Exception e) {
			inte = 0;
		}
		try {
			atm.delTopMenuById(id);
			atm.delLeftMenuByTopId(id);
			atm.delLeftMenuChildByTopId(id);
			inte = 1;
		} catch (Exception e) {
			System.out.println(e);
			inte = 0;
		}

		return inte;
	}

	@Override
	public String topMenuEdit(String id, String menu_ename,String menu_name, String menu_display,
			String menu_remark, String table_field) {
		// TODO Auto-generated method stub
		//修改菜单前通过id查询，表字段是否改变，改变则去修改表
		String tab_field = atm.queryTopMenuById(id);
		if(tab_field.equals(table_field)){
			//查询出数据，先删除，后新建，在增加
			atm.delTab("amct_" + menu_ename);
			
		}
		atm.updateTopMenu(id, menu_name, menu_display, menu_remark, table_field);
		return null;
	}

}
