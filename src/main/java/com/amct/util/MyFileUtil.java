package com.amct.util;

import java.io.File;

import javax.servlet.http.HttpSession;
public class MyFileUtil {

	/**
	 * 删除文件
	 * 
	 * @return
	 */
	public static boolean delFile(String path) {
		File file = new File(path);
		if (!file.exists()) {
			return false;
		}
		if (file.isFile()) {
			return file.delete();
		} else {
			String[] filenames = file.list();
			for (String f : filenames) {
				delFile(path + File.separator + f);
			}
			return file.delete();
		}
	}
	/**
	 * 当操作删除时删除备份的文件，防止重新部署系统后出现多余的文件
	 * @param tab_name 表名
	 * @param session
	 */
	public static void delCopyFile(String tab_name, HttpSession session){
		try {
			String str = "rm -rf /appdata/amct/sourceFile/java/"+tab_name+"Controller.java"+
						        " /appdata/amct/sourceFile/java/"+tab_name+"Service.java"+
						        " /appdata/amct/sourceFile/java/"+tab_name+"ServiceImpl.java"+
						        " /appdata/amct/sourceFile/java/"+tab_name+"Dao.java"+
						        " /appdata/amct/sourceFile/java/"+tab_name+".java";
			logger.log(session.getAttribute("login_name"), "删除java str："+str, "debug", "top_menu");
			Process process = Runtime.getRuntime().exec(str);
			int exitVal = process.waitFor();
			logger.log(session.getAttribute("login_name"), "删除javaexitVal："+exitVal, "debug", "top_menu");
			
			Process processjsp = Runtime.getRuntime().exec("rm -rf /appdata/amct/sourceFile/jsp/"+tab_name+".jsp");
			int exitValjsp = processjsp.waitFor();
			logger.log(session.getAttribute("login_name"), "删除javaexitValjsp："+exitValjsp, "debug", "top_menu");
			Process processmapper = Runtime.getRuntime().exec("rm -rf /appdata/amct/sourceFile/mapper/"+tab_name+".xml");
			int exitValmapper = processmapper.waitFor();
			logger.log(session.getAttribute("login_name"), "删除exitValmapper："+exitValmapper, "debug", "top_menu");
		} catch (Exception e) {
			logger.log(session.getAttribute("login_name"), "删除失败", "error", "top_menu");
		}
	}
}
