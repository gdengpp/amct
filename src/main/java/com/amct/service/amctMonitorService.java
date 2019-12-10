package com.amct.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.amct.entity.amctMonitor;

@Service
public interface amctMonitorService {

	//查询所有
	List<amctMonitor> findAll(String menu_id);
}
