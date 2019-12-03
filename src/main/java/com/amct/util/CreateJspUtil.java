package com.amct.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;

public class CreateJspUtil {

	// 创建JSP文件
	public static String createJsp(String table_field, String menu_ename,
			HttpSession session) throws IOException {
		// 获取当前项目的路径
		String realPath = session.getServletContext().getRealPath(
				File.separator);
		String path = realPath + "menu";

		File file2 = new File(path);
		if (!file2.exists()) {
			file2.mkdirs();
		};
		String newJSP = realPath + "menu" + File.separator + menu_ename
				+ ".jsp";
		// 创健实体文件
		File fileJSP = new File(newJSP);
		boolean newFile = fileJSP.createNewFile();
		if (newFile) {
			// 创建成功，写入文件
			FileOutputStream out = new FileOutputStream(fileJSP, false);
			StringBuffer data = new StringBuffer();
			data.append("<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%>\n");
			data.append("<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>\n");
			data.append("<html>\n");
			data.append("<head>\n");
			data.append("<jsp:include page='../index.jsp'></jsp:include>\n");
			data.append("</head>\n");
			data.append("<body>\n");
			data.append("this is firest JSP\n");
			data.append("</body>\n");
			data.append("</html>\n");
			out.write(data.toString().getBytes("utf-8"));
			out.flush();
			out.close();
			
		}
		return newJSP;
	}
}
