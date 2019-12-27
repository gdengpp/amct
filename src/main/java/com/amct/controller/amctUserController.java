package com.amct.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.amct.dto.findListDto;
import com.amct.entity.amctUser;
import com.amct.service.amctUserService;
import com.amct.util.MyFileUtil;

@Controller
@RequestMapping("/user")
@Scope("prototype")
public class amctUserController {

	@Autowired
	private amctUserService us;

	/**
	 * 查询
	 */
	@RequestMapping("/find")
	@ResponseBody
	public findListDto<amctUser> find(String username, Integer page,
			Integer limit) {
		List<amctUser> list = us.findAllUser(username, page, limit);
		findListDto<amctUser> fd = new findListDto<amctUser>();
		fd.setData(list);
		fd.setCode(0);
		fd.setCount(us.getCount(username));
		fd.setMsg("查询成功");
		return fd;
	}

	@RequestMapping("/remove")
	@ResponseBody
	public Integer remove(String id) {
		return us.remove(id);
	}

	@RequestMapping("/add")
	@ResponseBody
	public Integer add(String role_id, String name, String username,
			String password, Integer sex, Integer age, String phone,
			String email, String remark, Integer status) {
		return us.addUser(role_id, name, username, password, sex, age, "static/image/man.jpg", phone,
				email, remark, status);
	}

	@RequestMapping("/modify")
	@ResponseBody
	public Integer modifyUser(String role_id, String id, String name,
			String username, String password, Integer sex, Integer age,
			String phone, String email, String remark, Integer status) {
		return us.modifyUser(role_id, id, name, username, password, sex, age,
				phone, email, remark, status);
	}

	@RequestMapping("/modifyPass")
	@ResponseBody
	public Integer modifyPass(String key, HttpSession session) {
		amctUser userSession = (amctUser) session.getAttribute("user");
		return us.modifyPass(key, userSession.getId());
	}

	/**
	 * 头像上传
	 */
	@RequestMapping("/upload")
	@ResponseBody
	public Integer upload(MultipartFile file, HttpSession session) {
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
			amctUser userSession = (amctUser) session.getAttribute("user");
			/**
			 * 删除
			 */
			if (!userSession.getUrl().equals("static/image/man.jpg")) {
				MyFileUtil.delFile(realPath + userSession.getUrl());
			}
			Integer p = us.modifyPicture("static" + File.separator + "image"
					+ File.separator + fileName + "." + ext,
					userSession.getId());
			if (p == 0) {
				MyFileUtil.delFile(realPath + "static" + File.separator
						+ "image" + File.separator + fileName + "." + ext);
				return 1;
			}
			amctUser user = us.findByUsername(userSession.getUsername(),
					userSession.getPassword());
			session.setAttribute("user", user);
			return 0;
		} catch (Exception e) {
			// TODO: handle exception
			MyFileUtil.delFile(realPath + "static" + File.separator + "image"
					+ File.separator + fileName + "." + ext);
			return 1;
		}

	}
}
