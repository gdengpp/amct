package com.amct.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amct.dto.findListDto;
import com.amct.entity.amctRole;
import com.amct.service.amctRoleService;

@Controller
@RequestMapping("/role")
@Scope("prototype")
public class amctRoleController {

	@Autowired
	private amctRoleService rs;

	/**
	 * 新增
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Integer add(String role_name, String role_code, Integer role_status,
			String remark) {
		return rs.add(role_name, role_code, role_status, remark);
	}

	/**
	 * 修改
	 */
	@RequestMapping("/modify")
	@ResponseBody
	public Integer modify(String id, String role_name, String role_code,
			Integer role_status, String remark) {
		return rs.modify(id, role_name, role_code, role_status, remark);
	}

	/**
	 * 删除
	 */
	@RequestMapping("/remove")
	@ResponseBody
	public Integer remove(String id) {
		return rs.remove(id);
	}

	/**
	 * 查询
	 */
	@RequestMapping("/find")
	@ResponseBody
	public findListDto<amctRole> find(String role_name, Integer page,
			Integer limit) {
		List<amctRole> list = rs.find(role_name, page, limit);
		Integer count = rs.getCount(role_name);
		findListDto<amctRole> fd = new findListDto<amctRole>();
		fd.setCode(0);
		fd.setCount(count);
		fd.setData(list);
		fd.setMsg("查询成功");
		return fd;
	}
	
	/**
	 * 授权
	 * 当前用户对菜单授权；对用户授权在用户管理中处理
	 */
	@RequestMapping("/auth")
	@ResponseBody
	public Integer auth(String role_id,String menu_id){
		return rs.auth(role_id,menu_id);
	}
	
	@RequestMapping("/getMenuId")
	@ResponseBody
	public List<String> getMenuId(String role_id){
		return rs.getMenuId(role_id);
	}
	
	@RequestMapping("/findRole")
	@ResponseBody
	public List<amctRole> findRole(){
		return rs.findRole();
	}
}
