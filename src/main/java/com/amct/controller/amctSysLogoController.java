package com.amct.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.amct.entity.amctSysLogo;
import com.amct.service.amctSysLogoService;
import com.amct.util.MyFileUtil;

@Controller
@RequestMapping("/logo")
@Scope("prototype")
public class amctSysLogoController {

	@Autowired
	private amctSysLogoService a;
	
	@RequestMapping("/find")
	@ResponseBody
	public amctSysLogo find(){
		return a.find();
	}
	
	@RequestMapping("/modifyBase")
	@ResponseBody
	public Integer modifyBase(String name,String is_display){
		return a.modifyBase(name,is_display);
	}
	
	@RequestMapping("/upload")
	@ResponseBody
	public Integer modify(MultipartFile file, HttpSession session){
		
		String realPath = session.getServletContext().getRealPath(
				File.separator);
		// 获取文件原始名
		String fullName = file.getOriginalFilename();
		// 获取文件后缀名
		String ext = FilenameUtils.getExtension(fullName);
		// 保存图片到D:\ upload 用uuid命名文件名防止文件名相同互相覆盖
		String fileName = UUID.randomUUID().toString().replaceAll("-", "");
		try {
			// 将上传文件保存到服务器上指定文件路径
			file.transferTo(new File(realPath + "static" + File.separator
					+ "image" + File.separator + fileName + "." + ext));
			/**
			 * 上传成功，先删除以前的图片。保存入库
			 */
			amctSysLogo find = a.find();
			/**
			 * 删除
			 */
			if (!find.getUrl().equals("static/image/woman.jpg")) {
				MyFileUtil.delFile(realPath + find.getUrl());
			}
			Integer p = a.modify("static" + File.separator + "image"+ File.separator + fileName + "." + ext);
			if (p == 0) {
				MyFileUtil.delFile(realPath + "static" + File.separator
						+ "image" + File.separator + fileName + "." + ext);
				return 1;
			}
		
			return 0;
		} catch (Exception e) {
			// TODO: handle exception
			MyFileUtil.delFile(realPath + "static" + File.separator + "image"
					+ File.separator + fileName + "." + ext);
			return 1;
		}
		
	}
}
