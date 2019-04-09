package com.example.demo.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Admin;
import com.example.demo.model.Article;
import java.util.*;
import com.example.demo.services.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminservice;
	
	@RequestMapping(value = "/validateAdminLogin", method = RequestMethod.POST)
	public String AdminLogin(@RequestParam("adminname") String adminname, @RequestParam("password")String password, ModelMap map, HttpServletRequest request) {
		if(request.getSession(false).getAttribute("id")!=null){	
			System.out.println("********gdfjhkgh****");
			System.out.println(request.getSession(false).getAttribute("id"));
			return "redirect:adminHome";
		}
			Admin admin = adminservice.validateAdmin( adminname, password);
		if(admin==null) {
			System.out.println("***bla****");
			map.addAttribute("error", "adminname or password invalid");
			return "Home";
		}
		else {
			HttpSession session = request.getSession(true);
			session.setAttribute("id", admin.getAdminid());
			session.setAttribute("admin",admin);
			System.out.println(admin.getAdminname());
			return "redirect:adminHome";
		}
	}
	
	
	@RequestMapping("/logoutAdmin")
	public String logoutAdmin(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
//	@RequestMapping ("/admin_profile")
//	public ModelAndView adminProfile(@ModelAttribute Admin admin, HttpServletRequest request) {
//		ModelAndView model= new ModelAndView("admin_profile");
//		return model;
//	}
//	
//	@RequestMapping (value="/read_article",method=RequestMethod.POST)
//	public ModelAndView readArticle(@ModelAttribute Article article,@RequestParam("newfield") int aid,HttpServletRequest request) {
//		    System.out.println("This is it"+aid);
//	        Article l=adminservice.getArticlesbyId(aid);
//			System.out.println("reached");
//			System.out.println("Article = " + l);
//			ModelAndView model= new ModelAndView("read_article");
//			model.addObject("data",l);
//			return model;
//	}
//
//  
//    @RequestMapping (value="/publisharticle/{id}")
//		public ModelAndView publishUserArticle(@ModelAttribute Admin admin,@PathVariable(value="id") int aid,BindingResult result,HttpSession session,HttpServletRequest request,ModelMap map)
//		{   System.out.println("this is it"+aid);
//			int n=adminservice.setArticles(aid);
//			
//			System.out.println("this is after it is published  "+aid);
//			System.out.println("this is it"+admin.getAdminname());
//			if(n!=0) {
//			List<Article> l=adminservice.getArticles(admin.getAdminname());
//			 System.out.println("this is it"+admin.getAdminname());
//			ModelAndView model= new ModelAndView("admin_review");
//			model.addObject("articles",l);
//			return model;
//		}
//		else  {
//			ModelAndView model= new ModelAndView("welcome_new");
//					return model;
//			
//		}
//	  }
//    
//    @RequestMapping (value="/rejectarticle/{id}")
//	public ModelAndView rejectUserArticle(@ModelAttribute Admin admin,@PathVariable(value="id") int aid,BindingResult result,HttpSession session,HttpServletRequest request,ModelMap map)
//	{   System.out.println("this is it"+aid);
//		int n=adminservice.rejectArticles(aid);
//		
//		System.out.println("this is after it is rejected  "+aid);
//		System.out.println("this is it"+admin.getAdminname());
//		if(n!=0) {
//		List<Article> l=adminservice.getArticles(admin.getAdminname());
//		 System.out.println("this is it"+admin.getAdminname());
//		ModelAndView model= new ModelAndView("admin_review");
//		model.addObject("articles",l);
//		return model;
//	}
//	else  {
//		ModelAndView model= new ModelAndView("welcome_new");
//		return model;
//		
//	 }
// }
    
}
