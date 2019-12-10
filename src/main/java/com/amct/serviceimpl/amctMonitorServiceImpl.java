package com.amct.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amct.dao.amctMonitorDao;
import com.amct.entity.amctMonitor;
import com.amct.service.amctMonitorService;

@Service
public class amctMonitorServiceImpl implements amctMonitorService{

	@Autowired
	private amctMonitorDao a;

	@Override
	public List<amctMonitor> findAll(String menu_id) {
		// TODO Auto-generated method stub
		return a.queryAll(menu_id);
	}
	
	
}
