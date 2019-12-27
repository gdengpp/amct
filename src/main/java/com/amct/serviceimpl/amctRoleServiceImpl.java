package com.amct.serviceimpl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.amct.dao.amctMenuUserRoleDao;
import com.amct.dao.amctRoleDao;
import com.amct.entity.amctMenuRole;
import com.amct.entity.amctRole;
import com.amct.service.amctRoleService;

@Service
public class amctRoleServiceImpl implements amctRoleService {

	@Autowired
	private amctRoleDao ar;

	@Autowired
	private amctMenuUserRoleDao amurd;

	@Override
	public Integer add(String role_name, String role_code, Integer role_status,
			String remark) {
		amctRole a = new amctRole();
		a.setId(UUID.randomUUID().toString());
		a.setRemark(remark);
		a.setRole_code(role_code);
		a.setRole_name(role_name);
		a.setRole_status(role_status);
		return ar.insert(a);
	}

	@Override
	public Integer modify(String id, String role_name, String role_code,
			Integer role_status, String remark) {
		amctRole a = new amctRole();
		a.setId(id);
		a.setRemark(remark);
		a.setRole_code(role_code);
		a.setRole_name(role_name);
		a.setRole_status(role_status);
		return ar.upate(a);
	}

	@Override
	public Integer remove(String id) {
		ar.del(id);
		amurd.removeMenuRole(null, id);
		amurd.removeUserRole(null, id);
		return 1;
	}

	@Override
	public List<amctRole> find(String role_name, Integer page, Integer limit) {
		if (role_name != null) {
			role_name = "%" + role_name + "%";
		}
		Integer begin = (page - 1) * limit;
		return ar.find(role_name, begin, limit);
	}

	@Override
	public Integer getCount(String role_name) {
		if (role_name != null) {
			role_name = "%" + role_name + "%";
		}
		return ar.count(role_name);
	}

	@Override
	public Integer auth(String role_id, String menu_id) {
		
		/**
		 * 先删除，后授权
		 */
		amurd.removeMenuRole(menu_id, role_id);
		
		@SuppressWarnings("unchecked")
		List<String> list = (List<String>) JSON.parse(menu_id);
		for (int i = 0; i < list.size(); i++) {
			amctMenuRole a = new amctMenuRole();
			a.setId(UUID.randomUUID().toString());
			a.setMenu_id(list.get(i));
			a.setRole_id(role_id);
			amurd.insertMenuRole(a);
		}
		return 1;
	}

	@Override
	public List<String> getMenuId(String role_id) {
		return ar.queryMenuRole(role_id);
	}

	@Override
	public List<amctRole> findRole() {
		return ar.queryRole();
	}

}
