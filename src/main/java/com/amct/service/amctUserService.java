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
	Integer addUser(String role_id,String name, String username, String password, Integer sex,
			Integer age, String url, String phone, String email, String remark,Integer status);

	/**
	 * 删除用户
	 */
	
	Integer remove(String id);

	/**
	 * 修改用户
	 */
	Integer modifyUser(String role_id,String id,String name, String username, String password, Integer sex,
			Integer age, String phone, String email, String remark,Integer status);
	
	Integer getCount(String username);
	
	/**
	 * 修改密码
	 */
	Integer modifyPass(String password,String id);
	
	/**
	 * 修改头像
	 */
	Integer modifyPicture(String url,String id);
}
