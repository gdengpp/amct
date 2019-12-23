package com.amct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.amctLog;

public interface amctLogDao {

	/**
	 * 查询根据时间查询
	 * 
	 * @param user_name
	 *            操作人
	 * @param status
	 *            日志状态（debug/info/error）
	 * @param begin
	 *            开始时间
	 * @param end
	 *            结束时间
	 * @return
	 */
	List<amctLog> query(@Param("user_name") String user_name,
			@Param("status") String status,@Param("menu_code") String menu_code, @Param("begin") Integer begin,
			@Param("end") Integer end);

	// 新增
	Integer add(amctLog a);
	
	Integer count(@Param("user_name") String user_name,
			@Param("status") String status,@Param("menu_code") String menu_code);
	
	List<String> queryUserName();
	
	List<String> queryMenuCode();
	
	//清空
	void delAll();
}
