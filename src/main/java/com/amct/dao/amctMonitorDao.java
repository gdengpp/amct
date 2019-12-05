package com.amct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.amctMonitor;

public interface amctMonitorDao {

	// 通过菜单ID查询子表字段
	List<amctMonitor> queryAll(@Param("menu_id") String menu_id);

	// 通过菜单ID删除子表
	Integer del(@Param("menu_id") String menu_id);

	// 增加子表
	Integer insert(amctMonitor am);

}
