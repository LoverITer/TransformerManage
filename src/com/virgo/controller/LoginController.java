package com.virgo.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login")
public class LoginController {
	@RequestMapping(value="/userCheck",method=RequestMethod.POST)
	public void userCheck(HttpServletRequest request ,HttpServletResponse response, String username,String password) throws IOException {
		if(username.equals("admin")&&password.equals("admin")){
			response.sendRedirect("../pandect/pandectShow");
		}else {
			response.sendRedirect("../");
		}
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public void userLogout(HttpServletResponse response){
		try {
			response.sendRedirect("../");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
