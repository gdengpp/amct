package com.amct.util;


import java.util.Random;

import org.junit.Test;

public class CodeUtil {

	public static String getCode(int len){
		
		//第一步定义一个字典
		String a = "1234567890";
		
		//第二步创建一个随机数
		Random r = new Random();
		
		//第三步定义一个数组填充数组
		char[] c = new char[len];
		
		for (int i = 0; i < c.length; i++) {
			c[i] = a.charAt(r.nextInt(a.length()));
		}
		
		
		return new String(c);
		
	}
	
	@Test
	public void test(){
		
		System.out.println(getCode(6));
		
	}
}
