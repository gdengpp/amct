package com.amct.controller;

import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/login")
@Scope("prototype")
public class loginController {

	@ResponseBody
	@RequestMapping(value="/loginout",method=RequestMethod.GET)
	public String loginOut(){
		
		return "/login";
	}
	@ResponseBody
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(String name,String password,HttpSession session){
		session.setAttribute("logi_nname", name);
		return "/main";
	}
	
	
}
