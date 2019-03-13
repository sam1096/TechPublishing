package com.example.demo.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Admin;
import com.example.demo.model.Article;
import java.util.*;
import com.example.demo.services.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminservice;
	
	@RequestMapping ("/login-admin")
	public ModelAndView loginAdmin(@ModelAttribute Admin admin, HttpServletRequest request) {
		if(adminservice.findByAdminnameAndPassword(admin.getAdminname(), admin.getPassword())!=null) {
			System.out.println("reached");
			List<Article> l=adminservice.getArticles(admin.getAdminname());
			ModelAndView model= new ModelAndView("admin_review");
			model.addObject("articles",l);
			return model;
		}
		else  {
			//request.setAttribute("error", "Invalid Username or Password");
			//request.setAttribute("mode", "MODE_LOGIN");
			//System.out.println(user.getPassword());
			//System.out.println(user.getUsername());
			ModelAndView model= new ModelAndView("welcome_new");
					return model;
			
		}
	}
}
