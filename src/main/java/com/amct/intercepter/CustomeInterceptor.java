package com.amct.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CustomeInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// 获得请求路径的uri
		String uri = request.getRequestURI();

		// 判断路径是登出还是登录验证，是这两者之一的话执行Controller中定义的方法
		if (uri.endsWith("/login/login") || uri.endsWith("/login/loginout")
				|| uri.endsWith("/login/regest")) {
			return true;
		}

		// 进入登录页面，判断session中是否有key，有的话重定向到首页，否则进入登录界面
		if (uri.endsWith("/login/") || uri.endsWith("/login")) {
			if (request.getSession() != null
					&& request.getSession().getAttribute("user") != null) {
				response.sendRedirect(request.getContextPath()
						+ "/login/loginout");
			} else {
				return true;
			}
		}
		// 其他情况判断session中是否有key，有的话继续用户的操作
		if (request.getSession() != null
				&& request.getSession().getAttribute("user") != null) {
			return true;
		}

		// 最后的情况就是进入登录页面
		response.sendRedirect(request.getContextPath() + "/login/loginout");
		return false;
	}
}
