package com.amct.test;

/*
 * add dengpp 20190920 加解密文件
 */

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class CryptoUtils {

	/**
	 * 测试代码
	 * 
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		
		List<List<String>> lists = new ArrayList<List<String>>();
		List<String> list = new ArrayList<String>();
		String str = "{field : 'name',title : '菜单名',align : 'left'}";
		list.add(str);
		System.out.println(list);
		lists.add(list);
		System.out.println(lists);
		/**
		 * @param data:加密的内容
		 */
		/*String data = "Gks_2019@xxkj";
		String encrypt = encrypt(data);
		System.out.println("加密后的密码：" + encrypt);

		String decrypt = decrypt("7141zedj722e16467ac51644f435a06cac1e87");
		System.out.println("解密后的密码：" + decrypt);*/
	}

	public static final String DEFAULT_CODING = "utf-8";

	/**
	 * 解密
	 * 
	 * @date 2019-09-23
	 * @param encrypted
	 * @return
	 * @throws Exception
	 */
	public static String decrypt(String encrypted) throws Exception {
		// 获取密文中的code
		String code = getCode(encrypted);
		// 获取密文中的passd
		String conntent = getPassword(encrypted);

		byte[] keyb = code.getBytes(DEFAULT_CODING);
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] thedigest = md.digest(keyb);
		SecretKeySpec skey = new SecretKeySpec(thedigest, "AES");
		Cipher dcipher = Cipher.getInstance("AES");
		dcipher.init(Cipher.DECRYPT_MODE, skey);

		byte[] clearbyte = dcipher.doFinal(toByte(conntent));
		return new String(clearbyte);
	}

	/**
	 * 加密 AES加密，与Nodejs 保持一致
	 * 
	 * @date 2019-09-23
	 * @param content
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static String encrypt(String content) throws Exception {
		String key = getKey();
		byte[] input = content.getBytes(DEFAULT_CODING);

		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] thedigest = md.digest(key.getBytes(DEFAULT_CODING));
		SecretKeySpec skc = new SecretKeySpec(thedigest, "AES");
		// 算法/模式/补码方式
		Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE, skc);

		byte[] cipherText = new byte[cipher.getOutputSize(input.length)];
		int ctLength = cipher.update(input, 0, input.length, cipherText, 0);
		ctLength += cipher.doFinal(cipherText, ctLength);

		String str = parseByte2HexStr(cipherText);

		return addPasswd(str, key);
	}

	/**
	 * 字符串转字节数组
	 * 
	 * @date 2019-09-23
	 * @param hexString
	 * @return
	 */
	private static byte[] toByte(String hexString) {
		int len = hexString.length() / 2;
		byte[] result = new byte[len];
		for (int i = 0; i < len; i++) {
			result[i] = Integer.valueOf(hexString.substring(2 * i, 2 * i + 2),
					16).byteValue();
		}
		return result;
	}

	/**
	 * 字节转16进制数组
	 * 
	 * @date 2019-09-23
	 * @param buf
	 * @return
	 */
	private static String parseByte2HexStr(byte buf[]) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < buf.length; i++) {
			String hex = Integer.toHexString(buf[i] & 0xFF);
			if (hex.length() == 1) {
				hex = '0' + hex;
			}
			sb.append(hex);
		}
		return sb.toString();
	}

	// code放入加密好的密文中
	public static String addPasswd(String passwd, String code) {
		String tmp = passwd.substring(0, 3);
		String estr = passwd.substring(3, passwd.length());
		return tmp + code + estr;
	}

	// 解密 获取加密后的密码，从中分离出加密code、密码
	public static String getCode(String passwd) {
		String code = passwd.substring(3, 9);// 取出加密的code
		return code;
	}

	// 取出加密的密码
	public static String getPassword(String passwd) {
		String tmp = passwd.substring(0, 3);
		String pwd = passwd.substring(9, passwd.length());
		return tmp + pwd;
	}

	// 获取key
	public static String getKey() {
		String res = "";
		try {
			String[] chars = { "0", "1", "2", "3", "4", "5", "6", "7", "8",
					"9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
					"l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w",
					"X", "y", "z" };
			for (int i = 0; i < 6; i++) {
				Integer id = (int) Math.ceil(Math.random() * 35);
				res += chars[id];
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}

}