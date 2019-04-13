package com.example.demo.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.example.demo.model.User;
import com.example.demo.services.UserService;



@Controller
public class ApplicationController {
	
	@Autowired
	private UserService userservice;
	@RequestMapping("/")
    public String Home() {
	 return "Home";}
	
	@RequestMapping("/welcomepage")
    public String Welcome(HttpServletRequest request) {
	 return "Home";}
	
	@RequestMapping("loginUser")
	public String loginUser(ModelMap map, HttpSession session) {
		if (session.getAttribute("id") != null) 
			return "redirect:userHome";
		
		map.addAttribute("error", "");
		return "Home";
	}
	
	@RequestMapping("userHome")
	public String UserHome(ModelMap map, HttpSession session) {
		if (session.getAttribute("id") == null) {
			return "redirect:loginUser";
		} else { 
			User user=(User)session.getAttribute("user");
			String username=user.getUsername();
			System.out.println(username);
			List<Object[]> l1=userservice.getUserArticleStuff(username);
			System.out.println("**********************");
			
			map.addAttribute("dashboard1", l1);
			//map.addAttribute("user", user);
			map.addAttribute("message", "");
			return "UserHome";
		}
	}
	
	
	
}
