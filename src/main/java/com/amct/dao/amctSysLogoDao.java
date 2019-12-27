package com.amct.dao;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.amctSysLogo;

public interface amctSysLogoDao {

	/**
	 * 查询
	 */
	amctSysLogo query();
	
	/**
	 * 修改图片
	 */
	Integer upate(@Param("url")String url);
	
	/**
	 * 修改基本信息
	 */
	Integer updateBase(@Param("name")String name,@Param("is_display")String is_display);
}
