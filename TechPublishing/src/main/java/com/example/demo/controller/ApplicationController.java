package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
			map.addAttribute("dashboard1", l1);
			return "UserHome";
		}
	}
	
	@RequestMapping ("/editor")
	public ModelAndView Editor(@ModelAttribute User user, HttpServletRequest request) {
		ModelAndView model= new ModelAndView("editor");
		return model;
	}
	
	@RequestMapping ("/readmore")
	public String readMore( @RequestParam("aid") String aid,HttpServletRequest request,ModelMap map)
	{	int article_id=Integer.parseInt(aid);
		List<Article> article=userservice.getfullArticle(article_id);
		map.addAttribute("article", article);
		return "Article";
	}
	
}
