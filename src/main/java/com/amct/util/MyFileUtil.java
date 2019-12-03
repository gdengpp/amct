package com.amct.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.web.multipart.MultipartFile;

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
