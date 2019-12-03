package com.amct.controller;

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
}
