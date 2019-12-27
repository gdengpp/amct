package com.amct.serviceimpl;

import java.util.List;
import java.util.UUID;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.amct.dao.amctMenuUserRoleDao;
import com.amct.dao.amctUserDao;
import com.amct.entity.amctUser;
import com.amct.entity.amctUserRole;
import com.amct.service.amctUserService;
import com.amct.util.MD5Util;

@Service
public class amctUserServiceImpl implements amctUserService {

	@Autowired
	private amctUserDao ud;

	@Autowired
	private amctMenuUserRoleDao amurd;

	@Override
	public amctUser findByUsername(String username, String user_key) {
		amctUser user = ud.queryByUsername(username);
		if (user == null) {
			return null;
		}
		if (user.getPassword().equals(user_key)) {
			return user;
		}
		String salt = MD5Util.getSaltByPassword(user.getPassword());
		Md5Hash shiromd5 = MD5Util.shiromd5(user_key, salt);
		String key = MD5Util.getKey(shiromd5.toString(), salt);
		if (key.equals(user.getPassword())) {
			return user;
		}
		return null;
	}

	@Override
	public Integer addUser(String role_id, String name, String username,
			String password, Integer sex, Integer age, String url,
			String phone, String email, String remark, Integer status) {
		amctUser user = ud.queryByUsername(username);
		if (StringUtils.isEmpty(user)) {
			String user_id = UUID.randomUUID().toString();
			amctUser u = new amctUser();
			u.setId(user_id);
			u.setName(name);
			u.setUsername(username);
			String salt = MD5Util.getSalt(6);
			Md5Hash shiromd5 = MD5Util.shiromd5(password, salt);
			u.setPassword(MD5Util.getKey(shiromd5.toString(), salt));
			u.setSex(sex);
			u.setAge(age);
			u.setStatus(status);
			if (StringUtils.isEmpty(url)) {
				url = "static/image/man.jpg";
			}
			u.setUrl(url);
			u.setPhone(phone);
			u.setEmail(email);
			u.setRemark(remark);
			ud.insertUser(u);
			amctUserRole a = new amctUserRole();
			/**
			 * 添加角色表
			 */
			a.setId(UUID.randomUUID().toString());
			a.setUser_id(user_id);
			a.setRole_id(role_id);
			amurd.insertUserRole(a);
			return 1;
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
		amurd.removeUserRole(id, null);
		return ud.delById(id);
	}

	@Override
	public Integer modifyUser(String role_id, String id, String name,
			String username, String password, Integer sex, Integer age,
			String phone, String email, String remark, Integer status) {
		amctUser u = new amctUser();
		u.setId(id);
		u.setName(name);
		u.setUsername(username);
		amctUser user = ud.queryByUsername(username);
		if (password.equals(user.getPassword())) {
			u.setPassword(password);
		} else {
			String salt = MD5Util.getSalt(6);
			Md5Hash shiromd5 = MD5Util.shiromd5(password, salt);
			u.setPassword(MD5Util.getKey(shiromd5.toString(), salt));
		}
		u.setSex(sex);
		u.setAge(age);
		u.setPhone(phone);
		u.setEmail(email);
		u.setRemark(remark);
		u.setStatus(status);
		ud.updateUser(u);

		/**
		 * 添加角色表
		 */
		/**
		 * 先删除，后修改
		 */
		amurd.removeUserRole(id, null);
		amctUserRole a = new amctUserRole();
		a.setId(UUID.randomUUID().toString());
		a.setUser_id(id);
		a.setRole_id(role_id);
		amurd.insertUserRole(a);
		return 1;
	}

	@Override
	public Integer getCount(String username) {
		if (username != null) {
			username = "%" + username + "%";
		}
		return ud.count(username);
	}

	@Override
	public Integer modifyPass(String password, String id) {
		String salt = MD5Util.getSalt(6);
		Md5Hash shiromd5 = MD5Util.shiromd5(password, salt);
		return ud.updatePass(MD5Util.getKey(shiromd5.toString(), salt), id);
	}

	@Override
	public Integer modifyPicture(String url, String id) {
		return ud.updatePic(url, id);
	}
}
