package com.amct.service;

import org.springframework.stereotype.Service;

import com.amct.entity.amctSysLogo;

@Service
public interface amctSysLogoService {

	amctSysLogo find();
	
	Integer modify(String url);
	
	Integer modifyBase(String name,String is_display);
}
