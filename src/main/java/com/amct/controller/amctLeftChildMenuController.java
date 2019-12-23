package com.amct.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.amct.service.amctLeftChildMenuService;
import com.amct.util.CreateJavaUtil;
import com.amct.util.CreateJspUtil;
import com.amct.util.MyFileUtil;
import com.amct.util.OSinfo;
import com.amct.util.logger;

@Controller
@RequestMapping("/left_child_menu")
@Scope("prototype")
public class amctLeftChildMenuController {

	@Autowired
	private amctLeftChildMenuService ats;

	/*
	 * 菜单新增
	 */
	@ResponseBody
	@RequestMapping("/leftChildMenuAdd")
	public String topMenuAdd(String pid, String menu_name, String menu_ename,
			String menu_display, String icon, String menu_remark,
			HttpSession session, String table_field, String field) {

		@SuppressWarnings("unchecked")
		List<Object> parse = (List<Object>) JSON.parse(field);

		String realPath = session.getServletContext().getRealPath(
				File.separator);
		try {
			MyFileUtil.delFile(realPath + "java" + File.separator + "entity");
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"), "进入增加优先删除entity文件异常"
					+ e, "info", "left_child_menu");
		}
		/*
		 * 获取菜单名和英文名，通过英文名来创建菜单的文件，放在menu文件夹中
		 */

