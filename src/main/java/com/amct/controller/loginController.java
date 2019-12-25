package com.amct.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.amct.entity.amctUser;
import com.amct.service.amctUserService;

@Controller
@RequestMapping("/login")
@Scope("prototype")
public class loginController {

	@Autowired
	private amctUserService us;

	@ResponseBody
	@RequestMapping(value = "/loginout", method = RequestMethod.GET)
	public ModelAndView loginOut(HttpSession session) {
		session.setAttribute("user", "");
		ModelAndView mv = new ModelAndView("redirect:/login.jsp");
		// ModelAndView mv = new
		// ModelAndView("redirect:/user/save/result");//redirect模式
		// //默认为forward模式
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(String username, String user_key, HttpSession session) {
		amctUser user = us.findByUsername(username, user_key);
		if (user != null) {
			if (user.getStatus() != null && user.getStatus() == 0) {
				session.setAttribute("user", user);
				return "success";
			}
			return "status";
		}
		return "fail";
	}

	/**
	 * 注册
	 */
	@ResponseBody
	@RequestMapping(value = "/regest", method = RequestMethod.GET)
	public Integer regest(String name, String username, String user_key,
			Integer sex, Integer age, String phone, String email,
			String remark, HttpSession session) {
		return us.addUser(name, username, user_key, sex, age, null, phone,
				email, remark);
	}
}
