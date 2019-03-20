package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.User;
import com.example.demo.services.UserService;
import com.example.demo.model.Admin;
import com.example.demo.model.Article;
import com.example.demo.model.AreaInterest;

import com.example.demo.services.AdminService;

@Controller
public class ApplicationController {

	@Autowired
	private UserService userservice;
	
@Autowired
	private AdminService adminservice;
	
	@RequestMapping("/test")
    public String Test(HttpServletRequest request) {
	 return "welcome_new";
 }
	
	
	@RequestMapping("/welcomepage")
    public String Welcome(HttpServletRequest request) {
		
	 return "Home";
 }
	
	@RequestMapping("/register")
	public String registration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER");
		return "welcome1";
	}
	
	@PostMapping("/save-user")
	public ModelAndView registerUser(@ModelAttribute User user,BindingResult bindingresult,HttpServletRequest request)
	{
		userservice.saveMyUser(user);
		//request.setAttribute("mode", "MODE_HOME");
		List<AreaInterest>list=userservice.getallCategories();
		ModelAndView model= new ModelAndView("area_of_interest");
		model.addObject("categories",list);
		return model;
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LOGIN");
		return "welcome1";
	}
	
	@RequestMapping ("/login-user")
	public ModelAndView loginUser(@ModelAttribute User user, HttpServletRequest request) {
		if(userservice.findByUsernameAndPassword(user.getUsername(), user.getPassword())!=null) {
			System.out.println("reached");
			//String username =request.getParameter("username");
			//session.setAttribute("username", username);
			List<Object[]> l1=userservice.getUserArticleStuff(user.getUsername());
			//List<AreaInterest> l2=userservice.getUserAreaStuff(user.getUsername());
			ModelAndView model= new ModelAndView("UserHome");
			model.addObject("dashboard1",l1);
			//model.addObject("dashboard2",l2);
			return model;
		}
		else  {
			//request.setAttribute("error", "Invalid Username or Password");
			//request.setAttribute("mode", "MODE_LOGIN");
			System.out.println(user.getPassword());
			System.out.println(user.getUsername());
			ModelAndView model= new ModelAndView("homepage");
			
			return model;
			
		}
	}
	@RequestMapping ("/editor")
	public ModelAndView Editor(@ModelAttribute User user, HttpServletRequest request) {
		ModelAndView model= new ModelAndView("editor");
		return model;
	}
	
}
