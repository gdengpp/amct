package com.amct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.amctIconImg;

public interface amctIconImgDao {

	// 查询所有信息，不分页
	List<amctIconImg> queryAll();

	// 分页查询所有信息
	List<amctIconImg> query(@Param("icon_name") String icon_name,
			@Param("begin") Integer begin, @Param("end") Integer end);
	
	//新增
	Integer add(amctIconImg am);
	//修改
	Integer update(amctIconImg am);
	//删除
	Integer del(@Param("id") String id);
	
	Integer count(@Param("icon_name") String icon_name);
}
