package com.amct.util;

import java.io.File;
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
}
