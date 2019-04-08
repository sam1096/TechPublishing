package com.example.demo.controller;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.User;
import com.example.demo.model.UserArea;
import com.example.demo.services.UserService;
import com.example.demo.model.AreaInterest;
import com.example.demo.model.Article;

import com.example.demo.model.Comment;



@Controller
public class UserController {
	
	@Autowired
	private UserService userservice;
	String aid;

	@PostMapping("/save-user")
	public ModelAndView registerUser(@ModelAttribute User user,BindingResult bindingresult,HttpServletRequest request)
	{
		userservice.saveMyUser(user);
		HttpSession session = request.getSession(true);
		session.setAttribute("id", user.getId());
		session.setAttribute("user", user);	
		List<AreaInterest>list=userservice.getallCategories();
		ModelAndView model= new ModelAndView("area_of_interest");
		model.addObject("categories",list);
		return model;
	}

	@RequestMapping(value = "/validateUserLogin", method = RequestMethod.POST)
	public String UserLogin(@RequestParam("username") String username, @RequestParam("password")String password, ModelMap map, HttpServletRequest request) {
		if(request.getSession(false).getAttribute("id")!=null){	
			return "redirect:userHome";
		}
		User user = userservice.validateUser(username,password);
		if(user==null) {
			map.addAttribute("error", "username or password invalid");
			return "Login";
		}
		else {
			HttpSession session = request.getSession(true);
			session.setAttribute("id", user.getId());
			session.setAttribute("user", user);	
			return "redirect:userHome";
		}
	}
	
	@RequestMapping("/logoutUser")
	public String logoutPublisher(HttpSession session) {
		session.invalidate();
		return "redirect:welcomepage";
	}
	
	@RequestMapping(value = "/userProfile")
	public String userProfile(ModelMap map,HttpSession session)
	{
		User user=(User)session.getAttribute("user");
		System.out.println(user.getUsername());
		map.addAttribute("user", user);
		List<Article> articleinfo=userservice.getArticleByUser(user.getUsername());
		List<UserArea>area=userservice.getAreaByUser(user.getUsername());
		List<AreaInterest>userarea=new ArrayList<AreaInterest>();
		for(int i=0;i<area.size();i++)
		{
			userarea.add((userservice.getAreaInterestById(area.get(i).getAreaid())).get(0));
		}
		map.addAttribute("userarea", userarea);
		map.addAttribute("articleinfo", articleinfo);
		return "UserProfile";
	}
	
	@RequestMapping ("/submitarea")
	public String AreaOfInterest( HttpServletRequest request,@RequestParam("area") List<String> list, ModelMap map) {
		User user=(User)request.getSession(false).getAttribute("user");
		System.out.println(user.getUsername());
		for(int i=0;i<list.size();i++)
			System.out.println(list.get(i));
		userservice.saveAreas(user.getUsername(),list);
		
		return "redirect:userHome";
	}
	
	
	@RequestMapping ("/saveArticle")
	public String saveArticle(@ModelAttribute Article art,ModelMap map,HttpServletRequest request,@RequestParam("areas")String areaname)
	{
		User user=(User)request.getSession(false).getAttribute("user");
		System.out.println("*******************************************");
		System.out.println(user.getId());
		System.out.println("usernme is: "+user.getUsername());
		System.out.println("*******************************************");
		art.setAuthname(user.getUsername());
		String areaid=userservice.findAreaInterest(areaname).get(0).getAreaid();
		art.setAreaid(areaid);
		art.setStatus("in review");
		userservice.saveArticle(art);
		map.addAttribute("message", "Successfully saved");
		return "redirect:userHome";
	}
	
	@RequestMapping("/comment_section")
	public String comment_section(@RequestParam("articleId") int id,@ModelAttribute Comment cmt,HttpServletRequest request,ModelMap map) {
		
		System.out.println("commentSection*************************************");
		System.out.println("article id: "+id);
		System.out.println("*************************************");
		System.out.println(id);
		System.out.println("*************************************");
		cmt.setArtid(id);
		System.out.println(cmt.getArtid()+" "+cmt.getAuthname()+" "+cmt.getComdesc());
		aid=String.valueOf(id);
		System.out.println("##########################################");
		userservice.save_comment(cmt);
		//List<Comment> list=userservice.getComment(id);
		//map.addAttribute("commentList", list);
		return "redirect:readmore/{aid}";
	}
	
	
}
