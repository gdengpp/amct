package com.amct.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amct.entity.amctMonitor;
import com.amct.service.amctMonitorService;

@Controller
@RequestMapping("/monitor")
@Scope("prototype")
public class amctMonitorController {

	@Autowired
	private amctMonitorService a;
	@ResponseBody
	@RequestMapping("/findMonitorList")
	public List<amctMonitor> findMenuList(String menu_id, Integer page,
			Integer limit) {
		List<amctMonitor> list = a.findAll(menu_id);
		return list;
	}
}
