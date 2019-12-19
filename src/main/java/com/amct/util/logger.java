package com.amct.util;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.amct.service.logService;

@Component
public class logger {

	@Resource
	private logService log;

	private static logger logger;

	@PostConstruct
	public void init() {
		logger = this;
	}

	/**
	 * 
	 * @param user_name
	 *            操作人
	 * @param opt
	 *            日志内容
	 * @param status
	 *            日志状态（debug/info/error）
	 */
	public static void log(Object user_name, String opt, String status,String meu_code) {
		logger.log.insert((String)user_name, opt, status,meu_code);
	}
}