		String tab_url = "menu" + File.separator + menu_ename + ".jsp";
		// 创建JSP文件=======================================================
		String createJsp = null;
		try {
			createJsp = CreateJspUtil.createJsp(parse, menu_ename, session);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"), "创建JSP文件异常，删除创建的文件",
					"error", "left_child_menu");
			// 创建JSP文件异常，删除创建的文件，返回
			MyFileUtil.delFile(realPath + "menu" + File.separator + menu_ename
					+ ".jsp");
			return "no";
		}

		// 创建Java 实体文件
		try {
			CreateJavaUtil.createJavaEntityFile(parse, menu_ename, session);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"), "创建Java实体文件异常",
					"error", "left_child_menu");
			return "no";
		}

		// 创建dao文件========
		try {
			CreateJavaUtil.createJavaDaoFile(parse, menu_ename, session);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"), "创建Java dao文件异常",
					"error", "left_child_menu");
			return "no";
		}
		// 创建service文件
		try {
			CreateJavaUtil.createJavaFileService(parse, menu_ename, session);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"),
					"创建Java service文件异常", "error", "left_child_menu");
			return "no";
		}
		// 创建server实现类文件

		try {
			CreateJavaUtil
					.createJavaFileServiceImpl(parse, menu_ename, session);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"),
					"创建Java service impl文件异常", "error", "left_child_menu");
			return "no";
		}
		// 创建mapper文件
		String mapper = null;
		try {
			mapper = CreateJavaUtil.createMapper(parse, menu_ename, session);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"),
					"创建Java mapper文件异常，删除创建的文件", "error", "left_child_menu");
			MyFileUtil.delFile(mapper);
			return "no";
		}
		// 创建Controller文件
		String controller = null;
		try {
			controller = CreateJavaUtil.createJavaFileController(parse,
					menu_ename, session);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"),
					"创建Java Controller文件异常，删除创建的文件", "error", "left_child_menu");
			MyFileUtil.delFile(mapper);
			MyFileUtil.delFile(controller);
			return "no";
		}
		// 都创建完成之后编译java文件，把编译后的class文件copy到对应的位置

		try {
			Thread.sleep(1000 * 1);
			// 赋权
			Runtime.getRuntime().exec("/appdata/amct/authorization.py");
			Thread.sleep(500 * 1);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"), "服务器上赋权", "debug",
					"left_child_menu");
		}

		// windows下：
		String str = "javac -d " + realPath + "WEB-INF" + File.separator
				+ "classes -encoding utf-8 -cp D:" + File.separator + "java"
				+ File.separator + "jar" + File.separator + "*; D:"
				+ File.separator + "java" + File.separator
				+ "findListDto.java " + realPath + "java" + File.separator
				+ "entity" + File.separator + "*.java";
		try {
			Process process = null;
			logger.log(session.getAttribute("login_name"), "OSinfo.isWindows()"
					+ OSinfo.isWindows(), "debug", "top_menu");
			if (OSinfo.isWindows()) {
				try {
					logger.log(session.getAttribute("login_name"),
							"windows下执行str:" + str, "debug", "top_menu");
					process = Runtime.getRuntime().exec(str);
				} catch (Exception e) {

				}
			} else {
				try {
					process = Runtime.getRuntime().exec(
							"/appdata/amct/compile.py");
				} catch (Exception e) {
					logger.log(session.getAttribute("login_name"),
							"linux下执行compile异常e:" + e, "error",
							"left_child_menu");
					MyFileUtil.delCopyFile(menu_ename, session);
				}
			}
			Thread.sleep(1000 * 1);

			int exitVal = process.waitFor();
			String status = "no";
			if (exitVal == 0) {
				// 入库
				status = ats.addleftChildMenu(pid, menu_name, menu_ename,
						menu_display, icon, menu_remark, table_field, tab_url,
						parse);
				if (status == "no") {
					// 入库不成功，删除文件
					MyFileUtil.delCopyFile(menu_ename, session);
					MyFileUtil.delFile(createJsp);
					MyFileUtil.delFile(mapper);
				} else {
					try {
						// 重启tomcat
						Runtime.getRuntime().exec(
								"/appdata/amct/restart_web.py");
					} catch (Exception e) {
						logger.log(session.getAttribute("login_name"),
								"入库成功，重启tomcat脚本异常" + e, "debug",
								"left_child_menu");
					}
				}
			} else {
				MyFileUtil.delCopyFile(menu_ename, session);
				MyFileUtil.delFile(createJsp);
				MyFileUtil.delFile(mapper);
			}
			return status;
		} catch (Exception e) {
			MyFileUtil.delCopyFile(menu_ename, session);
			logger.log(session.getAttribute("login_name"), e + "编译文件异常",
					"info", "left_child_menu");
			MyFileUtil.delFile(mapper);
			MyFileUtil.delFile(createJsp);
			return "no";
		}
	}

	/*
	 * 编辑新增
	 */
	@ResponseBody
	@RequestMapping("/leftChildMenuEdit")
	public Integer topMenuEdit(String id, String menu_ename, String menu_name,
			String menu_display, String menu_remark, String icon, String field,
			HttpSession session) {
		/**
		 * 先删除，后从新编译
		 */
		Integer status = 0;
		// =========================删除文件=============================

		String realPath = session.getServletContext().getRealPath(
				File.separator);
		try {
			MyFileUtil.delFile(realPath + "java" + File.separator + "entity");
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"), "进入编辑优先删除异常" + e,
					"error", "left_child_menu");
		}
		String newJSP = realPath + "menu" + File.separator + menu_ename
				+ ".jsp";
		// 删除jsp文件
		MyFileUtil.delFile(newJSP);
		// 删除java文件
		// entity
		MyFileUtil.delFile(realPath + "WEB-INF" + File.separator + "classes"
				+ File.separator + "com" + File.separator + "amct"
				+ File.separator + "entity" + File.separator + menu_ename
				+ ".class");

		// Controller
		MyFileUtil.delFile(realPath + "WEB-INF" + File.separator + "classes"
				+ File.separator + "com" + File.separator + "amct"
				+ File.separator + "controller" + File.separator + menu_ename
				+ "Controller.class");
		// service
		MyFileUtil.delFile(realPath + "WEB-INF" + File.separator + "classes"
				+ File.separator + "com" + File.separator + "amct"
				+ File.separator + "service" + File.separator + menu_ename
				+ "Service.class");

		// serviceIpml
		MyFileUtil.delFile(realPath + "WEB-INF" + File.separator + "classes"
				+ File.separator + "com" + File.separator + "amct"
				+ File.separator + "serviceimpl" + File.separator + menu_ename
				+ "ServiceImpl.class");
		// Dao
		MyFileUtil.delFile(realPath + "WEB-INF" + File.separator + "classes"
				+ File.separator + "com" + File.separator + "amct"
				+ File.separator + "dao" + File.separator + menu_ename
				+ "Dao.class");

		// mapper
		MyFileUtil.delFile(realPath + "WEB-INF" + File.separator + "classes"
				+ File.separator + "mapper" + File.separator + menu_ename
				+ ".xml");

		MyFileUtil.delCopyFile(menu_ename, session);
		// =========================删除文件=============================

		@SuppressWarnings("unchecked")
		List<Object> parse = (List<Object>) JSON.parse(field);

		/*
		 * 获取菜单名和英文名，通过英文名来创建菜单的文件，放在menu文件夹中
		 */

		// 创建JSP文件=======================================================
		String createJsp = null;
		try {
			createJsp = CreateJspUtil.createJsp(parse, menu_ename, session);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"), "创建JSP文件" + e,
					"error", "left_child_menu");
			// 创建JSP文件异常，删除创建的文件，返回
			MyFileUtil.delFile(realPath + "menu" + File.separator + menu_ename
					+ ".jsp");
			return status;
		}

		// 创建Java 实体文件
		try {
			CreateJavaUtil.createJavaEntityFile(parse, menu_ename, session);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"), "创建Java 实体文件" + e,
					"error", "left_child_menu");
			return status;
		}

		// 创建dao文件========
		try {
			CreateJavaUtil.createJavaDaoFile(parse, menu_ename, session);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"), "创建Java dao文件" + e,
					"error", "left_child_menu");
			return status;
		}
		// 创建server文件
		try {
			CreateJavaUtil.createJavaFileService(parse, menu_ename, session);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"), "创建Java service文件"
					+ e, "error", "left_child_menu");
			return status;
		}
		// 创建server实现类文件

		try {
			CreateJavaUtil
					.createJavaFileServiceImpl(parse, menu_ename, session);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"), "创建Java impl文件" + e,
					"error", "left_child_menu");
			return status;
		}
		// 创建mapper文件
		String mapper = null;
		try {
			mapper = CreateJavaUtil.createMapper(parse, menu_ename, session);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"), "创建Java mapper文件"
					+ e, "error", "left_child_menu");
			MyFileUtil.delFile(mapper);
			return status;
		}
		// 创建Controller文件
		String controller = null;
		try {
			controller = CreateJavaUtil.createJavaFileController(parse,
					menu_ename, session);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"),
					"创建Java controller文件" + e, "error", "left_child_menu");
			MyFileUtil.delFile(mapper);
			MyFileUtil.delFile(controller);
			return status;
		}

		try {
			Thread.sleep(1000 * 1);
			// 赋权
			Runtime.getRuntime().exec("/appdata/amct/authorization.py");
			Thread.sleep(500 * 1);
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"), "服务器上赋权", "debug",
					"left_child_menu");
		}

		// 都创建完成之后编译java文件，把编译后的class文件copy到对应的位置

		String str = "javac -d " + realPath + "WEB-INF" + File.separator
				+ "classes -encoding utf-8 -cp D:" + File.separator + "java"
				+ File.separator + "jar" + File.separator + "*; D:"
				+ File.separator + "java" + File.separator
				+ "findListDto.java " + realPath + "java" + File.separator
				+ "entity" + File.separator + "*.java";

		try {
			Process process = null;
			logger.log(session.getAttribute("login_name"), "OSinfo.isWindows()"
					+ OSinfo.isWindows(), "debug", "top_menu");
			if (OSinfo.isWindows()) {
				try {
					logger.log(session.getAttribute("login_name"),
							"windows下执行str:" + str, "debug", "top_menu");
					process = Runtime.getRuntime().exec(str);
				} catch (Exception e) {

				}
			} else {
				try {
					process = Runtime.getRuntime().exec(
							"/appdata/amct/compile.py");
				} catch (Exception e) {
					logger.log(session.getAttribute("login_name"),
							"linux下执行compile异常e:" + e, "error",
							"left_child_menu");
					MyFileUtil.delCopyFile(menu_ename, session);
				}
			}
			Thread.sleep(1000 * 1);
			int exitVal = process.waitFor();
			if (exitVal == 0) {
				// 更新
				status = ats.leftChildMenuEdit(id, menu_ename, menu_name,
						menu_display, menu_remark, icon, parse);
				if (status == 0) {
					// 入库不成功，删除文件
					MyFileUtil.delCopyFile(menu_ename, session);
					MyFileUtil.delFile(createJsp);
					MyFileUtil.delFile(mapper);
				} else {
					try {
						// 重启tomcat
						Runtime.getRuntime().exec(
								"/appdata/amct/restart_web.py");
					} catch (Exception e) {
						logger.log(session.getAttribute("login_name"),
								"更新重启tomcat异常" + e, "info", "left_child_menu");
					}
				}
			} else {
				MyFileUtil.delCopyFile(menu_ename, session);
				MyFileUtil.delFile(createJsp);
				MyFileUtil.delFile(mapper);
			}
		} catch (Exception e) {
			MyFileUtil.delCopyFile(menu_ename, session);
			logger.log(session.getAttribute("login_name"), "编译文件异常" + e,
					"error", "left_child_menu");
			MyFileUtil.delFile(mapper);
			MyFileUtil.delFile(createJsp);
		}

		return status;
	}

	@ResponseBody
	@RequestMapping("/removeTab")
	public Integer removeTabName(String id, String tab_name, HttpSession session) {
		// 删除表
		Integer in = ats.removeTab(id, tab_name);
		// 删除文件
		if (in == 1) {
			String realPath = session.getServletContext().getRealPath(
					File.separator);
			String newJSP = realPath + "menu" + File.separator + tab_name
					+ ".jsp";
			// 删除jsp文件
			MyFileUtil.delFile(newJSP);
			// 删除java文件
			// entity
			MyFileUtil.delFile(realPath + "WEB-INF" + File.separator
					+ "classes" + File.separator + "com" + File.separator
					+ "amct" + File.separator + "entity" + File.separator
					+ tab_name + ".class");

			// Controller
			MyFileUtil.delFile(realPath + "WEB-INF" + File.separator
					+ "classes" + File.separator + "com" + File.separator
					+ "amct" + File.separator + "controller" + File.separator
					+ tab_name + "Controller.class");
			// service
			MyFileUtil.delFile(realPath + "WEB-INF" + File.separator
					+ "classes" + File.separator + "com" + File.separator
					+ "amct" + File.separator + "service" + File.separator
					+ tab_name + "Service.class");

			// serviceIpml
			MyFileUtil.delFile(realPath + "WEB-INF" + File.separator
					+ "classes" + File.separator + "com" + File.separator
					+ "amct" + File.separator + "serviceimpl" + File.separator
					+ tab_name + "ServiceImpl.class");
			// Dao
			MyFileUtil.delFile(realPath + "WEB-INF" + File.separator
					+ "classes" + File.separator + "com" + File.separator
					+ "amct" + File.separator + "dao" + File.separator
					+ tab_name + "Dao.class");

			// mapper
			MyFileUtil.delFile(realPath + "WEB-INF" + File.separator
					+ "classes" + File.separator + "mapper" + File.separator
					+ tab_name + ".xml");
			MyFileUtil.delCopyFile(tab_name, session);
		}
		return in;
	}
}
