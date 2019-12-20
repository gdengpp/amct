package com.amct.serviceimpl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amct.dao.amctIconImgDao;
import com.amct.entity.amctIconImg;
import com.amct.service.amctIconImgService;

@Service
public class amctIconImgServiceImpl implements amctIconImgService {

	@Autowired
	private amctIconImgDao ad;

	@Override
	public List<amctIconImg> findAll() {
		return ad.queryAll();
	}

	@Override
	public List<amctIconImg> find(String icon_name, Integer page, Integer limit) {
		if (icon_name != null) {
			icon_name = "%" + icon_name + "%";
		}
		Integer begin = (page - 1) * limit;
		return ad.query(icon_name, begin, limit);
	}

	@Override
	public Integer addIcon(String icon_class, String icon_name,
			String icon_code, String remark) {
		amctIconImg am = new amctIconImg();
		am.setId(UUID.randomUUID().toString());
		am.setIcon_class(icon_class);
		am.setIcon_code(icon_code);
		am.setIcon_name(icon_name);
		am.setRemark(remark);
		return ad.add(am);
	}

	@Override
	public Integer modify(String id, String icon_class, String icon_name,
			String icon_code, String remark) {
		amctIconImg am = new amctIconImg();
		am.setId(id);
		am.setIcon_class(icon_class);
		am.setIcon_code(icon_code);
		am.setIcon_name(icon_name);
		am.setRemark(remark);
		return ad.update(am);
	}

	@Override
	public Integer remove(String id) {
		return ad.del(id);
	}

	@Override
	public Integer getCount(String icon_name) {
		if (icon_name != null) {
			icon_name = "%" + icon_name + "%";
		}
		return ad.count(icon_name);
	}

}
