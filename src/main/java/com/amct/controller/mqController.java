package com.amct.controller;

import javax.jms.JMSException;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amct.mq.mqUtil;
import com.amct.util.logger;


@Controller
@RequestMapping("/mq")
@Scope("prototype")
public class mqController {

	@RequestMapping("/getMsg")
	@ResponseBody
	public void getmsg(HttpSession session) {
		try {
			mqUtil.mqProducer("正在执行");
			mqUtil.mqConsume();
		} catch (JMSException e) {
			logger.log(session.getAttribute("login_name"), "mq接收消息失败", "error",
					"mq");
		}
	}
}
