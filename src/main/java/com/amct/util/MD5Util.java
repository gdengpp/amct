package com.amct.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.util.DigestUtils;

/**
 * 
 * @author 李老湿
 * @date 2017年5月2日
 */
public class MD5Util {
	/**
	 * spring 工具类 MD5加密
	 * 
	 */
	public static String md5(String password) {
		return DigestUtils.md5DigestAsHex(password.getBytes());
	}

	/**
	 * shiroMD5+散列 时间：2016-8-21
	 */
	public static Md5Hash shiromd5(String password, String salt) {
		return new Md5Hash(password, salt, 2);
	}

	public static void main(String[] args) {

		String salt = getSalt(6);
		System.out.println(salt);
		Md5Hash shiromd5 = shiromd5("123", salt);
		System.out.println(shiromd5);
		String key = getKey(shiromd5.toString(), salt);
		System.out.println(key);
		String password = getSaltByPassword(key);
		System.out.println(password);

	}

	/**
	 * JDK Md5加密
	 */
	public static String jdkMD(String target) {
		StringBuilder stringBuilder = new StringBuilder();
		MessageDigest digest = null;
		try {
			digest = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		byte[] digest2 = digest.digest(target.getBytes());
		for (byte b : digest2) {
			int l = b & 0xff;
			if (l < 16) {
				stringBuilder.append("0");
			}
			stringBuilder.append(Integer.toHexString(l));
		}
		return stringBuilder.toString();
	}

	/**
	 * 给用户密码加盐，增加安全性
	 */
	public static String getSalt(int count) {
		// 生成随机字符
		char[] str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();

		// 随机数
		Random random = new Random();
		/**
		 * StringBuilder 线程不安全 效率高 常用 StringBuffer 线程安全 效率低
		 */
		String salt = "";
		for (int i = 0; i < count; i++) {
			salt += str[random.nextInt(str.length)];
		}

		return salt;

	}

	/**
	 * 把salt放入密码中
	 */
	public static String getKey(String pass, String salt) {
		String newpassword = "";
		String tmp = pass.substring(0, 3);
		String estr = pass.substring(3, pass.length());
		newpassword = tmp + salt + estr;
		return newpassword;
	}

	/**
	 * 取出salt
	 */
	public static String getSaltByPassword(String pass) {
		String tmp = pass.substring(3, 9);
		return tmp;
	}

}
