package com.amct.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amct.dao.amctSysLogoDao;
import com.amct.entity.amctSysLogo;
import com.amct.service.amctSysLogoService;

@Service
public class amctSysLogoServiceImpl implements amctSysLogoService{

	@Autowired
	private amctSysLogoDao ad;
	
	@Override
	public amctSysLogo find() {
		return ad.query();
	}

	@Override
	public Integer modify(String url) {
		return ad.upate(url);
	}

	@Override
	public Integer modifyBase(String name, String is_display) {
		return ad.updateBase(name, is_display);
	}

}
