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
import com.example.demo.model.AdminArea;
import com.example.demo.model.AreaInterest;
import com.example.demo.model.Article;
import com.example.demo.model.User;

import java.util.*;
import com.example.demo.services.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminservice;
	
	@RequestMapping(value = "/validateAdminLogin", method = RequestMethod.POST)
	public String AdminLogin(@RequestParam("adminname") String adminname, @RequestParam("password")String password, ModelMap map, HttpServletRequest request) {
		if(request.getSession(false).getAttribute("id")!=null){	
			return "redirect:adminHome";
		}
			Admin admin = adminservice.validateAdmin( adminname, password);
		if(admin==null) {
			System.out.println("***bla****");
			map.addAttribute("error", "Invalid Username or Password");
			return "Home";
		}
		else {
			HttpSession session = request.getSession(true);
			session.setAttribute("id", admin.getAdminid());
			session.setAttribute("admin",admin);
			System.out.println(admin.getAdminname());
		
			System.out.println(admin);
			
			return "redirect:adminHome";
		}
	}
	
	
	@RequestMapping("/logoutAdmin")
	public String logoutAdmin(HttpSession session) {
		System.out.println("***************logout**************************");
		session.invalidate();
		return "redirect:/";
	}
	

	
	
	@RequestMapping("/admin_profile")
	public String adminProfile(ModelMap map,HttpSession session) {
	
		Admin admin=(Admin)session.getAttribute("admin");
		map.addAttribute("admin", admin);
	    
		return "admin_profile";
	}
	
	@RequestMapping("/admin_area")
	public String adminArea(ModelMap map,HttpSession session) {
	
		Admin admin=(Admin)session.getAttribute("admin");
		List<AdminArea> ls=adminservice.getInterestByAdminName(admin.getAdminname());
		List<AreaInterest> l=new ArrayList<AreaInterest>();
		for(int i=0;i<ls.size();i++)
		{ l.add((adminservice.getInterestById(ls.get(i).getAreaid()).get(0)));
			
		}
		
		map.addAttribute("interest", l);
		return "Admin_areaOfInt";
	}
	
	
	@RequestMapping("/admin_reviewed")
	public String adminreview(ModelMap map,HttpSession session) {
	
		Admin admin=(Admin)session.getAttribute("admin");
		List<Article> l=adminservice.getArticlesbyAdminName(admin.getAdminname());
		map.addAttribute("admin", admin);
		map.addAttribute("articles",l);
		
		return "admin_reviewed";
	}
	

	@RequestMapping("/admin_pass")
	public String adminpass(ModelMap map,HttpSession session) {
	
		Admin admin=(Admin)session.getAttribute("admin");
	
		map.addAttribute("admin", admin);
		
		
		return "admin_pass";
	}
	
	@RequestMapping("/admin_myArticles")
	public String adminmyarticle(ModelMap map,HttpSession session) {
	
		Admin admin=(Admin)session.getAttribute("admin");
		List<Article> l=adminservice.getArticlesbyAdmin(admin.getAdminname());
		map.addAttribute("admin", admin);
		map.addAttribute("articles",l);
		
		return "admin_myArticles";
	}
	
	
	
	@RequestMapping (value="/read_article",method=RequestMethod.POST)
	public ModelAndView readArticle(@ModelAttribute Article article,@RequestParam("newfield") int aid,HttpServletRequest request) {
		    System.out.println("This is it"+aid);
	        Article l=adminservice.getArticlesbyId(aid);
			System.out.println("reached");
			System.out.println("Article = " + l);
			ModelAndView model= new ModelAndView("read_article");
			model.addObject("data",l);
			return model;
	}

  
    @RequestMapping (value="/publisharticle/{id}")
		public ModelAndView publishUserArticle(@ModelAttribute Admin admin,@PathVariable(value="id") int aid,BindingResult result,HttpSession session,HttpServletRequest request,ModelMap map)
		{   System.out.println("this is it"+aid);
		    Admin adm=(Admin)session.getAttribute("admin");
			int n=adminservice.setArticles(aid,adm.getAdminname());
			
			System.out.println("this is after it is published  "+aid);
			System.out.println("***********this is it************"+admin.getAdminname());
			if(n!=0) {
			List<Article> l=adminservice.getArticles(adm.getAdminname());
			 System.out.println("this is it"+admin.getAdminname());
			ModelAndView model= new ModelAndView("admin_review");
			model.addObject("articles",l);
			return model;
		}
		else  {
			ModelAndView model= new ModelAndView("welcome_new");
					return model;
			
		}
	  }
 
    @RequestMapping ("/editor_admin")
	public String Editor(HttpSession session,ModelMap map) {
		if (session.getAttribute("id") == null) {
			return "redirect:loginAdmin";
		}
		Admin admin = (Admin)session.getAttribute("admin");
		map.addAttribute("admin", admin);
		List<AreaInterest> list=adminservice.getallCategories();
		map.addAttribute("areainterest", list);
		return "editorAdmin";
	}
    
    

	@RequestMapping ("/saveadminArticle")
	public String saveArticle(@ModelAttribute Article art,ModelMap map,HttpServletRequest request,@RequestParam("areas")String areaname)
	{
		Admin admin=(Admin)request.getSession(false).getAttribute("admin");
		
		Date date = new Date(); 
		art.setAuthname(admin.getAdminname());
		String areaid=adminservice.findAreaInterest(areaname).get(0).getAreaid();
		art.setAreaid(areaid);
		art.setStatus("in review");
		art.setPostdate(date);
		adminservice.saveArticle(art);
		map.addAttribute("message", "Successfully saved");
		return "redirect:userHome";
	}
    
    
    
	
    
  @RequestMapping (value="/rejectarticle/{id}")
	public ModelAndView rejectUserArticle(@ModelAttribute Admin admin,@PathVariable(value="id") String id,BindingResult result,HttpSession session,HttpServletRequest request)
	{ 
	
	    String[] temp=id.split("_");
	    
	    int aid=Integer.parseInt(temp[0]);
	    String reas=temp[1];
	    Admin adm=(Admin)session.getAttribute("admin");
		int n=adminservice.rejectArticles(aid,reas,adm.getAdminname());
		
	
		if(n!=0) {
		List<Article> l=adminservice.getArticles(admin.getAdminname());
		 System.out.println("this is it"+admin.getAdminname());
		ModelAndView model= new ModelAndView("admin_review");
		model.addObject("articles",l);
		return model;
	}
	else  {
		ModelAndView model= new ModelAndView("welcome_new");
		return model;
		
	 }
 }
    
  @RequestMapping(value = "/change_password", method = RequestMethod.POST)
	public String changePassword(@RequestParam("password")String password, ModelMap map, HttpServletRequest request,HttpSession session) {
//		if(request.getSession(false).getAttribute("id")!=null){	
//			return "redirect:adminHome";
//		}
	    Admin admin=(Admin)session.getAttribute("admin");
	    Admin Adm=adminservice.setPassword(admin.getAdminid(),password);
		session.setAttribute("admin",Adm);
		map.addAttribute("admin", Adm);
		return "admin_profile";
		
  }
}
