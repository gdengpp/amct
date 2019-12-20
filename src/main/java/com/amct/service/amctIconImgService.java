package com.amct.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.amct.entity.amctIconImg;

@Service
public interface amctIconImgService {
	// 查询所有信息，不分页
	List<amctIconImg> findAll();

	// 分页查询所有信息
	List<amctIconImg> find(String icon_name, Integer begin, Integer end);

	// 新增
	Integer addIcon(String icon_class, String icon_name, String icon_code,
			String remark);

	// 修改
	Integer modify(String id, String icon_class, String icon_name,
			String icon_code, String remark);

	// 删除
	Integer remove(String id);
	
	Integer getCount(String icon_name);
}
