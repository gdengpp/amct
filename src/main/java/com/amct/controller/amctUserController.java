package com.amct.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amct.dto.findListDto;
import com.amct.entity.amctUser;
import com.amct.service.amctUserService;

@Controller
@RequestMapping("/user")
@Scope("prototype")
public class amctUserController {

	@Autowired
	private amctUserService us;

	/**
	 * 查询
	 */
	@RequestMapping("/find")
	@ResponseBody
	public findListDto<amctUser> find(String username, Integer page,
			Integer limit) {
		List<amctUser> list = us.findAllUser(username, page, limit);
		findListDto<amctUser> fd = new findListDto<amctUser>();
		fd.setData(list);
		fd.setCode(0);
		fd.setCount(us.getCount(username));
		fd.setMsg("查询成功");
		return fd;
	}
	
	@RequestMapping("/remove")
	@ResponseBody
	public Integer remove(String id) {
		return us.remove(id);
	}
}
