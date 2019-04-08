package com.example.demo.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.User;
import com.example.demo.services.UserService;
import com.example.demo.model.Admin;
import com.example.demo.model.Article;
import com.example.demo.model.Comment;
import com.example.demo.model.AreaInterest;

import com.example.demo.services.AdminService;

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
	
	@RequestMapping ("/editor")
	public String Editor(HttpSession session,ModelMap map) {
		if (session.getAttribute("id") == null) {
			return "redirect:loginUser";
		}
		User user = (User)session.getAttribute("user");
		map.addAttribute("user", user);
		List<AreaInterest> list=userservice.getallCategories();
		map.addAttribute("areainterest", list);
		return "editor";
	}
	
	
	@RequestMapping ("/readmore")
	public String readMore( @RequestParam("aid") String aid,HttpServletRequest request,ModelMap map)
	{	int article_id=Integer.parseInt(aid);
		List<Article> article=userservice.getfullArticle(article_id);
		List<Comment> list=userservice.getComment(article_id);
		map.addAttribute("commentList", list);
		map.addAttribute("article", article);
		map.addAttribute("article_id",article_id);
		return "Article";
}
	
}
