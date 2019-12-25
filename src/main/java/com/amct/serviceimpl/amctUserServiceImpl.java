package com.amct.serviceimpl;

import java.util.List;
import java.util.UUID;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.amct.dao.amctUserDao;
import com.amct.entity.amctUser;
import com.amct.service.amctUserService;
import com.amct.util.MD5Util;

@Service
public class amctUserServiceImpl implements amctUserService {

	@Autowired
	private amctUserDao ud;

	@Override
	public amctUser findByUsername(String username, String user_key) {
		amctUser user = ud.queryByUsername(username);
		String salt = MD5Util.getSaltByPassword(user.getPassword());
		Md5Hash shiromd5 = MD5Util.shiromd5(user_key, salt);
		String key = MD5Util.getKey(shiromd5.toString(), salt);
		if (key.equals(user.getPassword())) {
			return user;
		}
		return null;
	}

	@Override
	public Integer addUser(String name, String username, String password,
			Integer sex, Integer age, String url, String phone, String email,
			String remark) {
		amctUser user = ud.queryByUsername(username);
		if (StringUtils.isEmpty(user)) {
			amctUser u = new amctUser();
			u.setId(UUID.randomUUID().toString());
			u.setName(name);
			u.setUsername(username);
			String salt = MD5Util.getSalt(6);
			Md5Hash shiromd5 = MD5Util.shiromd5(password, salt);
			u.setPassword(MD5Util.getKey(shiromd5.toString(), salt));
			u.setSex(sex);
			u.setAge(age);
			u.setStatus(0);
			if (StringUtils.isEmpty(url)) {
				url = "static/image/man.jpg";
			}
			u.setUrl(url);
			u.setPhone(phone);
			u.setEmail(email);
			u.setRemark(remark);
			return ud.insertUser(u);
		}
		return 0;

	}

	@Override
	public List<amctUser> findAllUser(String username, Integer page,
			Integer limit) {
		if (username != null) {
			username = "%" + username + "%";
		}
		Integer begin = (page - 1) * limit;
		return ud.queryAll(username, begin, limit);
	}

	@Override
	public Integer remove(String id) {
		return ud.delById(id);
	}

	@Override
	public Integer modifyUser(String name, String username, String password,
			Integer sex, Integer age, String url, String phone, String email,
			String remark) {
		amctUser u = new amctUser();
		u.setId(UUID.randomUUID().toString());
		u.setName(name);
		u.setUsername(username);
		String salt = MD5Util.getSalt(6);
		Md5Hash shiromd5 = MD5Util.shiromd5(password, salt);
		u.setPassword(MD5Util.getKey(shiromd5.toString(), salt));
		u.setSex(sex);
		u.setAge(age);
		if (StringUtils.isEmpty(url)) {
			url = "static/image/man.jpg";
		}
		u.setUrl(url);
		u.setPhone(phone);
		u.setEmail(email);
		u.setRemark(remark);
		return ud.updateUser(u);
	}

	@Override
	public Integer getCount(String username) {
		if (username != null) {
			username = "%" + username + "%";
		}
		return ud.count(username);
	}
}
