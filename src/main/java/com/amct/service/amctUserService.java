package com.amct.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.amct.entity.amctUser;

@Service
public interface amctUserService {

	/**
	 * 用户登录
	 */
	amctUser findByUsername(String username, String user_key);

	/**
	 * 用户查询
	 */
	List<amctUser> findAllUser(String username,Integer page,Integer limit);
	
	/**
	 * 增加用户
	 */
	Integer addUser(String name, String username, String password, Integer sex,
			Integer age, String url, String phone, String email, String remark);

	/**
	 * 删除用户
	 */
	
	Integer remove(String id);

	/**
	 * 修改用户
	 */
	Integer modifyUser(String name, String username, String password, Integer sex,
			Integer age, String url, String phone, String email, String remark);
	
	Integer getCount(String username);
}
