package com.amct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.amctUser;

public interface amctUserDao {

	// 用户登录
	amctUser queryByUsername(@Param("username") String username);

	/**
	 * 用户查询
	 */
	List<amctUser> queryAll(@Param("username") String username,
			@Param("begin") Integer begin, @Param("end") Integer end);
	
	Integer count(@Param("username") String username);

	/**
	 * 增加用户
	 */
	Integer insertUser(amctUser user);

	/**
	 * 删除用户
	 */
	Integer delById(@Param("id") String id);

	/**
	 * 修改用户
	 */
	Integer updateUser(amctUser user);
}
