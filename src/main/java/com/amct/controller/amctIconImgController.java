package com.amct.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amct.dto.findListDto;
import com.amct.entity.amctIconImg;
import com.amct.service.amctIconImgService;

@Controller
@RequestMapping("/amct_icon")
@Scope("prototype")
public class amctIconImgController {

	@Autowired
	private amctIconImgService a;

	@RequestMapping("/queryAll")
	@ResponseBody
	public List<amctIconImg> findAll() {
		return a.findAll();
	}

	@RequestMapping("/query")
	@ResponseBody
	public findListDto<amctIconImg> find(String icon_name, Integer page,
			Integer limit) {
		List<amctIconImg> list = a.find(icon_name, page, limit);
		findListDto<amctIconImg> fd = new findListDto<amctIconImg>();
		List<amctIconImg> list2 = a.findAll();
		fd.setData(list);
		fd.setCode(0);
		fd.setCount(list2.size());
		fd.setMsg("查询成功");
		return fd;
	}

	@RequestMapping("/addIcon")
	@ResponseBody
	public Integer addIcon(String icon_class, String icon_name,
			String icon_code, String remark) {
		return a.addIcon(icon_class, icon_name, icon_code, remark);
	}

	@RequestMapping("/modify")
	@ResponseBody
	public Integer modify(String id, String icon_class, String icon_name,
			String icon_code, String remark) {
		return a.modify(id, icon_class, icon_name, icon_code, remark);
	}

	@RequestMapping("/remove")
	@ResponseBody
	public Integer remove(String id) {
		return a.remove(id);
	}
}
