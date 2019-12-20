package com.amct.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.amct.entity.amctLog;

/**
 * 日志文件
 * 
 * @author dengpp
 * 
 */
@Service
public interface logService {

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
	List<amctLog> find(String user_name, String status, String menu_code,
			Integer page, Integer limit);

	Integer getCount(String user_name,String status,String menu_code);

	// 增加
	void insert(String user_name, String opt, String status, String menu_code);

	// 查询操作人作为下拉
	List<String> findUserName();

	// 查询操作人作为下拉
	List<String> findMenuCode();

}
