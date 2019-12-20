package com.amct.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amct.dto.findListDto;
import com.amct.entity.amctLog;
import com.amct.service.logService;

@Controller
@RequestMapping("/amct_log")
@Scope("prototype")
public class amctLogController {

	@Autowired
	private logService ls;

	@RequestMapping("/find")
	@ResponseBody
	public findListDto<amctLog> find(String user_name, String status,String menu_code,
			Integer page, Integer limit,HttpSession session) {
		List<amctLog> list = ls.find(user_name, status,menu_code, page, limit);
		findListDto<amctLog> fd = new findListDto<amctLog>();
		fd.setData(list);
		fd.setCode(0);
		fd.setCount(ls.getCount(user_name, status, menu_code));
		fd.setMsg("查询成功");
		return fd;
	}

	@RequestMapping("/findUsername")
	@ResponseBody
	public List<String> findUsername() {
		return ls.findUserName();
	}
	
	@RequestMapping("/findMenucode")
	@ResponseBody
	public List<String> findMenucode() {
		return ls.findMenuCode();
	}
}
