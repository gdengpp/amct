package com.amct.util;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 通过ThreadLocal 操作request,response,session
 * @author 李老湿
 */
public class ContextUtil {

	private static  ThreadLocal<HttpServletRequest> requestLocal = new ThreadLocal<HttpServletRequest>();
	private static  ThreadLocal<HttpServletResponse> responseLocal = new ThreadLocal<HttpServletResponse>();
	
	/**
	 * 设置request
	 */
	public static void setRequest(HttpServletRequest req){
		requestLocal.set(req);
	}
	
	/**
	 * 获得request
	 */
	public static HttpServletRequest getRequest(){
		return requestLocal.get();
	}
	/**
	 * 设置response
	 */
	public static void setResponse(HttpServletResponse res){
		responseLocal.set(res);
	}
	/**
	 * 获得response
	 */
	public static HttpServletResponse getResponse(){
		return responseLocal.get();
	}
	
	/**
	 * 获得session
	 */
	public static HttpSession getSession(){
		return getRequest().getSession();
	}
	
}
