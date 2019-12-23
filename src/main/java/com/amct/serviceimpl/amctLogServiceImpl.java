package com.amct.serviceimpl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amct.dao.amctLogDao;
import com.amct.entity.amctLog;
import com.amct.service.logService;

@Service
public class amctLogServiceImpl implements logService {

	@Autowired
	private amctLogDao a;

	@Override
	public List<amctLog> find(String user_name, String status,String menu_code, Integer page,
			Integer limit) {
		Integer begin = (page - 1) * limit;
		return a.query(user_name, status, menu_code,begin, limit);
	}

	@Override
	public Integer getCount(String user_name,String status,String menu_code) {
		return a.count(user_name, status, menu_code);
	}

	@Override
	public void insert(String user_name, String opt, String status,String menu_code) {
		amctLog log = new amctLog();
		log.setId(UUID.randomUUID().toString());
		log.setLog_date(new Date());
		log.setOpt(opt);
		log.setStatus(status);
		log.setUser_name(user_name);
		log.setMenu_code(menu_code);
		a.add(log);
	}

	@Override
	public List<String> findUserName() {
		return a.queryUserName();
	}

	@Override
	public List<String> findMenuCode() {
		return a.queryMenuCode();
	}

	@Override
	public void removeAll() {
		a.delAll();
	}

}
